package com.gd.workpp.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		// true 리턴시 : 기존의 흐름대로 해당 Controller 제대로 실행
		// false 리턴시 : Controller를 실행시키지 않겠다.
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) { // 로그인 후
			return true;
		}else { // 로그인 전 => controller 실행 안되고 다른페이지 띄우기
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
	}
	
	
}
