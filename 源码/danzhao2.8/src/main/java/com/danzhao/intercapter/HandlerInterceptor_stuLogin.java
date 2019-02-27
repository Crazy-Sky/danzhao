package com.danzhao.intercapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class HandlerInterceptor_stuLogin implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	/*preHandle方法：进入Handler方法之前执行。可以用于身份认证、身份授权。
	比如如果认证没有通过表示用户没有登陆，需要此方法拦截不再往下执行（return false），
	否则就放行（return true）*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		if(request.getSession().getAttribute("student") == null){
			System.out.println("学生未登录");
			response.sendRedirect(request.getContextPath()+"/stu/login");
			return false;
		}else{
			return true;
		}
	}
	
}
