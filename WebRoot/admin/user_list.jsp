<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html lang="en" class="ie6 ielt7 ielt8 ielt9"><![endif]--><!--[if IE 7 ]><html lang="en" class="ie7 ielt8 ielt9"><![endif]--><!--[if IE 8 ]><html lang="en" class="ie8 ielt9"><![endif]--><!--[if IE 9 ]><html lang="en" class="ie9"> <![endif]--><!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en"><!--<![endif]--> 
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords" content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
		<meta name="author" content="mike zhong" />
		<link rel="shortcut icon" href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
	
		<jsp:include page="top.jsp"></jsp:include>
	</head>
	<body>
		<div class="container">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="row">
				<jsp:include page="left.jsp"></jsp:include>
				
				<!-- Main -->
				<div class="span9">
					<h1>
						用户列表
					</h1>
					<h4>请输入查询条件：</h4>
					
					<!-- 查询表单 start -->
					<form class="form-horizontal" method="post" action="selectUserByTerm.htm">
						<fieldset>
						用户ID：
						<input type="text" name="uid" id="uid"/>
						&nbsp;&nbsp;
						用户名：
						<input type="text" name="username" id="username"/>
						&nbsp;&nbsp;
						<button id="search" type="button" class="btn btn-primary">查询</button> 
						</fieldset>
					</form>
					<!-- 查询表单 start -->
					
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>
									用户编号
								</th>
								<th>
									用户名
								</th>
								<th>
									收件人姓名
								</th>
								<th>
									邮箱
								</th>
								<th>
									收件人电话
								</th>
								<th>
									收件人地址
								</th>
								<th>
									邮编
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="user" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
									<td>${user.username }</td>
									<td>${user.name }</td>
									<td>${user.email }</td>
									<td>${user.phone }</td>
									<td>${user.addr}</td>
									<td>${user.code }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>	
					
								
					<div class="pagination">
						<ul id="pagination1"></ul>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>

