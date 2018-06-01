<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="isLogin.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>购物车-ForFuture</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description"
			content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords"
			content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
		<meta name="author" content="mike zhong" />
		<link rel="shortcut icon"	href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">

		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		
		<link rel="stylesheet" href="css/zpageNav.css" type="text/css" />
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
			
			font {
				color: #3164af;
				font-size: 18px;
				font-weight: normal;
				padding: 0 10px;
			}
		</style>
	</head>

	<body>
		<!-- 引入header.jsp -->
		<jsp:include page="header.jsp"></jsp:include>

		<div class="container" id="cartContainer" v-cloak style="width: 100%; background: url('img/regist_bg.jpg');">
			<div class="row">

				<div style="margin: 0 auto; margin-top: 10px; width: 1200px;">
					<div
						style="width: 100%; font-size: 20px; margin: 10px 0px; height: 50px; background-color: #d3d3d3;">
						<div style="line-height: 50px; margin: 10px;color:red;">
							<strong>购物车</strong>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr class="warning">
								<th width="5%">
									选择
								</th>
								<th width="15%">
									图片
								</th>
								<th width="50%">
									商品
								</th>
								<th width="10%">
									价格
								</th>
								<th width="5%">
									数量
								</th>
								<th width="10%">
									小计
								</th>
								<th width="5%">
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<tr class="active" v-for="(item,index) in cartList">
								<td>
									<center>
										<input type="checkbox" :id="item.sid" name="pid" :value="index" v-model="selectList" />
									</center>
								</td>
								<td>
									<center>
										<img :src="item.image" v-on:click="showDetail(item.pid)" width="70" height="60">
									</center>
								</td>
								<td>
									<a v-on:click="showDetail(item.pid)" target="_blank">{{item.pname}}</a>
								</td>
								<td>
									￥{{item.newPrice}}
								</td>
								<td>
									<input type="number" id="quantity" name="quantity" :value="item.count" 
									  					min="1" step="1" @click="changeNumber(item,$event)" />
								</td>
								<td>
									<span class="subtotal">￥{{item.subtotal}}</span>
								</td>
								<td>
									<a v-on:click="deleteShopcart(item,index)" class="delete">删除</a>
								</td>
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
			
			<div style="margin-right: 130px;">
				<div style="text-align: right;">
					&nbsp; 总金额:
					<strong style="color: #ff6600;">￥{{cartTotal}}元</strong>
				</div>
				<div
					style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
					<a href="javascript:;"> <input type="button" width="100"
							value="提交订单" name="submit" border="0" v-on:click="submitOrder()"
							style="background: url('img/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
					</a>
				</div>
			</div>
			
		</div>

		<!-- 引入footer.jsp -->
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript" src="js/vue.min.js"></script>
	<script type="text/javascript" src="js/vue-resource.js"></script>
	<script type="text/javascript" src="js/zpageNav.js"></script>
	<script type="text/javascript">
		var cartVue = new Vue( {
			el:"#cartContainer",
			data:{
				cartList:[],
				selectList:[],//保存复选框中的index索引值
				page:1,//显示的是哪一页
				pageSize:10,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9//最大的页数
			},
			computed:{
				//计算选中商品的总价
				cartTotal:function(){
					var sum=0;
					var length=this.selectList.length;
					for(var i=0;i<length;i++){
						var index=this.selectList[i];
						var item=this.cartList[index];
						if(item){
							sum+=item.subtotal;
						}else{
							continue;
						}
					}
					return sum;
				}
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
					this.$http.post("getCartByPage",params,{emulateJSON:true}).then(
						function(res){
							this.cartList=res.data.list;
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				},
				changeNumber:function(item,event){
					var obj=$(event.target);
					item.count=obj.val();
					item.subtotal=item.newPrice*item.count;
					//发送ajax请求
					this.$http.post("changeShopcart",item,{emulateJSON:true}).then(
						function(res){

						},
						function(res){

						}
					);
				},
				deleteShopcart:function(item,index){
					if(confirm("亲,确认移除购物车吗？")){
						//将cartList数组中对应的index元素移除
						this.cartList.splice(index,1);
						//发送ajax将数据表中的sid商品删除
						this.$http.post("deleteShopcart",{"sid":item.sid},{emulateJSON:true}).then(
							function(res){
								alert("成功移除!");
							},
							function(res){

							}
						);
					}
				},
				submitOrder:function(){ //提交订单
					if(confirm("您确定要提交订单吗?")){
						var cartIds=new Array();
						var length=this.selectList.length;
						for(var i=0;i<length;i++){
							var index=this.selectList[i];//获取选中的index
							var item=this.cartList[index];//获取选中的商品项
							//将选中的商品的sid保存到数组cartIds中
							if(item){
								cartIds.push(item.sid);
							}else{
								continue;
							}
						}
						alert(cartIds.length);
						if(cartIds==""||cartIds.length==0){
							alert("请选择你需要的商品，谢谢!");
							return false;
						}else{
							//构建参数
							var params={"total":this.cartTotal,"cartIds":cartIds};
							//发送提交订单的ajax请求
							this.$http.post("submitOrder",params,{emulateJSON:true}).then(
									function(res){
										//接受服务器传递过来的oid,跳转到order订单页面
										location.href="order_info?oid="+res.data.result+"&total="+this.cartTotal;
									},
									function(res){
	
									}
							);
						}
					}
				}
			},
			created : function() {
				//未分页
			//  this.$http.get("getCart").then(function(res) {
			//		this.cartList = res.data;
			//	}, function(res) {
			//		console.log(res);
			//	});
				//分页
				this.pageHandler(1);
			}
		});
	</script>
</html>