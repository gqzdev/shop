<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
						商品分类列表
					</h1>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>
									序号
								</th>
								<th>
									分类名称
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${categoryList}" var="category" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${category.cname}</td>
								<td>
									<a class="link-update" href="#">修改</a>
									<a class="link-del" href="javascript:del(${category.cid})">删除</a>
								</td>
							</tr>
							</c:forEach>
						
						</tbody>
					</table>	
						
					<!-- 分页start -->		
					<div class="pagination">
						<center>
							<ul id="pagination1"></ul>
						</center>
					</div>
					<!-- 分页end -->	
					
					<!-- 添加商品分类start -->
					<a class="toggle-link" href="#form">
						<i class="icon-plus"></i> 新增商品分类
					</a>
					<form id="form" class="form-horizontal hidden">
						<fieldset>
							<legend>新增商品分类</legend>
							<div class="control-group">
								<label class="control-label" for="input01">商品分类名称</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="cname" name="cname"/>
								</div>
							</div>
							
							<div class="form-actions">
								<button type="button" class="btn btn-primary" onclick="javascript:addCategory();">创建</button> 
								<button class="btn">取消</button>
							</div>
						</fieldset>
					</form>
					<!-- 添加商品分类end -->
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			//显示商品分类
			/* $(function(){
				$.ajax({
	    			url:"getCategories",
	    			type:"post",
	    			dataType:"json",
	    			success:function(data){
						//加载前，清空tbody
						$("tbody").empty();
						//显示数据  使用jQuery的循环
						$.each(data.list,function(i,n){
							//创建一行
							var tr=$("<tr></tr>");
							tr.html(
									"<td>"+(i+1)+"</td>"+
									"<td>"+n.cname+"</td>"+									
									"<td><a href='javascript:modify("+n.cid+")'>修改</a>&nbsp;&nbsp;<a href='javascript:del("+n.cid+")'>删除</a></td>"
							);
							//添加一行tr到tbody中
							$("tbody").append(tr);
						});
	    			}
	    		});
			}); */

			
		    //添加商品分类
		    function addCategory(){
		    	//序列化
				var params=$("#form").serializeArray();
		    	
		    	$.ajax({
	    			url:"addCategory",
	    			type:"post",
	    			data:params,
	    			success:function(data){
	    				if(data==1){
		    				alert("商品分类添加成功!");
							window.location.reload(true);
	    				}else{
	    					alert("商品分类添加失败!");
	        			}
	    			}
	    		});
		    }
			
			
			//删除商品分类
			function del(cid){
				var params={"cid":cid};
				$.ajax({
	    			url:"delCategory",
	    			type:"post",
	    			data:params,
	    			success:function(data){
	    				if(data==1){
		    				alert("商品分类删除成功!");
							window.location.reload(true);
	    				}else{
	    					alert("商品分类删除失败!");
	        			}
	    			}
	    		});				
			}
		</script>
	</body>
</html>

