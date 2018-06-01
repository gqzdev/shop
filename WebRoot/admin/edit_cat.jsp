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
				<!--<jsp:include page="left.jsp"></jsp:include>
				--><div class="span9">
					<h1>
						 修改商品分类
					</h1>
					<form class="form-horizontal">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="input01">商品分类名称</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="cname" name="cname"/>
								</div>
							</div>
													
							<div class="form-actions">
								<button type="button" class="btn btn-primary" onclick="javascript:;">修改</button> 
								&nbsp;&nbsp;
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		
		
	</body>
</html>

