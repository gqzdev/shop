<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="isLogin.jsp" %>
<!DOCTYPE html>
<html>
	<head></head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords" content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
	<meta name="author" content="ForFuture Shop" />
	<link rel="shortcut icon" href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
	<title>会员注册</title>
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

		<div class="container" id="myInfoContainer" v-cloak
			style="width: 100%; background: url('img/regist_bg.jpg');">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8"
					style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
					<font>会员个人信息设置</font>
					<form class="form-horizontal" style="margin-top: 5px;" id="Form" v-on:submit.prevent="modify()">
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">
								用户名
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="username"  disabled="disabled" :value="userList.username"
									name="username" >
							</div>
						</div>
						<div class="form-group">
							<label for="usercaption" class="col-sm-2 control-label">
								姓名
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="name" name="name" :value="userList.name" v-model="userList.name">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
								Email
							</label>
							<div class="col-sm-6">
								<input type="email" class="form-control" id="email" name="email" :value="userList.email" v-model="userList.email" >
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-2 control-label">
								电话
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="phone" name="phone" :value="userList.phone" v-model="userList.phone">
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">
								地址
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="addr" name="addr" :value="userList.addr" v-model="userList.addr">
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">
								邮编
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="code" name="code" :value="userList.code" v-model="userList.code"/>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label"></label>
							<div class="col-sm-6" id="checkResult"></div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" width="100" value="修改信息" name="submit" id="modify" 
									style="background: url('img/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
						</div>
					</form>
				</div>

				<div class="col-md-2"></div>

			</div>
		</div>

		<!-- 引入footer.jsp -->
		<jsp:include page="footer.jsp"></jsp:include>
		<script type="text/javascript" src="js/vue.min.js"></script>
		<script type="text/javascript" src="js/vue-resource.js"></script>
		<script type="text/javascript">
			var myInfoVue=new Vue({
				el:"#myInfoContainer",
				data:{
					userList:{
						username:"",
						password:"",
						repassword:"",
						name:"",
						email:"",
						phone:"",
						addr:"",
						code:""	
					}//用户信息					
				},
				methods:{
					modify:function(){
						var params={
								"username":this.userList.username,
								"name":this.userList.name,
								"email":this.userList.email,
								"phone":this.userList.phone,
								"addr":this.userList.addr,
								"code":this.userList.code,
								"checkcode":this.checkcode
							};
						this.$http.post("userInfoModify",params,{emulateJSON:true}).then(
							function(res){
								if(res.data.result=="invalid"){
									alert("发生错误!");
								}else if(res.data.result=="ok"){
									alert("修改成功!");
									history.back();//返回上一页面
								}else{
									alert("修改失败!")									
								}
							},
							function(res){
								console.log(res);
							}
						);
					},
					changeCheckCode:function(){
						var strs=this.imagSrc;
						this.imagSrc=strs+"?"+new Date();
					},
					verifyPassword:function(){
						var pass=this.user.password;
						var repass=this.user.repassword;
						if(pass!=repass){
							this.verifyResult="两次密码不一致";
							return false;
						}else{
							this.verifyResult="";
						}
					}
				},
				created:function(){
					this.$http.post("userInfo",{emulateJSON:true}).then(
						function(res){
							this.userList=res.data;
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




