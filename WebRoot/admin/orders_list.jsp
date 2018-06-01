<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html lang="en" class="ie6 ielt7 ielt8 ielt9"><![endif]--><!--[if IE 7 ]><html lang="en" class="ie7 ielt8 ielt9"><![endif]--><!--[if IE 8 ]><html lang="en" class="ie8 ielt9"><![endif]--><!--[if IE 9 ]><html lang="en" class="ie9"> <![endif]--><!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en"><!--<![endif]--> 
	<head>
		<jsp:include page="top.jsp"></jsp:include>
	</head>
	<body>
		<div class="container">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="row">
				<jsp:include page="left.jsp"></jsp:include>
				<div class="span9">
					<h1>
						订单列表
					</h1>
					<h4>请输入查询条件：</h4>
					<form class="form-horizontal">
						<fieldset>
						用户ID：
						<input type="text" name="uid" id="uid"/>
						&nbsp;&nbsp;
						状态：
						<select name="state" id="state">
								<option value="0" selected="selected">未付款</option>
								<option value="1">未发货</option>
								<option value="2">已发货</option>
								<option value="3">已收货</option>
						</select>
						&nbsp;&nbsp;
						<button id="search" type="button" class="btn btn-primary">查询</button> 
						</fieldset>
					</form>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>
									订单编号
								</th>
								<th>
									用户编号
								</th>
								<th>
									总价格
								</th>
								<th>
									创建时间
								</th>
								<th>
									状态
								</th>
								<th>
									快递单号
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							
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

