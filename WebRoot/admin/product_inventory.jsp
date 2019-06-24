<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<jsp:include page="top.jsp"></jsp:include>
</head>
<body>
	<div class="container" id="inventoryContainer">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<jsp:include page="left.jsp"></jsp:include>
			<div class="span10">
				<h1 style="color:#ff9800">商品库存</h1>

				<form id="inventoryForm" method="post" @submit.prevent="add()"
					class="form-horizontal" enctype="multipart/form-data">
					<div class="control-group">
						<label class="control-label" for="input01">商品名称</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="pname" name="pname" 	:value="product.pname"
							 required="required" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">商品尺寸</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="psize" name="psize" v-model="inventory.psize"
								required="required" onkeyup="value=value.replace(/[^0-9A-Z]/g,'');" style="text-transform:uppercase;" />
						</div>
						<span style="color:red;margin-left:178px;">说明：大写字母和数字(如：S、M、L、XL、XXL||39、40 、41等)</span>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">商品颜色</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="pcolor" name="pcolor"  v-model="inventory.pcolor"	required="required" />
							<!-- <input type="text" id="color"  style="width:60px;"  required="required"/> -->
						</div>
						<span style="color:red;margin-left:178px;">说明：直接填写颜色(如：红、橙、黄、绿、青、蓝、紫等)</span>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">商品库存数量</label>
						<div class="controls">
							<input type="number" class="input-xlarge" id="amount" name="amount" v-model="inventory.amount"
								required="required" />
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">添加</button>
						&nbsp;&nbsp;
						<button class="btn" onclick="javascript:history.back();">取消</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<script type="text/javascript" src="../js/vue.min.js"></script>
	<script type="text/javascript" src="../js/vue-resource.js"></script>
	<script type="text/javascript" src="../js/zpageNav.js"></script>
	<script type="text/javascript" src="../js/util.js"></script>
	
	<script type="text/javascript">
		var inventoryListVue = new Vue(
				{
					el : "#inventoryContainer",
					data : {
						product : [],
						inventory:{
							pid:"",
							psize:"",
							pcolor:" ",
							amount:" "
						} 
					//最大的页数
					},
					methods : {
						add:function(){
							var pid=getQueryString("pid");
							var params={
									"pid":pid,
									"psize":this.inventory.psize,
									"pcolor":this.inventory.pcolor,
									"amount":this.inventory.amount								
									};
							this.$http.post("addInventory",params,{emulateJSON:true}).then(
								function(res){
									if(res.data.result=="ok"){
										alert("添加成功！");
										history.back();
									}else{
										alert("添加失败!")
									}
								},
								function(res){
									console.log(res);
								}
							);
						}
					},						
					created : function() {						
						var pid=getQueryString("pid");					
						this.$http.post("getProductByPid",{"pid":pid}, {emulateJSON : true	}).then(function(res) {
							this.product = res.data;
						}, function(res) {
							console.log(res);
						});
					}
			});
	</script>
</body>
</html>

