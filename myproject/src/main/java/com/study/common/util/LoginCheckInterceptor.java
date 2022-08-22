package com.study.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study.login.vo.UserVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();   
		UserVO user=(UserVO)session.getAttribute("USER_INFO");
		if(user==null) {
			response.sendRedirect(request.getContextPath()+"/login/login.wow");
			return false;
		}
		return true;
	}
}