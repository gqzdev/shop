<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
    
<!DOCTYPE html>

<link rel="stylesheet" href="css/dashang.css" />

<!-- 登录 注册 购物车 start -->
<div id="headContainer" v-cloak>
<div class="container-fluid">
	<div class="col-md-3">
		<a href="https://ganquanzhong.top" target="_blank"> <img src="img/logo.png" width="100px" height="60px"/> </a>
	</div>
	<div class="col-md-5">
		 <a onclick="dashangToggle()" target="blank" style="text-decoration: none;">
	    <span v-bind:title="loginMsg" style="color:#f28205;text-align:center;font-size:40px;font-family:'楷体';font-weight: bolder;">未来商城FORFUTURE SHOP</span>
		</a>
	</div>
	<div class="col-md-4" style="padding-top:20px">
		<ol class="list-inline">
			<li>
			      <a onclick="dashangToggle()" target="blank" style="font-size: 28px;
                                   text-decoration: none; color: #f90101b5; font-weight: 700;">打赏</a>
			</li>
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
				<form class="navbar-form navbar-right" role="search" @submit.prevent="searchProduct()" style="margin-right:-34px;">
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


<!--打赏 start-->
		<div class="dashang_content">
			<!--<p>
				<a href="javascript:void(0)" onclick="dashangToggle()" class="dashang" title="打赏，支持一下">打赏</a>
			</p>-->
			<div class="hide_box"></div>

			<div class="shang_box">
                                <span style="color:red;"><a href="https://pan.baidu.com/s/1NiNuZIEOfvTNlyv3RZNksA " target="_blank">
                                             项目下载：https://pan.baidu.com/s/1NiNuZIEOfvTNlyv3RZNksA
                                          
</a>密码：<a>m2p7</a>
                                 </span>
				<a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="关闭">
					<img src="http://ganquanzhong.top/index/ds_images/close.jpg" alt="取消" />
                                </a>
				<div class="shang_tit">
					<p>感谢您的支持，我会继续努力的!</p>
					
				</div>
				<div class="shang_payimg">
					<img src="http://ganquanzhong.top/index/ds_images/alipay_10.png" alt="扫码支持" title="扫一扫" />
				</div>
				<div class="pay_explain">扫码打赏，你说多少就多少</div>
				<div class="shang_payselect">
					<div class="pay_item checked" data-id="alipay">
						<span class="radiobox"></span>
						<span class="pay_logo">
							<img src="http://ganquanzhong.top/index/ds_images/alipay.jpg" alt="支付宝" />
						</span>
					</div>
					<div class="pay_item" data-id="weipay">
						<span class="radiobox"></span>
						<span class="pay_logo">
							<img src="http://ganquanzhong.top/index/ds_images/wechat.jpg" alt="微信" />
						</span>
					</div>
				</div>
				<div class="shang_info">
					<p>打开<span id="shang_pay_txt">支付宝</span>扫一扫，即可进行扫码打赏哦</p>
					<p>Powered by
						<a href="http://ganquanzhong.top" target="_blank" title="ForFuture Design">ForFuture</a>，Design ForFuture</p>
				</div>
			</div>
		</div>
		<script>
			$(function() {
				$(".pay_item").click(function() {
					$(this).addClass('checked').siblings('.pay_item').removeClass('checked');
					var dataid = $(this).attr('data-id');
					$(".shang_payimg img").attr("src", "http://ganquanzhong.top/index/ds_images/" + dataid + "_10.png");
					$("#shang_pay_txt").text(dataid == "alipay" ? "支付宝" : "微信");
				});
			});
			
			function dashangToggle() {
				$(".hide_box").fadeToggle();
				$(".shang_box").fadeToggle();
			}
		</script>
		<!---打赏 end-->












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
