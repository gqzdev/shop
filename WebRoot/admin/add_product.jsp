<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
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
						新增商品
					</h1>
					<form id="uploadForm" class="form-horizontal" enctype="multipart/form-data">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="input01">商品所属分类</label>
								<div class="controls">
									<select name="cid">
										
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">商品名称</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="pname" name="pname" required="required"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">商品原价</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="oldPrice" name="oldPrice" required="required"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">商品现价</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="newPrice" name="newPrice" required="required"/>
								</div>
							</div>
							
							
							<div class="control-group">
								<label class="control-label" for="fileInput">商品图片</label>
								<div class="controls">								
									<input class="input-file" multiple="multiple" id="imageFile" name="imageFile" type="file" 
									accept="image/*"  onchange="javascript:changeImg()" required="required"/>
								</div>
								<div class="controls" id="imgs">									
								</div>
							</div>	
							
							<div class="control-group">
								<label class="control-label" for="input01">商品库存</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="total" name="total" required="required"/>
								</div>
							</div>		
										
							<div class="control-group">
								<label class="control-label" for="textarea">商品描述</label>
								 <div class="controls"> 
									<textarea class="input-xlarge" id="pdesc" rows="20" cols="30" name="pdesc"></textarea>
								 	
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
								<button type="button" class="btn btn-primary" onclick="javascript:addProduct();">保存</button> 
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

		//加载商品分类
		$(function(){ 
	    	getCategory("getCategories");
	    });

	  
		$(function(){
			//1、建立FckEditor的对象
			var ofckEditor=new FCKeditor("pdesc");
			//参数：是页面的TextArea的name属性
			//2、设定路径
			ofckEditor.BasePath="../fckeditor/";
			//3、FckEditor的对象的属性（宽、高）
			ofckEditor.Height=500;
			ofckEditor.Width=600;
			//4、利用该FckEditor的对象替换掉页面的TextArea
			ofckEditor.ReplaceTextarea();
    	});

    	

    	//添加商品
    	function addProduct(){
    		//上传文件时，不能使用表单序列化的方式
    		var params=new FormData($("#uploadForm")[0]);
    		//将再现编辑器的内容取出来，放到FormData中去
    		var oEditor=FCKeditorAPI.GetInstance("pdesc");
    		var fcontent=oEditor.GetXHTML();
    		params.set("pdesc",fcontent);
    		
    		//发送ajax请求
    		$.ajax({
    			url:"addProduct",
    			type:"post",
    			data:params,
    			contentType:false,
    			processData:false,
    			success:function(data){
    				if(data==1){
	    				alert("商品添加成功!");
						window.location.reload(true);
    				}else{
    					alert("商品添加失败!");
        			}
    			}
    		});
    		
    	}
    </script>
</html>

