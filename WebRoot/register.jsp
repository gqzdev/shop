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

		<div class="container" id="registerContainer" v-cloak
			style="width: 100%; background: url('img/regist_bg.jpg');">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8"
					style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
					<font>会员注册</font>
					<form class="form-horizontal" style="margin-top: 5px;" id="Form" @submit.prevent="userRegister()">
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">
								用户名(唯一)
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="username" required="required" v-model="user.username"
									name="username" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">
								密码
							</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="password" required="required" v-model="user.password"
									name="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="confirmpwd" class="col-sm-2 control-label">
								确认密码
							</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="confirmpwd" required="required" v-model="user.repassword"
									name="confirmpwd" placeholder="请输入确认密码" v-on:blur="verifyPassword()">
								<span style="color:red">{{verifyResult}}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="usercaption" class="col-sm-2 control-label">
								姓名
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="name" name="name" required="required" v-model="user.name"
									placeholder="请输入姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
								Email
							</label>
							<div class="col-sm-6">
								<input type="email" class="form-control" id="email" name="email" required="required" v-model="user.email"
									placeholder="请输入Email">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-2 control-label">
								电话
							</label>
							<div class="col-sm-6">
								<input type="text" pattern="^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}" class="form-control" id="phone" name="phone" required="required" v-model="user.phone"
									placeholder="请输入电话">
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">
								地址
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="addr" name="addr" required="required" v-model="user.addr"
									placeholder="请输入地址">
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">
								邮编
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="code" name="code" required="required" v-model="user.code"
									placeholder="请输入邮编">
							</div>
						</div>
						<div class="form-group">
							<label for="date" class="col-sm-2 control-label">
								验证码
							</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="checkcode" required="required" v-model="checkcode"
									name="checkcode" placeholder="请输入验证码"
									onblur="javascript:verifycode();">

							</div>
							<div class="col-sm-2">
								<img id="img1" :src="imagSrc" @click="changeCheckCode()"/>
							</div>

						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label"></label>
							<div class="col-sm-6" id="checkResult" style="color:red">{{checkResult}}</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" width="100" value="注册" name="submit" id="reg" 
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
			var registerVue=new Vue({
				el:"#registerContainer",
				data:{
					user:{
						username:"",
						password:"",
						repassword:"",
						name:"",
						email:"",
						phone:"",
						addr:"",
						code:""			
					},
					checkcode:"",//验证码
					imagSrc:"VerifyCode",//图片验证码
					checkResult:"",//验证结果
					verifyResult:""
				},
				methods:{
					userRegister:function(){
						var params={
								"username":this.user.username,
								"password":this.user.password,
								"name":this.user.name,
								"email":this.user.email,
								"phone":this.user.phone,
								"addr":this.user.addr,
								"code":this.user.code,
								"checkcode":this.checkcode
								};
						this.$http.post("userRegister",params,{emulateJSON:true}).then(
								function(res){
									if(res.data.result=="vcodeerror"){
										this.checkResult="验证码错误";
									}else if(res.data.result=="ok"){
										alert("注册成功!");
										history.back();//返回上一页面
									}else{
										alert("注册信息有误!")
										this.checkResult="注册失败";
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
				}
			});
		</script>
	</body>
</html>




