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
						 修改商品
					</h1>
					<form id="uploadForm" class="form-horizontal" enctype="multipart/form-data">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="input01">商品所属二级分类</label>
								<div class="controls">
									<select name="cid">
										
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">商品名称</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="pname" name="pname"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">商品原价格</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="oldPrice" name="oldPrice"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">商品新价格</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="newPrice" name="newPrice"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="fileInput">商品图片</label>
								<div class="controls">
								
									<input class="input-file" id="imageFile" multiple="multiple" name="imageFile" type="file" accept="image/*"/>
								</div>
								<div class="controls" id="imgs">
									
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">商品库存</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="total" name="total"/>
								</div>
							</div>						
							<div class="control-group">
								<label class="control-label" for="textarea">商品描述</label>
								<div class="controls">
									<textarea class="input-xlarge" id="pdesc" rows="4" name="pdesc"></textarea>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="optionsCheckbox">是否热门商品</label>
								<div class="controls">
									&nbsp;<input type="radio" name="isHot" id="isHot" value="1"/>&nbsp;是&nbsp;
									&nbsp;<input type="radio" name="isHot" id="isHot" value="0" checked="checked" />&nbsp;否
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="optionsCheckbox">是否轮播图商品</label>
								<div class="controls">
									&nbsp;<input type="radio" name="isPic" id="isPic" value="1"/>&nbsp;是&nbsp;
									&nbsp;<input type="radio" name="isPic" id="isPic" value="0" checked="checked" />&nbsp;否
								</div>
							</div>						
							<div class="form-actions">
								<button type="button" class="btn btn-primary" onclick="javascript:modify()">修改</button> 
								&nbsp;&nbsp;
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
			$(function(){
				//1、建立FckEditor的对象
				var ofckEditor=new FCKeditor("pdesc");
				//参数：是页面的TextArea的name属性
				//2、设定路径
				ofckEditor.BasePath="../fckeditor/";
				
				//3、FckEditor的对象的属性（宽、高）
				ofckEditor.Height=800;
				ofckEditor.Width=530;
				//4、利用该FckEditor的对象替换掉页面的TextArea
				ofckEditor.ReplaceTextarea();
				
	    	});
    	</script>
</html>

