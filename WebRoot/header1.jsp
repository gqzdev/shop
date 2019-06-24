<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
    
<!DOCTYPE html>
<!-- 登录 注册 购物车 start -->
<div id="headContainer" v-cloak>
<div class="container-fluid">
	<div class="col-md-4">
		<a href="https://ganquanzhong.top" target="_blank"> <img src="img/logo.png" width="100px" height="60px"/> </a>
	</div>
	<div class="col-md-5">
	    <span v-bind:title="loginMsg" style="color:#f28205;text-align:center;font-size:40px;font-family:'楷体';font-weight: bolder;">未来商城FORFUTURE SHOP</span>
	</div>
	<div class="col-md-3" style="padding-top:20px">
		<ol class="list-inline">
			<li>
			    <c:choose>
					<c:when test="${sessionScope.user==null}"><a href="register">注册</a></c:when>
				</c:choose>
				
			</li>
			<li>
			    <c:choose>
					<c:when test="${sessionScope.user!=null}"><a v-on:click="userExit()" href="_blank">${sessionScope.user.name }</a></c:when>
					<c:otherwise><a href="login">登录</a></c:otherwise>
				</c:choose>
			</li>
			
			<li><a href="cart">购物车</a></li>
			<li><a href="order_list">我的订单</a></li>
			<%--
				<li><a href="my_info">会员中心</a></li>
			--%>
			<li>
			    <a href="my_info">
				<c:choose>
					<c:when test="${sessionScope.user!=null}">${sessionScope.user.username }</c:when>
					<c:otherwise>会员中心</c:otherwise>
				</c:choose>
				</a>
			</li>
		</ol>
	</div>
</div>
<!-- 登录 注册 购物车 end  -->

<!-- 导航条  start-->
<div class="container-fluid" >
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<!-- 分类导航 -->
				<ul class="nav navbar-nav" id="catList">
					<li :class="{'active':index==0}" v-for="(item,index) in categoryList"  @click="getCateProduct(item.cid)">
						<a href="#" >{{item.cname}}</a>
					</li>
				</ul>
				
				<!-- 商品搜索 -->
				<form class="navbar-form navbar-right" role="search" @submit.prevent="searchProduct()">
					<div class="form-group">
						<input type="text" class="form-control" v-model="searchContent" placeholder="请输入搜索内容">
					</div>
					<button type="submit" class="btn btn-default" >提交</button>
				</form>
			</div>
		</div>
	</nav>
</div>
</div>


<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">
	var headVue=new Vue({
		el:"#headContainer",
		data:{
			categoryList:[],
			searchContent:[],
			loginMsg:new Date().toLocaleString()
		},
		methods:{
			getCateProduct:function(cid){
				location.href="product_list?cid="+cid;	
			},
			searchProduct:function(){
				var content=encodeURI(encodeURI(this.searchContent));
				location.href="search_list?searchContent="+content;	
			},
			userExit:function(){
				if(confirm("您真的要离开吗?")){
					this.$http.post("exit",{emulateJSON:true}).then(
						function(res){
							if(res.data.result=="ok"){									
								location.href="index";
							}else{
								alert("退出失败");
							}
						},
						function(res){
							console.log(res);
						}
					);
				}
			},
		},
		created:function(){
			this.$http.get("getCategories").then(
				function(res){
					this.categoryList=res.data;
				},
				function(res){
					console.log(res);
				}
			);
		}
	});
</script>

<!-- 导航条  end-->
