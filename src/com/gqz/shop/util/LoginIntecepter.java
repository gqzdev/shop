package com.gqz.shop.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gqz.shop.pojo.Adminuser;

public class LoginIntecepter implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		//完成之后执行
//		System.out.println("完成之后执行： afterCompletion ");
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		//处理完毕之后执行
//		System.out.println("处理完毕之后执行:  postHandle");
	}

	
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		//处理之前执行
//		System.out.println("处理之前执行: preHandle");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		
		//1.判断session里有没有保存用户  2.判断uri路径
		HttpSession session=request.getSession();
		
		Adminuser admin = (Adminuser)session.getAttribute("adminuser");
		
		String uri=request.getRequestURI();
		
		if (uri.endsWith("login.jsp") || uri.endsWith("login") || uri.endsWith(".jpg")  || uri.endsWith("css") || uri.endsWith("js")) {
			//访问登录页面时，直接访问
			return true; 
		}else if (admin!=null) {
			//用户已经登录了，session中有用户的信息，可以访问admin/下的内容
			return true;
		}else {
			//其他情况，不允许访问/admin/下的内容  跳转到登录页面
//			System.out.println("--拦截--");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('您还未登录！请先完成登录后再操作！！');</script>");
			response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
//			request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
		}
		return false;
	}

}
