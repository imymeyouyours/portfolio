package greenbook.portfolio.controller;

import greenbook.portfolio.domain.*;
import greenbook.portfolio.pagination.Criteria;
import greenbook.portfolio.pagination.PageMaker;
import greenbook.portfolio.service.CartService;
import greenbook.portfolio.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@RestController
@RequestMapping("/api")
public class MemberController {

    @Autowired
    MemberService memberService;

    @Autowired
    CartService cartService;

    @Autowired
    JavaMailSender mailSender;

    @PostMapping("/id/check")
    public ResponseEntity<String> idCheck(@RequestParam("id") String id) {

        try {

            if (id == null || !id.matches("^[a-z0-9_-]{5,20}$")) {
                return ResponseEntity
                        .badRequest()
                        .body("INVALID");
            }

            MemberDto member = memberService.getMember(id);

            if (member == null) {
                return ResponseEntity.ok("POSSIBLE");
            }

            return ResponseEntity.ok("DUPLICATE");

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("ERROR");
        }
    }

    @PostMapping("/signup")
    public ResponseEntity<String> signup(@RequestBody MemberDto user) {

        try {

            int result = memberService.signup(user);

            if (result == 1) {
                return ResponseEntity.ok("SIGNUP_OK");
            }

            return ResponseEntity
                    .badRequest()
                    .body("SIGNUP_FAIL");

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("ERROR");
        }
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody MemberDto member, HttpSession session, HttpServletResponse response) {

        try {

            MemberDto user = memberService.getLogin(member);

            if (user == null)
                throw new Exception("LOGIN FAILED");

            session.setAttribute("user", user);

            if (member.getUseCookie()) {
                String token = UUID.randomUUID().toString();

                Cookie loginCookie =
                        new Cookie("loginCookie", token);

                int timeSecond = 60 * 60 * 24 * 7;

                loginCookie.setPath("/");
                loginCookie.setMaxAge(timeSecond);

                response.addCookie(loginCookie);

                MemberDto updateUser = new MemberDto();
                updateUser.setMe_id(member.getMe_id());
                updateUser.setMe_session_id(token);
                updateUser.setMe_session_limit(new Date(
                        System.currentTimeMillis()
                                + timeSecond * 1000L
                ));

                memberService.updateLogin(updateUser);

            }

            return new ResponseEntity<>("LOGIN_OK", HttpStatus.OK);

        } catch (Exception e) {

            e.printStackTrace();
            return new ResponseEntity<>("LOGIN_ERR", HttpStatus.BAD_REQUEST);

        }
    }

    @GetMapping("/logout")
    public ResponseEntity<String> logout(
            HttpSession session,
            HttpServletRequest request,
            HttpServletResponse response) {

        try {

            MemberDto user = (MemberDto) session.getAttribute("user");

            Cookie[] cookies = request.getCookies();

            if (cookies != null) {
                for (Cookie cookie : cookies) {

                    if ("loginCookie".equals(cookie.getName())) {

                        cookie.setPath("/");
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);

                        if (user != null) {
                            MemberDto updateUser = new MemberDto();
                            updateUser.setMe_id(user.getMe_id());
                            updateUser.setMe_session_id(null);
                            updateUser.setMe_session_limit(null);

                            memberService.updateLogin(updateUser);
                        }
                    }
                }
            }

            session.invalidate();

            return new ResponseEntity<>("LOGOUT_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("LOGOUT_ERR", HttpStatus.BAD_REQUEST);
        }
    }


    @PostMapping("/find/id")
    public ResponseEntity<String> findId(@RequestParam String email) {

        try {
            List<MemberDto> userList = memberService.getEmail(email);

            if (userList == null || userList.isEmpty()) {
                return new ResponseEntity<>("EMAIL_NOT_FOUND", HttpStatus.OK);
            }

            List<String> idList = new ArrayList<>();

            for (MemberDto user : userList) {
                idList.add(user.getMe_id());
            }

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper
                    = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom("kih9079@naver.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
            messageHelper.setTo(email);     // 받는사람 이메일
            messageHelper.setSubject("가입된 아이디입니다."); // 메일제목은 생략이 가능하다
            messageHelper.setText("가입된 아이디는 <b>" + String.join(", ", idList) + "</b>입니다.", true); // 메일 내용

            mailSender.send(message);


            return new ResponseEntity<>("FIND_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("FIND_ERR", HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @GetMapping("/mypage")
    public ResponseEntity<Map<String, Object>> getMyPage(
            HttpSession session,
            Criteria cri) {

        try {

            MemberDto member =
                    (MemberDto) session.getAttribute("user");

            // 로그인 확인
            if (member == null) {
                return new ResponseEntity<>(
                        HttpStatus.UNAUTHORIZED
                );
            }

            // 페이지네이션
            cri.setPerPageNum(5);

            PageMaker pm = new PageMaker();

            pm.setCriteria(cri);
            pm.setDisplayPageNum(5);

            int totalCount =
                    memberService.getTotalCountMyPage(
                            member.getMe_id()
                    );

            pm.setTotalCount(totalCount);
            pm.calcData();

            // 주문 목록
            List<OrderDto> orderList =
                    cartService.selectOrderList(
                            member.getMe_id(),
                            cri
                    );

            // JSON으로 반환할 데이터
            Map<String, Object> result =
                    new HashMap<>();

            result.put("member", member);
            result.put("orderList", orderList);
            result.put("pm", pm);

            return ResponseEntity.ok(result);

        } catch (Exception e) {

            e.printStackTrace();

            return new ResponseEntity<>(
                    HttpStatus.BAD_REQUEST
            );
        }
    }

    @GetMapping("/mypagedetails")
    public ResponseEntity<Map<String, Object>> getMyPageDetails(
            @RequestParam("or_num") String or_num,
            HttpSession session) {

        try {

            // 로그인 회원 확인
            MemberDto member =
                    (MemberDto) session.getAttribute("user");

            if (member == null) {
                return new ResponseEntity<>(
                        HttpStatus.UNAUTHORIZED
                );
            }


            String checkId =
                    member.getMe_id();


            // 주문번호 확인
            if (or_num == null || or_num.trim().isEmpty()) {
                return new ResponseEntity<>(
                        HttpStatus.BAD_REQUEST
                );
            }


            // 주문 상세 상품
            List<ParticularsDto> particulars =
                    cartService.getParticularsList(
                            or_num
                    );


            // 주문 정보
            OrderDto order =
                    cartService.detailOrderList(
                            or_num,
                            checkId
                    );


            // 본인 주문이 아니거나 존재하지 않는 주문
            if (order == null) {
                return new ResponseEntity<>(
                        HttpStatus.NOT_FOUND
                );
            }


            // 배송 정보
            ShippingDto shipping =
                    cartService.detailShippingList(
                            or_num,
                            checkId
                    );


            // 결제 정보
            PaymentDto payment =
                    cartService.detailPaymentList(
                            or_num
                    );


            // JSON 결과
            Map<String, Object> result =
                    new HashMap<>();

            result.put(
                    "payment",
                    payment
            );

            result.put(
                    "shipping",
                    shipping
            );

            result.put(
                    "order",
                    order
            );

            result.put(
                    "particulars",
                    particulars
            );


            return ResponseEntity.ok(
                    result
            );


        } catch (Exception e) {

            e.printStackTrace();

            return new ResponseEntity<>(
                    HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }



    @GetMapping("/greenpoint")
    public ResponseEntity<Map<String, Object>> getGreenPoint(
            Criteria cri,
            HttpSession session) {

        try {
            MemberDto member =
                    (MemberDto) session.getAttribute("user");

            if (member == null) {
                return new ResponseEntity<>(
                        HttpStatus.UNAUTHORIZED
                );
            }

            PageMaker pm = new PageMaker();

            cri.setPerPageNum(5);

            pm.setCriteria(cri);
            pm.setDisplayPageNum(5);

            int totalCount =
                    memberService.getTotalCountGreenPoint(
                            member.getMe_id()
                    );

            pm.setTotalCount(totalCount);
            pm.calcData();

            List<PointDto> pointList =
                    memberService.getPointList(
                            member.getMe_id(),
                            cri
                    );

            Map<String, Object> result =
                    new HashMap<>();

            result.put("member", member);
            result.put("pointList", pointList);
            result.put("pm", pm);

            return ResponseEntity.ok(result);

        } catch (Exception e) {

            e.printStackTrace();

            return new ResponseEntity<>(
                    HttpStatus.BAD_REQUEST
            );
        }
    }

    @GetMapping("/memberinfo")
    public ResponseEntity<MemberDto> getMemberInfo(
            HttpSession session) {

        MemberDto user =
                (MemberDto) session.getAttribute("user");

        if (user == null) {
            return new ResponseEntity<>(
                    HttpStatus.UNAUTHORIZED
            );
        }

        return ResponseEntity.ok(user);
    }

    @PostMapping("/memberinfo")
    public ResponseEntity<String> memberInfoPost(
            @RequestBody MemberDto user,
            HttpSession session) {

        try {

            MemberDto sessionUser =
                    (MemberDto) session.getAttribute("user");

            if (sessionUser == null) {
                return new ResponseEntity<>(
                        "LOGIN_REQUIRED",
                        HttpStatus.UNAUTHORIZED
                );
            }

            if (!sessionUser.getMe_id()
                    .equals(user.getMe_id())) {

                return new ResponseEntity<>(
                        "MEMBER_MISMATCH",
                        HttpStatus.FORBIDDEN
                );
            }

            MemberDto updateUser =
                    memberService.updateMember(user);

            if (updateUser == null) {

                return new ResponseEntity<>(
                        "UPDATE_ERR",
                        HttpStatus.BAD_REQUEST
                );
            }

            session.setAttribute(
                    "user",
                    updateUser
            );

            return new ResponseEntity<>(
                    "UPDATE_OK",
                    HttpStatus.OK
            );

        } catch (Exception e) {

            e.printStackTrace();

            return new ResponseEntity<>(
                    "UPDATE_ERR",
                    HttpStatus.BAD_REQUEST
            );
        }
    }

    @ResponseBody
    @GetMapping("/find/pw/{id}")
    public String findPw(@PathVariable("id") String id) {

        MemberDto user = memberService.getMemberId(id);

        if (user == null) {
            return "FAIL";
        }

        try {
            String newPw = newPw();

            MimeMessage message = mailSender.createMimeMessage();

            MimeMessageHelper messageHelper =
                    new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom("kih9079@naver.com");
            messageHelper.setTo(user.getMe_email());
            messageHelper.setSubject("새 비밀번호를 발급합니다.");

            messageHelper.setText(
                    "",
                    "발급된 새 비밀번호는 <b>" + newPw + "</b>입니다."
            );

            // 메일 발송
            mailSender.send(message);

            // 메일 발송 성공 후 DB 변경
            user.setMe_password(newPw);
            memberService.updateMember(user);

            return "SUCCESS";

        } catch (Exception e) {
            e.printStackTrace();
            return "FAIL";
        }
    }

    //8자리의 숫자 or 영어대소문자로 된 비밀번호
    private String newPw() {
        //랜덤숫자 : 0~9 => 문자열 : 0~9
        //랜덤숫자 : 10~35 => 문자열 : a~z
        //랜덤숫자 : 36~61 => 문자열 : A~Z
        //12 =>c
        String pw="";
        int max = 61, min = 0;
        for(int i=0; i<8; i++) {
            int r = (int)(Math.random()*(max-min+1)) + min;
            //int r = (int)(Math.random()*62);
            if(r <= 9) {
                pw += r;
            }else if(r<=35) {
                pw += (char)('a'+(r-10));
            }else {
                pw += (char)('A'+(r-36));
            }
        }
        return pw;
    }


    @PostMapping("/memberout")
    public ResponseEntity<String> memberDelete(
            @RequestBody MemberDto memberDto,
            HttpSession session) {

        try {

            // 현재 로그인한 회원
            MemberDto user =
                    (MemberDto) session.getAttribute("user");

            if (user == null) {
                return ResponseEntity
                        .status(HttpStatus.UNAUTHORIZED)
                        .body("LOGIN_REQUIRED");
            }

            // 입력한 아이디 / 비밀번호 확인
            MemberDto loginUser =
                    memberService.login(memberDto);

            if (loginUser == null) {
                return ResponseEntity
                        .badRequest()
                        .body("PASSWORD_FAIL");
            }

            // 회원 탈퇴
            int result =
                    memberService.memberDelete(user);

            if (result != 1) {
                return ResponseEntity
                        .status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body("DELETE_FAIL");
            }

            // 세션 삭제
            session.invalidate();

            return ResponseEntity.ok("DELETE_OK");

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("ERROR");
        }
    }

}



