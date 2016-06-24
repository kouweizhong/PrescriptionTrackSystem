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
			//返回登录界面
		    response.sendRedirect(request.getContextPath()+"/login.html?noLogin=true");
		    return false;
		}
		/*
		String params = request.getServletContext().getInitParameter("permission");
		//permissions保存需要权限访问的路径信息
		List<String> permissions = Arrays.asList(params.split(","));
		//requestPath获取访问路径信息
		String requestPath = request.getServletPath().split("/")[1];
		boolean flag = false;
		//如果访问的请求需要权限的验证
		if (permissions.contains(requestPath)){
			//判断该登录的医师是否有权限操作
			if (flag){
				return true;
			}else{
				//获取请求地址的绝对路径
				String requestURL = request.getRequestURL().toString();
				//获取请求参数
				String queryString = request.getQueryString();
				if (queryString != null){
					requestURL += ("?" + queryString);
				}
				if (requestURL == "deletePre"){
					request.getRequestDispatcher(requestURL).forward(request, response);
				}else{
					response.getWriter().print(2);
				}
				return false;
			}
		}*/
		return true;
	}

	// 调用方法之后，但在渲染视图之前调用,可以对请求yu中的数据更改
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	// 渲染视图之后被调用
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
