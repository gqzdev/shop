<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="isLogin.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description"
			content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords"
			content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
		<meta name="author" content="mike zhong" />
		<link rel="shortcut icon"
			href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
		<title>订单详情</title>
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
		</style>
	</head>

	<body>
		<!-- 引入header.jsp -->
		<jsp:include page="header.jsp"></jsp:include>

		<div class="container" id="orderInfoContainer" v-cloak
			style="width: 100%; background: url('img/regist_bg.jpg');">
			<div class="row">
				<div style="margin: 0 auto; margin-top: 10px; width: 1200px;">
					<h3 style="color:red;">
						<strong>订单详情</strong>
					</h3>
					<table class="table table-bordered">
						<thead>
							<tr style="background-color: #EDEDED;">
								<th colspan="5">
									<h4 style="font-weight: bold;color:#fd8704">
										订单编号:
										<span id="oid">{{orderid}}</span>
									</h4>
								</th>
							</tr>
							<tr style="background-color: #EDEDED;">
								<th width="20%">
									图片
								</th>
								<th width="40%">
									商品名称
								</th>
								<th width="20%">
									价格
								</th>
								<th width="10%">
									数量
								</th>
								<th width="15%">
									小计
								</th>
							</tr>
						</thead>
						<tbody>
							<tr class="active" v-for="item in orderInfoList">
								<td>
									<center>
										<img :src="item.image" v-on:click="showDetail(item.pid)" width="70" height="60">
									</center>
								</td>
								<td>
									<a v-on:click="showDetail(item.pid)" target="_blank">
										{{item.pname}}   
									</a>
									<span style="color:red;">{{item.psize}}  {{item.pcolor}}</span>
								</td>
								<td>
									￥{{item.newPrice}}
								</td>
								<td>
									{{item.count}}
								</td>
								<td>
									<span class="subtotal">￥{{item.subtotal}}</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!--分页 -->
				<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
					<zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" 
							v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
					<zpagenav>
				</div>
				<!-- 分页结束 -->


				<div
					style="text-align: right; margin-right: 220px; font-size: 18px; font-weight: bold;">
					<p>
						商品总金额: ￥
						<span style="color: #ff6600;" id="amount">{{cartTotal}}</span>元
					</p>
				</div>

			</div>

			<!-- 付款 start -->
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<div
					style="margin-top: 5px; margin-left: 50px; font-size: 18px; font-weight: bold;">
					<p>
						<span style="color:red;">选择支付方式：请确保付款环境安全！</span>					
						
						<div class="pay" style="text-align:center;">
							<div class="payCode" >
								<img alt="付款码" src="img/alipay.png" width="140px" height="140px">
							</div>
							<br/>
							<span class="pay_item checked" data-id="alipay">
								<input type="radio" class="salipay" name="pd_FrpId" value="zhifubao"	checked="checked" />
								<span class="radiobox"></span> 
									<span class="pay_logo">
										<img  src="img/alipay.jpg" alt="支付宝" />
									</span>
							</span>
							&nbsp;&nbsp;&nbsp;
							<span class="pay_item" data-id="weipay">
								<input type="radio" class="sweixin" name="pd_FrpId" value="weixin" />
								<span class="radiobox"></span> 
								<span class="pay_logo">
									<img src="img/wechat.jpg" alt="微信" />
								</span>
							</span>
						</div>

					</p>
					<hr />
					<p style="text-align: right; margin-right: 100px;">
						<a href="javascript:;"> <input type="button" width="150"
								value="确认付款" name="submit" id="login" v-on:click="payOrder()"
								style="background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</a>
					</p>
					<hr />
				</div>
			</div>
			<!-- 付款 end -->
		</div>

		<!-- 引入footer.jsp -->
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript">
			$(function(){
				$(".pay_item").click(function() {
					$(".sitem").addClass('checked').siblings(".sitem").removeClass('checked');
					var dataid = $(this).attr('data-id');
					$(".payCode img").attr("src","img/" + dataid + ".png");
					if(dataid=="alipay"){
						$(".salipay").attr("checked","checked");
					}else{
						$(".sweixin").attr("checked","checked");
					}
					//模拟付款  当用户扫码付款时[支付宝或者微信支付接口]
					var id=getQueryString("oid");
					$.post(
						"payOrders",
						{ oid:id },
						function(data,status){
						   alert("付款成功");
						}
					);
					
				});
			});
	
	</script>
	
	
	<script type="text/javascript" src="js/vue.min.js"></script>
	<script type="text/javascript" src="js/vue-resource.js"></script>
	<script type="text/javascript" src="js/zpageNav.js"></script>
	<script type="text/javascript"><!--
		var cartVue = new Vue( {
			el:"#orderInfoContainer",
			data:{
				orderid:"",
				cartTotal:0,
				orderInfoList:[],
				selectList:[],//保存复选框中的index索引值
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
				//付款
				payOrder:function(){
					location.href = "order_list";
					/*
					this.$http.post("payOrders",{"oid":this.orderid,"total":this.cartTotal},{emulateJSON:true}).then(
						function(res){
							//付款成功，跳转到订单列表页面
							location.href="order_list";
						},
						function(res){
							console.log(res);
						}
					);
					*/
				},
				pageHandler:function(page){  //跳转到page页
					this.orderid=getQueryString("oid");
					this.cartTotal=getQueryString("total");
					this.page=page;//修改显示的页数page
					//发送Ajax请求
					//参数Parama  getQueryString方法【通过参数name获取URL的参数值】
					var params={"oid":this.orderid,"page":page,"pageSize":this.pageSize};
					this.$http.post("getOrderInfoByPage",params,{emulateJSON:true}).then(
						function(res){
							this.orderInfoList=res.data.list;
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
				//未分页
			//  this.$http.get("getOrderInfo").then(function(res) {
			//		this.cartList = res.data;
			//	}, function(res) {
			//		console.log(res);
			//	});
				//分页
				this.pageHandler(1);
			}
		});
	--></script>
</html>