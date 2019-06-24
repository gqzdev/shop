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
		<title>会员登录</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
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
			
			.container .row div { /* position:relative;
							 float:left; */
				
			}
			
			font {
				color: #666;
				font-size: 22px;
				font-weight: normal;
				padding-right: 17px;
			}
		</style>
	</head>
	<body>
		<!-- 引入header.jsp -->
		<jsp:include page="header.jsp"></jsp:include>

		<div class="container" id="loginContainer"  v-cloak
			style="width: 100%; height: 460px; background: #FF2C4C url('img/loginbg.jpg') no-repeat;">
			<div class="row">
				<div class="col-md-7">
					<!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
				</div>

				<div class="col-md-5">
					<div
						style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
						<font>会员登录</font>
						<div>
							&nbsp;
						</div>
						<form class="form-horizontal" @submit.prevent="userLogin()">
							<div class="form-group">
								<label for="username" class="col-sm-2 control-label">
									用户名
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="username" name="username" v-model="user.username" required="required"
										placeholder="请输入用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">
									密码
								</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="password" name="password"  v-model="user.password" required="required"
									  placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">
									验证码
								</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="checkcode" required="required"
										name="checkcode" placeholder="验证码"  v-model="checkcode"/>
								</div>
								<div class="col-sm-3">
									<img id="img1" :src="imagSrc" @click="changeCheckCode()" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label"></label>
								<div class="col-sm-6" id="checkResult" style="color:red;font-weight:bolder;">{{checkResult}}</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" width="100" value="登录" name="submit" id="login"
										style="background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- 引入footer.jsp -->
		<jsp:include page="footer.jsp"></jsp:include>
		<script type="text/javascript" src="js/vue.min.js"></script>
		<script type="text/javascript" src="js/vue-resource.js"></script>
		<script type="text/javascript">
			var loginVue=new Vue({
				el:"#loginContainer",
				data:{
					user:{
						username:"",
						password:""
					},
					checkcode:"",//验证码
					imagSrc:"VerifyCode",//图片验证码
					checkResult:""//验证结果
				},
				methods:{
					userLogin:function(){
						var params={"username":this.user.username,"password":this.user.password,"checkcode":this.checkcode};
						this.$http.post("checkUserLogin",params,{emulateJSON:true}).then(
								function(res){
									if(res.data.result=="vcodeerror"){
										this.checkResult="验证码错误";
									}else if(res.data.result=="ok"){
										this.checkResult="";
										alert("登录成功!");
										//location.href="index";
										history.back();//返回上一页面
									}else{
										this.checkResult="用户名或密码错误";
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
					}
				}
			});
		</script>
	</body>
</html>