package com.danzhao.intercapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class HandlerInterceptor_withOut implements HandlerInterceptor{

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
	
	/*preHandle方法：拦截外部请求*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		String fromURL = request.getHeader("Referer");
		if(fromURL == null){
			System.out.println("拦截外部请求");
			if(request.getSession().getAttribute("user") != null){
				response.sendRedirect(request.getContextPath()+"/user/returnMain");
			}else if(request.getSession().getAttribute("student") != null){
				response.sendRedirect(request.getContextPath()+"/views/student/studentExaming.jsp");
			}else{
				response.sendRedirect(request.getContextPath()+"/user/goUserLogin");
			}
			return false;
		}
		return true;
	}
}
