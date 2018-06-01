<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords" content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
	<meta name="author" content="mike zhong" />
	<title>商品列表</title>
	<link rel="shortcut icon" href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jqpaginator.min.js" charset="UTF-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/util.js"></script>
	<!-- 引入自定义css文件 style.css -->
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<link rel="stylesheet" href="css/style1.css" type="text/css" />
	<link rel="stylesheet" href="css/zpageNav.css" type="text/css" />
</head>

<body>


	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>

    <div class="container" id="pListContainer" style="width: 100%; background: url('img/regist_bg.jpg');">
		<div class="row plist" >
			<div class="col-md-12" style="text-align: left;">
				<ol class="breadcrumb">
					<li style="font-size: 20px;font-weight: bold;">
					<a href="#" ><span id="catName"></span></a></li>
				</ol>
			</div>
			<!-- 分类商品列表 start-->
			<div id="plist">
				<div class="col-md-2" v-for="item in productList" @click="showDetail(item.pid)">
					<a href="#"> 
						<img :src="item.image" width="200" height="200" style="display: inline-block;">
					</a>
					<p></p>
					<p>
						<a href="#" style='font-weight: bold;'>{{item.pname}}</a>
					</p>
					<p></p>
					<p>
						<font color="#FF0000">商城价：&yen;{{item.newPrice}}</font>
					</p>
				</div>
			</div>
			<!-- 分类商品列表 end-->
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
	<script type="text/javascript" src="js/vue.min.js"></script>
	<script type="text/javascript" src="js/vue-resource.js"></script>
	<script type="text/javascript" src="js/zpageNav.js"></script>
	<script type="text/javascript">
		var searchVue=new Vue({
			el:"#pListContainer",
			data:{
				productList:[],
				page:1,//显示的是哪一页
				pageSize:10,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9//最大的页数
			},
			methods:{
				pageHandler:function(page){//跳转到page页
					this.page=page;//修改显示的页数page
					//发送Ajax请求
					//参数Parama  getQueryString方法【通过参数name获取URL的参数值】
					var params={"name":getQueryString("searchContent"),"page":page,"pageSize":this.pageSize};
					this.$http.post("getProductsByName",params,{emulateJSON:true}).then(
						function(res){
							this.productList=res.data.list;
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				},
				showDetail:function(pid){
					location.href="product_info?pid="+pid;
				}
			},
			created:function(){
				//created  表示页面加载完毕，立即执行
				this.pageHandler(1);
			}
		});
	</script>
	
</body>

</html>