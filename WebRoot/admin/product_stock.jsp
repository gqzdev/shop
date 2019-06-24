<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="top.jsp"></jsp:include>
	<link rel="stylesheet" href="../css/zpageNav.css" type="text/css" />
	
	<style>
		div #wrap {
			display:none;
			background:#add7ec;
			border-radius:1%;
			border:2px solid #0493db30;
			width:500px;
			height:155px;
			position:absolute;
			left:50%;
			padding:100px 0;
			margin-left:-250px;
			top:50%;
			margin-top:-190px;
			text-align:center;
			font-size:16px;
			font-weight:bolder;
		}
		
		[v-cloak] {
			display: none;
		}
	</style>
</head>
<body>
	<div class="container" id="stockContainer" v-cloak>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<jsp:include page="left.jsp"></jsp:include>
			<div class="span9">
				<h1 style="color:#ff9800">商品库存</h1>
				<span>
					<span style="color:red;font-size:18px;font-weight:bolder;">商品名称：{{product.pname}}</span>&nbsp;&nbsp;
					<input type="button" class="btn btn-primary" value="添加规格" @click="add(product.pid)"/>
				</span>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>编号</th>
							<th>商品尺码</th>
							<th>商品颜色</th>
							<th>商品数量</th>
							<th>操作</th>
						</tr>
					</thead>


					<tbody>
						<tr v-for="(item,index) in inventoryList">
							<td>{{index+1}}</td>
							<td>{{item.psize}}</td>
							<td>{{item.pcolor}}</td>
							<td>{{item.amount}}</td>
							<td>
								<a  v-on:click="preModify(item.id)">更改</a>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="control-group" id="wrap">
					
					<div class="controls">
						尺码：<input type="text" class="input-xlarge" name="psize" id="psize" disabled="disabled" :value="stock.psize"/>
					</div>
					<div class="controls">
						颜色：<input type="text" class="input-xlarge" name="pcolor" id="pcolor" disabled="disabled" :value="stock.pcolor"/>
					</div>
					<div class="controls">
						库存：<input type="number" class="input-xlarge" name="amount" id="amount" :value="stock.amount" />
					</div>
					<div class="controls">
						<input type="button" class="btn btn-primary" value="修改" id="send"	v-on:click="modify(stock.id)" />
						<input type="button" class="btn btn-primary" value="取消" id="exit" />
					</div>
				</div>
				
				<!--分页开始 -->
				<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
					<zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" 
						v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
					<zpagenav>
				</div>
				<!-- 分页结束 -->
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript" src="../js/vue.min.js"></script>
	<script type="text/javascript" src="../js/vue-resource.js"></script>
	<script type="text/javascript" src="../js/zpageNav.js"></script>
	<script type="text/javascript" src="../js/util.js"></script>
	
	<script type="text/javascript">
		var stockListVue = new Vue({
			el : "#stockContainer",
			data : {
				product : [],
				inventoryList:[],
				stock:[],//库存详情
				page:1,//显示的是哪一页
				pageSize:10,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9//最大的页数
			},
			methods : {				
				pageHandler:function(page){  //跳转到page页
					var pid = getQueryString("pid");
					this.page=page;//修改显示的页数page
					//发送Ajax请求
					//参数Parama  getQueryString方法【通过参数name获取URL的参数值】
					var params={"pid" : pid,"page":page,"pageSize":this.pageSize};
					this.$http.post("getInventoryPageByPid",params,{emulateJSON:true}).then(
						function(res){
							this.inventoryList=res.data.list;
							
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				},
				//更新库存
				preModify:function(id){
					$("#wrap").show();
					this.$http.post("getInventoryById",{"id":id},{emulateJSON:true}).then(
						function(res){
							this.stock=res.data;
						},
						function(res){
							console.log(res);
						}
					);
				},
				modify:function(id){
					var amount=$("#amount").val();
					
					this.$http.post("updateInventoryById",{"id":id,"amount":amount},{emulateJSON:true}).then(
						function(res){
							alert("操作成功！");
							window.location.reload(true);
						},
						function(res){
							console.log(res);
						}
					);
				},
				exit:function(){
					$("#wrap").mouseleave(function(){ $("#wrap").hide();});
				},
				add:function(pid){
					window.location.href="product_inventory?pid="+pid;
				}
			},
			created : function() {
				var pid = getQueryString("pid");
				this.$http.post("getProductByPid", {"pid" : pid	}, {emulateJSON : true}).then(function(res) {
					this.product = res.data;
				}, function(res) {
					console.log(res);
				});
				
				this.pageHandler(1);
				/*
				this.$http.post("getInventoryByPid", {"pid" : pid}, {emulateJSON : true}).then(function(res) {
					this.inventoryList = res.data;
				}, function(res) {
					console.log(res);
				});
				*/
			}
		});
		
		$("#exit").click(function(){
			$("#wrap").hide();
		});
		$("#wrap").mouseleave(function(){ $("#wrap").hide();});
	</script>
</html>

