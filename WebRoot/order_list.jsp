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
		<script src="js/util.js" type="text/javascript"></script>
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
			
			.success th span{
				padding:8px;
				font-size:16px;
			}
			.success th span>odd{
				color:green;
			}
			.su_opreate{
				font-weight: bold;
				color: rgb(245, 149, 5);
				text-align: right;
				font-size: 16px;
				font-family: '楷体';
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
					<tbody v-for="(item,index) in ordersList" :id="item[0].oid">
						<!-- 订单标题行 -->
						<tr class="success">
							<th colspan="6" style="font-weight: bold;color:#fd8704" >
								<span>订单编号:{{item[0].oid}}&nbsp;&nbsp;</span>
								<span class="odd">订单时间:{{item[0].ordertime}}&nbsp;&nbsp;</span>
								<span>订单状态:<span style="color:red;font-size:18px;">{{item[0].state}}</span>&nbsp;&nbsp;</span>
								<span class="odd">物流编号:{{item[0].number}}&nbsp;</span>
							</th>
						</tr>
						<tr class="warning" style="text-align:center">
							<th width="15%">图片</th>
							<th width="35%">商品</th>
							<th width="15%">价格</th>
							<th width="5%">数量</th>
							<th width="15%">小计</th>
							<th width="10%">操作</th>
						</tr>

						<tr class="active" v-for="orderitem in item" style="text-align:center">
							<td><center><img :src="orderitem.image" v-on:click="showDetail(orderitem.pid)" width="70" height="60" /></center></td>
							<td style="text-align:left"><a v-on:click="showDetail(orderitem.pid)"  target="_blank">{{orderitem.pname}}</a></td>
							<td>￥{{orderitem.newPrice}}</td>
							<td>{{orderitem.count}}</td>
							<td><span class="subtotal"  style="font-weight: bold;color:red">￥{{orderitem.subtotal}}</span></td>
							<td class="su_opreate"><button v-if="item[0].state=='交易完成'" v-on:click="evaluateOreders(orderitem.oid,orderitem.pid)">评价</button></td>
						</tr>
						
						<tr class="success" height="8px">
							<td colspan="1" class="su_opreate" >收货地址:</td>
							<td colspan="4" class="su_opreate" style="text-align:left;color:#ef0b0b;">{{user.name}}&nbsp;{{user.addr}}&nbsp;{{user.code}}&nbsp;{{user.phone}}</td>
							<td colspan="1" class="su_opreate" style="text-align:center;"><button v-on:click="changeAddr(item[0].oid)">更改</button>&nbsp;</td>
						</tr>
						
						<tr class="success">
							<th colspan="6" class="su_opreate">
								<button v-on:click="share(item[0].oid)">分享订单</button>&nbsp;
								<button v-if="item[0].state=='未付款'" v-on:click="payOrders(item[0].oid)">付款</button>&nbsp;
								<button v-if="item[0].state=='未发货'" v-on:click="remindOrders(item[0].oid)">催单</button>&nbsp;
								<button v-if="item[0].state=='已发货'" v-on:click="receiveOrders(item[0].oid)">确认收货</button>&nbsp;
								<button v-if="item[0].state=='已收货'" v-on:click="completeOrders(item[0].oid)">完成交易</button>&nbsp;
								<!--<button v-if="item[0].state=='交易完成'" v-on:click="evaluateOreders(item[0].oid)">评价订单</button>&nbsp;-->
								<button v-if="item[0].state=='交易完成'" v-on:click="deleteOrders(item[0].oid)">删除订单</button>&nbsp;
							</th>
						</tr>
						
						<tr class="su_opreate" height="8px">
							<th colspan="6" >&nbsp;</th>
						</tr>
						<!-- 换行 -->
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
		var orderListVue = new Vue( {
			el:"#orderListContainer",
			data:{
				ordersList:[],
				oredersTotalList:[],//每笔订单的总价
				user:[],//用户信息
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
					this.$http.post("getOrdersListByUid",params,{emulateJSON:true}).then(
						function(res){
							this.ordersList=res.data.list;
							//订单时间格式化
							for(var i=0;i<this.ordersList.length;i++){
								for(var j=0;j<this.ordersList[i].length;j++){
									this.ordersList[i][j].ordertime=new Date(this.ordersList[i][j].ordertime).format("yyyy年MM月dd日 hh:mm:ss");
								}
							}
							//订单总价
							for(var i=0;i<this.ordersList.length;i++){
								this.oredersTotalList=this.ordersList[i][0].total;//订单总价
							}
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				},
				//更改收货信息
				changeAddr:function(){
					alert("该功能还未实现！");					
				},
				//付款
				payOrders:function(oid){
					this.$http.post("payOrders",{"oid":oid},{emulateJSON:true}).then(
						function(res){
							alert("付款成功!");
							window.location.reload(true);								
						},
						function(res){
							console.log(res);
						}
					);
				},
				//催单
				remindOrders:function(oid){
					this.$http.post("remindOrders",{"oid":oid},{emulateJSON:true}).then(
						function(res){
							alert("催单成功!正在发货...");
							window.location.reload(true);								
						},
						function(res){
							console.log(res);
						}
					);
				},
				//确认收货
				receiveOrders:function(oid){
					if(confirm("确认收货？")){
						this.$http.post("receiveOrders",{"oid":oid},{emulateJSON:true}).then(
							function(res){
								alert("收货成功!");
								window.location.reload(true);								
							},
							function(res){
								console.log(res);
							}
						);
					}
				},
				//交易完成
				completeOrders:function(oid){
					if(confirm("您确认交易完成了吗？")){
						this.$http.post("completeOrders",{"oid":oid},{emulateJSON:true}).then(
							function(res){
								alert("交易完成!");
								window.location.reload(true);								
							},
							function(res){
								console.log(res);
							}
						);
					}
				},
				//删除订单
				deleteOrders:function(oid){
					if(confirm("您确认要删除订单吗？")){
						//先隐藏tbody  再删除
						$('#'+oid).hide();
						this.$http.post("deleteOrders",{"oid":oid},{emulateJSON:true}).then(
							function(res){
								alert("订单删除成功!");
							},
							function(res){
								console.log(res);
							}
						);
					}
				},
				//评价商品
				evaluateOreders:function(oid,pid){
					location.href="order_eval?oid="+oid+"&pid="+pid;
				}
			},
			created : function() {
				this.pageHandler(1);
				//获取用户信息
				this.$http.post("userInfo",{emulateJSON:true}).then(
					function(res){
						this.user=res.data;
					},
					function(res){
						console.log(res);
					}
				);
			}
		});
				
	</script>
</html>