<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="en">

	<head>
		<meta charset="utf-8">
		<title>登录 - 商城后台ForFuture</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords" content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
		<meta name="author" content="mike zhong" />
		<link rel="shortcut icon" href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
		
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
		<link href="css/site.css" rel="stylesheet">
	</head>

	<body id="login-bg">
		<div id="login-page" class="container">
			<h1>
				ForFuture 商城后台
			</h1>
			<form method="post" class="well" action="login">
				<input type="text" name="username" id="username"  class="span4" placeholder="请输入用户名" required="required" />
				<br />
				<input type="password" name="password" id="password" class="span4" placeholder="请输入密码"  required="required"/>
				<br />
				<center>${msg } </center>
				<label class="checkbox">
					<input type="checkbox" name="remember" />记住密码
				</label>
				<center>
					<button type="submit" class="btn btn-primary">登录</button>
				</center>

			</form>
		</div>

	</body>

</html>
