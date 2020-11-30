package org.goal.rgas.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginInterceptor implements HandlerInterceptor {
	// 로그인 여부 확인
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession();
		
		if ("A".equals((String) session.getAttribute("auth")) || "C".equals((String) session.getAttribute("auth"))) {
			return true;
		} else {
			response.sendRedirect("/login");
			return false;
		}
	}
}
