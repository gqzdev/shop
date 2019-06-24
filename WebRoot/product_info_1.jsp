<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords" content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
		<meta name="author" content="mike zhong" />
		<link rel="shortcut icon" href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
		<title>商品详情</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/util.js"></script>
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
			[v-cloak] {
			    display: none;
			}
		</style>
	</head>

	<body>
		<!-- 引入header.jsp -->
		<jsp:include page="header.jsp"></jsp:include>


		<div id="pinfoContainer" v-cloak  class="container" style="width: 100%; background: url('img/bg.jpg');">
			<div class="row" >
				<div class="info-header">
					<ol class="breadcrumb info-header1">
						<li style="font-size: 18px; font-weight: bold;">
							<a href="index">首页</a>
							&nbsp;/&nbsp;
							<a href="#"><span @click="getCateProduct(pInfo.cid)">{{pInfo.cname}}</span></a>
							&nbsp;/&nbsp;
							<a href="#">{{pInfo.pname}}</span></a>
						</li>
					</ol>
				</div>

				<div class="info-body">
					<div class="col-md-6">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<!-- 轮播图的中的小点 -->
							<ol class="carousel-indicators" id="pic_dot">
								<li data-target="#carousel-example-generic" v-for="(item,index) in images" data-slide-to="0" :class="{'active':index==0}"></li>
							</ol>
							<!-- 轮播图的轮播图片 -->
							<div class="carousel-inner" role="listbox" id="pic_div">
								<div class="item"  v-for="(item,index) in images" :class="{'active pro-img-item':index==0}">
									<img :src="item">
								</div>
							</div>
							<!-- 上一张 下一张按钮 -->
							<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> 
								<span class="sr-only">Next</span> 
							</a>
						</div>
					</div>

					<div class="col-md-6 info-right">
						<div class="info-desc">
							<h4>
								<span id="pro_name">{{pInfo.pname}}</span>
							</h4>
						</div>
						<div class="info-desc">
							现价:
							<strong style="color: #ef0101;"> ￥：
								<span id="pro_newPrice">{{pInfo.newPrice}}</span>元
							</strong> &nbsp; &nbsp; 
							原价：
							<del>
								￥<span id="pro_oldPrice">{{pInfo.oldPrice}}</span>元
							</del>
						</div>
						
						<div class="info-desc">
							<div>
								销量：
								<span id="pro_volume">{{pInfo.volume}}</span>
							</div>
						</div>
						
						<div class="info-desc">
							<div>
								库存：
								<span id="pro_total">{{pInfo.total}}</span>
							</div>
						</div>
						<div class="info-desc">
							商品上市时间:
							<span id="pdate">{{pInfo.pdate}}</span>
						</div>
						<div class="info-desc">
							购买数量:
							<input id="quantity" name="quantity" type="number" value="1" v-model="quantity" min='1'
								maxlength="4" size="10" type="text">
						</div>

						<div class="info-desc-1">
							<img src="img/addCart.png" id="addCart" v-on:click="addCart()" width="200" height="55"/>
							<img src="img/addOrders.png" id="addCart" v-on:click="addOrders()" width="200" height="55"/>
						</div>

					</div>
				</div>
				<div class="clear"></div>
				<!-- 商品详细介绍及商品评论  start-->
				<div class="info-body">
					<div class="info-body-desc">
						<h3 style="color:#fe790a">
							商品介绍
						</h3>
					</div>
					<div id="pro_desc">
						<h3 style="color:#fe790a">
							商品详情
						</h3>
						<p style="text-indent:2em;" v-html="pInfo.pdesc"></p>
						
					</div>
					<div class="info-body-desc">
						<h3 style="color:#fe790a">
							商品评论
						</h3>
						<table class="table">
							<tbody>
								<tr class="active" v-for="item in commentList">
									<td style="font-family:'sans-serif'">{{item.username}}</td>
									<td style="color:#f68105;">{{item.content}}</td>
									<td>{{item.created}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 商品详细介绍及商品评论  end-->
			</div>
		</div>


		<!-- 引入footer.jsp -->
		<jsp:include page="footer.jsp"></jsp:include>
		<script type="text/javascript" src="js/vue.min.js"></script>
		<script type="text/javascript" src="js/vue-resource.js"></script>
		<script type="text/javascript">
			var InfoVue=new Vue({
				el:"#pinfoContainer",
				data:{
					pInfo:{
				 			pname:"",
							cname:"",
							cid:"",
							newPrice:0,
							oldPrice:0,
							total:0,
							volume:0,
							pdesc:"",
							pdate:"",
							image:""
						},
					images:[],//数组保存商品的图片
					quantity:1,//保存商品购买的数量
					commentList:[]//商品评论列表
				},
				methods:{
					getCateProduct:function(cid){
						location.href="product_list?cid="+cid;	
					},
					addCart:function(){
						if(this.pInfo.total<=0){
							//判断库存是否为0
							alert("该商品已经卖光了,下次再来吧!");
						}else if(this.pInfo.total-this.quantity<0){
							//判断购买的数量是否小于库存数量
							alert('该商品的库存不足,请重新选择购买数量!');
						}else{
							//获取信息，将其加入购物车中
							//计算商品的总价
							var subtotal=this.quantity*(this.pInfo.newPrice);
							//获取参数
							var params={
									"pid":getQueryString("pid"),
									"count":this.quantity,
									"subtotal":subtotal
								};
							//发送ajax请求
							this.$http.post("addCart",params,{emulateJSON:true}).then(
								function(res){
									//请求成功
									if(res.data.result=="error"){
										alert('您还未登录，请登录后再操作!');
										location.href="login";
									}else{
										alert('商品已经加入购物车!');
										location.href="cart";
									}
								},
								function(res){
									//请求失败
									console.log(res);
								}
							);
						}
					},
					//直接购买
					addOrders:function(){
						if(confirm("亲,您确定直接购买么!")){
							if(this.pInfo.total<=0){
								//判断库存是否为0
								alert("该商品已经卖光了,下次再来吧!");
							}else if(this.pInfo.total-this.quantity<0){
								//判断购买的数量是否小于库存数量
								alert('该商品的库存不足,请重新选择购买数量!');
							}else{
								//获取信息，将其加入购物车中
								//计算商品的总价
								/* var subtotal=this.quantity*(this.pInfo.newPrice); */
								var subtotal=this.quantity*(this.pInfo.newPrice);
								//获取参数
								var params={
										"pid":getQueryString("pid"),										
										"count":this.quantity,//数量
										"total":subtotal//小计
									};
								//发送ajax请求
								this.$http.post("addOrders",params,{emulateJSON:true}).then(
									function(res){
										//请求成功
										if(res.data.result=="error"){
											alert('您还未登录，请登录后再操作!');
											location.href="login";
										}else{
											location.href="order_info?oid="+res.data.result+"&total="+subtotal;
										}
									},
									function(res){
										//请求失败
										console.log(res);
									}
								);
							}
						}
					}
				},
				created:function(){
					//获取参数
					var params={ "pid":getQueryString("pid") };
					//获取商品详情
					this.$http.post("getProductInfo",params,{emulateJSON:true}).then(
							function(res){
								this.pInfo=res.data;
								//讲image里的内容进行分割
								var strs=new Array();
								strs=this.pInfo.image.split(",");
								//修正图片的正确路径
								for(var i=0;i<strs.length;i++){
									strs[i]="/pic/"+strs[i];
								}
								this.images=strs;
								this.pInfo.pdate=new Date(this.pInfo.pdate).format("yyyy年");
							},
							function(res){
								console.log(res);
							}
					);
					//获取商品评论
					this.$http.post("getProductComment",params,{emulateJSON:true}).then(
							function(res){
								this.commentList=res.data;
								res.data.forEach( function(item) {
									item.created=new Date(item.created).format("yyyy年MM月dd日 hh:mm:ss");
								});
							},
							function(res){
								console.log(res);
							}
					);
				}
			});
		</script>
	</body>

</html>