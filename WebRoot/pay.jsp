<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description"
		content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords"
		content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
	<meta name="author" content="mike zhong" />
	<link rel="shortcut icon"
		href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
	<title>ForFuture商品付款</title>
	<link>
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".pay_item").click(function() {
				$(this).addClass('checked').siblings('.pay_item').removeClass('checked');
				var dataid = $(this).attr('data-id');
				$(".shang_payimg img").attr("src", "ds_images/" + dataid + ".png");
				$("#shang_pay_txt").text(dataid == "alipay" ? "支付宝" : "微信");
			});
		});
	
		function dashangToggle() {
			$(".hide_box").fadeToggle();
			$(".shang_box").fadeToggle();
		}
	</script>
	<style type="text/css">
		.content {
			width: 80%;
			margin: 10px auto;
		}
		
		.hide_box {
			z-index: 999;
			filter: alpha(opacity = 50);
			background: #666;
			opacity: 0.5;
			-moz-opacity: 0.5;
			left: 0;
			top: 0;
			height: 99%;
			width: 100%;
			position: fixed;
			display: none;
		}
		
		.shang_box {
			width: 540px;
			height: 540px;
			padding: 10px;
			background-color: #fff;
			border-radius: 10px;
			position: fixed;
			z-index: 1000;
			left: 50%;
			top: 50%;
			margin-left: -280px;
			margin-top: -280px;
			border: 1px dotted #dedede;
			display: none;
		}
		
		.shang_box img {
			border: none;
			border-width: 0;
		}
		
		.dashang {
			display: block;
			width: 100px;
			margin: 65px auto;
			height: 44px;
			line-height: 25px;
			padding: 10px;
			background-color: #E74851;
			color: #fff;
			text-align: center;
			text-decoration: none;
			border-radius: 10px;
			font-weight: bold;
			font-size: 16px;
			transition: all 0.3s;
		}
		
		.dashang:hover {
			opacity: 0.8;
			padding: 15px;
			font-size: 18px;
		}
		
		.shang_close {
			float: right;
			display: inline-block;
		}
		
		.shang_logo {
			display: block;
			text-align: center;
			margin: 20px auto;
		}
		
		.shang_tit {
			width: 100%;
			height: 75px;
			text-align: center;
			line-height: 66px;
			color: #a3a3a3;
			font-size: 16px;
			background: url('/dsimg/cy-reward-title-bg.jpg');
			font-family: 'Microsoft YaHei';
			margin-top: 7px;
			margin-right: 2px;
		}
		
		.shang_tit p {
			color: #a3a3a3;
			text-align: center;
			font-size: 16px;
		}
		
		.shang_payimg {
			width: 144px;
			height: 144px;
			padding: 10px;
			border: 6px solid #EA5F00;
			margin: 0 auto;
			border-radius: 3px;
		}
		
		.shang_payimg img {
			display: block;
			text-align: center;
			width: 140px;
			height: 140px;
		}
		
		.pay_explain {
			text-align: center;
			margin: 10px auto;
			font-size: 12px;
			color: #545454;
		}
		
		.radiobox {
			width: 16px;
			height: 16px;
			background: url('https://static.runoob.com/images/dashang/radio2.jpg');
			display: block;
			float: left;
			margin-top: 5px;
			margin-right: 14px;
		}
		
		.checked .radiobox {
			background: url('https://static.runoob.com/images/dashang/radio1.jpg');
		}
		
		.shang_payselect {
			text-align: center;
			margin: 0 auto;
			margin-top: 40px;
			cursor: pointer;
			height: 60px;
			width: 280px;
		}
		
		.shang_payselect .pay_item {
			display: inline-block;
			margin-right: 10px;
			float: left;
		}
		
		.shang_info {
			clear: both;
		}
		
		.shang_info p, .shang_info a {
			color: #C3C3C3;
			text-align: center;
			font-size: 12px;
			text-decoration: none;
			line-height: 2em;
		}
		
		#footer .footer {
			text-align: center;
			font-size: 16px;
			font-weight: 4;
			maring-top: 70px;
		}
		
		a:hover {
			color: red;
			font-weight: bold;
			text-decoration: none;
			maring-left: 2px;
		}
		</style>
		
		<script type="text/javascript">
			$(function() {
				$(".pay_item")
						.click(
								function() {
									$(this).addClass('checked').siblings('.pay_item')
											.removeClass('checked');
									var dataid = $(this).attr('data-id');
									$(".shang_payimg img").attr("src",
											"img/" + dataid + ".png");
									$("#shang_pay_txt").text(
											dataid == "alipay" ? "支付宝" : "微信");
								});
			});
		
			function dashangToggle() {
				$(".hide_box").fadeToggle();
				$(".shang_box").fadeToggle();
			}
		</script>
	</head>

<body>
	<!-- 打赏 start -->
	<!---打赏 start-->
	<div class="dashang_content">
		<p>
			<a href="javascript:void(0)" onclick="dashangToggle()"
				class="dashang" title="打赏，支持一下">打赏</a>
		</p>
		<div class="hide_box"></div>

		<div class="shang_box">
			<a class="shang_close" href="javascript:void(0)"
				onclick="dashangToggle()" title="关闭"> <img src="img/close.jpg"
				alt="取消" /></a>
			<div class="shang_tit">
				<p>感谢您的支持，我会继续努力的!</p>
			</div>
			<div class="shang_payimg">
				<img src="img/alipay.png" alt="扫码支持" title="扫一扫" />
			</div>
			<div class="pay_explain">扫码打赏，你说多少就多少</div>
			<div class="shang_payselect">
				<div class="pay_item checked" data-id="alipay">
					<span class="radiobox"></span> <span class="pay_logo"><img
						src="img/alipay.jpg" alt="支付宝" /></span>
				</div>
				<div class="pay_item" data-id="weipay">
					<span class="radiobox"></span> <span class="pay_logo"><img
						src="img/wechat.jpg" alt="微信" /></span>
				</div>
			</div>
			<div class="shang_info">
				<p>
					打开<span id="shang_pay_txt">支付宝</span>扫一扫，即可进行扫码打赏哦
				</p>
				<p>
					Powered by <a href="#" target="_blank" title="ForFuture Design">ForFuture</a>，Design
					ForFuture
				</p>
			</div>
		</div>
	</div>
	<!---打赏 end-->
	<!-- 打赏 end -->

</body>
</html>