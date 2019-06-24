<%@page import="com.gqz.shop.pojo.Adminuser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Adminuser adminuser =(Adminuser)session.getAttribute("adminuser");
	if(adminuser==null){
		response.sendRedirect("login.jsp");
	}
%>