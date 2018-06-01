<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.gqz.shop.pojo.User"%>
<%
	User user =(User)session.getAttribute("user");
	if(user==null){
		response.sendRedirect("login.jsp");
	}
%>