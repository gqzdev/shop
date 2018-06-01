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
		<title>订单列表</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="css/zpageNav.css" type="text/css" />
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

	<div class="container" id="orderListContainer" v-cloak
		style="width: 100%; background: url('img/regist_bg.jpg');">
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<h3 style="color:red;">
					<strong>我的订单</strong>
				</h3>
				<table class="table table-bordered">
					<tbody v-for="(item,index) in ordersList">
						<tr class="success">
							<th colspan="5" style="font-weight: bold;color:#fd8704">订单编号:{{item.oid}}</th>
						</tr>
						<tr class="warning">
							<th width="30%">图片</th>
							<th width="20%">商品</th>
							<th width="20%">价格</th>
							<th width="10%">数量</th>
							<th width="15%">小计</th>
						</tr>

						<tr class="active">
							<td><center><img :src="item.image" v-on:click="showDetail(item.pid)" width="70" height="60" /></center></td>
							<td><a v-on:click="showDetail(item.pid)"  target="_blank">{{item.pname}}</a></td>
							<td>￥{{item.newPrice}}</td>
							<td>{{item.count}}</td>
							<td><span class="subtotal"  style="font-weight: bold;color:red">￥{{item.subtotal}}</span></td>
						</tr>
					</tbody>
					
				</table>
			</div>
		</div>
		<!--分页 -->
		<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
			<zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" 
				v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
			<zpagenav>
		</div>
		<!-- 分页结束 -->
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

	</body>
	<script type="text/javascript" src="js/vue.min.js"></script>
	<script type="text/javascript" src="js/vue-resource.js"></script>
	<script type="text/javascript" src="js/zpageNav.js"></script>
	<script type="text/javascript">
		var OrderListVue = new Vue( {
			el:"#orderListContainer",
			data:{
				
				ordersList:[],
				page:1,//显示的是哪一页
				pageSize:6,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9//最大的页数
			},
			methods : {
				//显示商品详情
				showDetail:function(pid) {
					location.href = "product_info?pid=" + pid;
				}, 
				pageHandler:function(page){  //跳转到page页
					this.page=page;//修改显示的页数page
					//发送Ajax请求
					//参数Parama  getQueryString方法【通过参数name获取URL的参数值】
					var params={"page":page,"pageSize":this.pageSize};
					this.$http.post("getOrdersListByPage",params,{emulateJSON:true}).then(
						function(res){
							this.ordersList=res.data.list;
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				}
			},
			created : function() {
				this.pageHandler(1);
			}
		});
	</script>
</html>