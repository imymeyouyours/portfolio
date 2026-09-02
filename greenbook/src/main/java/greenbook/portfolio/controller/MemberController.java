package greenbook.portfolio.controller;

import greenbook.portfolio.domain.MemberDto;
import greenbook.portfolio.domain.PointDto;
import greenbook.portfolio.pagination.Criteria;
import greenbook.portfolio.pagination.PageMaker;
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
    JavaMailSender mailSender;

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

}



