<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>ForFuture 商城首页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords" content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
		<meta name="author" content="mike zhong" />
		<link rel="shortcut icon" href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
		
		
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<link rel="stylesheet" href="css/style.css" type="text/css" />
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
	</head>

	<body>
		<div class="container-fluid" style="width: 100%; background: url('img/bg.jpg');">

			<!-- 引入header.jsp -->
			<jsp:include page="header.jsp"></jsp:include>
			
			<div id="picContainer" v-cloak>
			<!-- 轮播图 -->
			<div class="container-fluid" >
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- 轮播图的中的小点 -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- 轮播图的轮播图片 -->
					<div class="carousel-inner" role="listbox" id="pics" style="text-align: center;">
						<div class="item" :class="{'active':index==0}"  v-for="(item,index) in productPic" @click="showDetail(item.pid)">
							<center><img :src="item.image" style="width:auto;"></center>
							<div class="carousel-caption">
								{{item.pname}}
							</div>
						</div>
					</div>
					<!-- 上一张 下一张按钮 -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span> </a>
					<a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span> </a>
				</div>
			</div>


			<!-- 热门商品 start-->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2 style="color:red">
						热门商品&nbsp;&nbsp;
						<img src="img/title2.jpg" />
					</h2>
				</div>
				<div class="col-md-2" style="border: 1px solid #E7E7E7; border-right: 0; padding: 0;">
					<img id="hotBig" @click="showDetail(HotProduct[0].pid)" v-if="HotProduct.length>0" :src="HotProduct[0].image" width="205"	height="404" style="display: inline-block;" />
				</div>
				<div class="col-md-10" id="hotProducts">
					<div class="col-md-6 image-item1">
						<a href="#"> 
							<img @click="showDetail(HotProduct[1].pid)" v-if="HotProduct.length>0"	:src="HotProduct[1].image" width="516px" height="200px"  style="display: inline-block;"> 
						</a>
					</div>
					<div v-for="(item,index) in HotProduct" @click="showDetail(item.pid)" v-if="index>1" class="col-md-2 image-item2" :class="{'yes-right-border':index==4||index==10}">
						<a href="#"> 
							<img :src="item.image" width="130" height="130"	style="display: inline-block;"> 
						</a>
						<p class="image-item2-title"><a href="#">{{item.pname}}</a></p>
						<p class="image-item2-price">&yen;{{item.newPrice}}</p>
					</div>
				</div>
			</div>
			<!-- 热门商品 end-->

			<!-- 广告条 -->
			<div class="container-fluid">
				<img src="img/products/hao/ad.jpg" width="100%" />
			</div>

			<!-- 最新商品 start-->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2 style="color:red">
						最新商品&nbsp;&nbsp;
						<img src="img/title2.jpg" />
					</h2>
				</div>
				<div class="col-md-2"	style="border: 1px solid #E7E7E7; border-right: 0; padding: 0;">
					<img id="newBig" @click="showDetail(NewProduct[0].pid)" v-if="NewProduct.length>0" :src="NewProduct[0].image" width="205"	height="404" style="display: inline-block;" />
				</div>
				
				<div class="col-md-10" id="newProducts">
					<div class="col-md-6"
						style="text-align: center; height: 200px; padding: 0px;">
						<a href="#"> 
							<img @click="showDetail(NewProduct[1].pid)"  v-if="NewProduct.length>0" :src="NewProduct[1].image" width="516px" height="200px"	style="display: inline-block;"> 
						</a>
					</div>
					
					<div @click="showDetail(item.pid)" v-for="(item,index) in NewProduct" v-if="index>1" class="col-md-2 image-item2" :class="{'yes-right-border':index==4||index==10}">
						<a href="#"> 
							<img :src="item.image" width="130" height="130"	style="display: inline-block;"> 
						</a>
						<p class="image-item2-title">
							<a href="#">{{item.pname}}</a>
						</p>
						<p class="image-item2-price">
							&yen;{{item.newPrice}}
						</p>
					</div>
				</div>
			</div>
			<!-- 最新商品 end-->
			</div>


			<!-- 引入footer.jsp -->
			<jsp:include page="footer.jsp"></jsp:include>

		</div>
	</body>
	<script type="text/javascript" src="js/vue.min.js"></script>
	<script type="text/javascript" src="js/vue-resource.js"></script>
	<script type="text/javascript">
		var headVue=new Vue({
			el:"#picContainer",
			data:{
				productPic:[],
				NewProduct:[],
				HotProduct:[]
			},
			methods:{
				showDetail:function(pid){
					location.href="product_info?pid="+pid;
				}
			},
			created:function(){
				this.$http.get("getProductPic").then(
					function(res){
						this.productPic=res.data.list;
					},
					function(res){
						console.log(res);
					}
				);
				this.$http.get("getNewProduct").then(
						function(res){
							this.NewProduct=res.data.list;
						},
						function(res){
							console.log(res);
						}
				);
				this.$http.get("getHotProduct").then(
						function(res){
							this.HotProduct=res.data.list;
						},
						function(res){
							console.log(res);
						}
				);
			}
		});
	</script>
</html>