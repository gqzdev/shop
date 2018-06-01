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
			<div class="row">
				<div class="span9">
					<h3>
					</h3>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>
									编号
								</th>
								<th>
									商品编号
								</th>
								<th>
									商品图片
								</th>
								<th>
									商品数量
								</th>
								<th>
									价格
								</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan='6' style="font-weight: bold;"></td>
							</tr>
							<tr>
								<td colspan='6' style="font-weight: bold;">用户信息:</td>
							</tr> 
							<tr>
								<td colspan='3'>用户名</td> 
								<td colspan='3' id="name">  </td>
							</tr>  
							<tr>
								<td colspan='3'>地址</td>  
								<td colspan='3' id="addr">  </td>
							</tr> 
							<tr>
								<td colspan='3'>电子邮箱</td>  
								<td colspan='3' id="email">    </td>
							</tr>  
							<tr>
								<td colspan='3'>电话</td>  
								<td colspan='3' id="phone">  </td>
							</tr> 
							<tr>
								<td colspan='3'>邮编：</td>  
								<td colspan='3' id="code">  </td>
							</tr>
						</tbody>
					</table>				
					<div class="control-group" id="sendorder">
						<h4>请输入发货信息：</h4>
						<div class="controls">
							<label class="control-label" for="textarea">请输入快递单号：</label>
							<input type="text" class="input-xlarge" name="number" id="number"/>	
						</div>
						<div class="controls">
							<input type="button" class="btn btn-primary" value="发货" id="send" onclick="javascript:sendOrder()"/>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

