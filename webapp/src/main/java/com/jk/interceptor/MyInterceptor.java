package com.jk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyInterceptor implements HandlerInterceptor {

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

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		String uri = request.getRequestURI();
		System.out.println("-------------"+uri);
		if(uri.indexOf("zxluser")>-1){
			return true;
		}else if(uri.indexOf(".do")>-1){
			Object object = request.getSession().getAttribute("user1");
			Object object1 = request.getSession().getAttribute("user");

			if(object  !=null || object1!=null){
				return true;
			}
			response.sendRedirect(request.getContextPath()+"/long.jsp");
			return false;
		}
		System.out.println("请求路径："+request.getRequestURI());
		return true;
		
		
		
		
	}

}
