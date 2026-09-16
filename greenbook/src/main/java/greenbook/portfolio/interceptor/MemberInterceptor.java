package greenbook.portfolio.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        // 현재 세션 가져오기
        HttpSession session = request.getSession();

        // 로그인한 사용자 확인
        Object user = session.getAttribute("user");

        // 로그인하지 않은 경우
        if (user == null) {

            // 로그인 페이지로 이동
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            // Controller 실행 막기
            return false;
        }

        // 로그인되어 있으면 Controller 실행
        return true;
    }
}