package greenbook.portfolio.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import greenbook.portfolio.domain.MemberDto;
import greenbook.portfolio.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private MemberService memberService;

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        HttpSession session = request.getSession();

        // 1. 현재 세션에 로그인한 사용자가 있는지 확인
        MemberDto user = (MemberDto) session.getAttribute("user");

        // 2. 로그인 상태가 아니라면 자동로그인 쿠키 확인
        if (user == null) {

            Cookie loginCookie =
                    WebUtils.getCookie(request, "loginCookie");

            if (loginCookie != null) {

                String token = loginCookie.getValue();

                // 3. 쿠키의 UUID로 DB에서 회원 조회
                user = memberService.getMemberByCookie(token);

                // 4. 회원이 존재하면 자동로그인
                if (user != null) {

                    session.setAttribute("user", user);

                } else {

                    // DB에 해당 토큰이 없거나
                    // 자동로그인 기간이 만료된 경우 쿠키 제거
                    loginCookie.setPath("/");
                    loginCookie.setMaxAge(0);

                    response.addCookie(loginCookie);
                }
            }
        }

        // Controller 계속 실행
        return true;
    }
}