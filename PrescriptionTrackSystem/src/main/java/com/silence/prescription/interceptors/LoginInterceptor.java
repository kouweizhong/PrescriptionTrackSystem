package com.silence.prescription.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {


	// 调用方法之前调用，做权限，日志，事务
	//调用管理员的管理方法之前查看用户是否已经登陆
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("doctor") == null){
		    response.sendRedirect("login.html?noLogin=true");
		    return false;
		}
		return true;
	}

	// 调用方法之后，但在渲染视图之前调用,可以对请求yu中的数据更改
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	// 渲染视图之后被调用
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
}
