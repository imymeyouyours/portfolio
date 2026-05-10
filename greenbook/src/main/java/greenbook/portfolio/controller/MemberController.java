package greenbook.portfolio.controller;

import greenbook.portfolio.domain.MemberDto;
import greenbook.portfolio.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.UUID;

@RestController
@RequestMapping("/api")
public class MemberController {

    @Autowired
    MemberService memberService;

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
            return new ResponseEntity<>("LOGOUT_ERR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}



