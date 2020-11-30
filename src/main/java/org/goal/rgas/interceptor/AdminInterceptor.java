package org.goal.rgas.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
	//관리자만 권한 확인
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession();
		
		if ("A".equals((String) session.getAttribute("auth"))) {
			return true;
		} else {
			response.sendRedirect("/home");
			return false;
		}
	}
}
