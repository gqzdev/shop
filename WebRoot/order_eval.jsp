<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="isLogin.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description"
			content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords"
			content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
		<meta name="author" content="mike zhong" />
		<link rel="shortcut icon"
			href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
		<title>订单评价</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/util.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="css/style.css" type="text/css" />
		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>
	
	<body>
	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container" id="evaluateContainer" v-cloak
		style="width: 100%; background: url('img/regist_bg.jpg');">
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<h3>
					<strong style="color:red;">评价订单</strong>
				</h3>
				<table class="table table-bordered">
					<thead>
						<tr style="background-color:#EDEDED;">
							<th colspan="5">订单编号:<span id="oid"></span></th>
						</tr>
						<tr style="background-color:#EDEDED;">
							<th width="20%">图片</th>
							<th width="45%">商品</th>
							<th width="15%">价格</th>
							<th width="10%">数量</th>
							<th width="10%">小计</th>
						</tr>
					</thead>
					
					<tbody>
						<!-- 商品信息 -->
						<tr class="active" style="text-align:center;">
							<td><img :src="orderitem.image" v-on:click="showDetail(orderitem.pid)" width="70" height="60"></td>
							<td><a v-on:click="showDetail(orderitem.pid)" target="_blank">{{orderitem.pname}}</a></td>
							<td>￥{{orderitem.newPrice}}</td>
							<td>{{orderitem.count}}</td>
							<td>￥<span style="color:red">{{orderitem.subtotal}}</span></td>
						</tr>
						<!-- 商品评论区 -->
						<tr>
							<td colspan="5">
								<textarea id="comment" rows="3" cols="145" onfocus="javascript:this.value='商品很好！'"></textarea>
							</td>
						</tr>
					</tbody>
					
				</table>
			</div>
		</div>

		<div style="text-align:right;margin-top: 10px;margin-right:140px;">
			<hr />
			<input type="button" width="100" value="提交评价" name="submit"	id="evaluate" v-on:click="evaluateOreders(orderitem.pid)"
				style="background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;"/>
		</div>

	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
	<script type="text/javascript" src="js/vue.min.js"></script>
	<script type="text/javascript" src="js/vue-resource.js"></script>
	<script type="text/javascript" src="js/zpageNav.js"></script>
	<script type="text/javascript">
		var evaluateVue = new Vue( {
			el:"#evaluateContainer",
			data:{
				oid:"",
				pid:"",
				orderitem:[],
			},
			methods : {
				//显示商品详情
				showDetail:function(pid) {
					location.href = "product_info?pid=" + pid;
				},				
				//评价商品
				evaluateOreders:function(pid){
					var content=$("#comment").val();
					if(content!=""){
						if(content.length<=10){
							alert("亲，评论的内容太短!");
						}else{
							//添加商品评论
							this.$http.post("evaluateOrders",{"pid":this.pid,"content":content},{emulateJSON:true}).then(
									function(res){							
										alert("评价成功！感谢你的支持！");
									},
									function(res){
										console.log(res);
									}
							);
						}
					}else{
						alert("内容不能为空！");
					}
				}
			},
			created : function() {
				this.oid=getQueryString("oid");
				this.pid=getQueryString("pid");
				this.$http.post("getEvaluateitem",{"oid":this.oid,"pid":this.pid},{emulateJSON:true}).then(
					function(res){
						this.orderitem=res.data;
					},
					function(res){
						console.log(res);
					}
				);
			}
		});
	</script>
</html>