<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8" />
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
		
		<link rel="stylesheet" type="text/css" href="css/shop_info.css" />
				
		<script src="js/shop_info.js" type="text/javascript" charset="utf-8"></script>		
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

	<body style="width: 100%; background: url('img/bg.jpg');">
		<!-- 引入header.jsp -->
		<jsp:include page="header.jsp"></jsp:include>
		
		<!--商品路径导航--->
		<div class="active_tab">
			<span style="font-size: 20px;font-weight: bolder;color: red;margin-left:140px;">
				<a href="index" >首页</a>/
				<a href="#"><span @click="getCateProduct(pInfo.cid)"> 女装男装</span></a>/
				<a href="#">春装2018新款女装韩版显瘦收腰碎花刺绣蕾丝短裙夏季 </span></a>/
			</span>
		</div>
		
		<!--商品信息  start--->
		<div class="showall">
			<!--left 商品图片详情 start-->
			<div class="showbot">
				
				<!--  大图  start   放图片--->
				<div id="showbox">
				    <img src="../pic/3b7c5a5d96e0435082d91152477a223f.png" width="400" height="400" />
				    <img src="../pic/a85015f2971b4fbeb98ae1b62547a53c.jpg" width="400" height="400" />
				    <img src="../pic/28e191a5812643c2b1f574441a2763ea.jpg" width="400" height="400" />
				    <img src="../pic/3b7c5a5d96e0435082d91152477a223f.png" width="400" height="400" />
				    <img src="../pic/a85015f2971b4fbeb98ae1b62547a53c.jpg" width="400" height="400" />
				    <img src="../pic/28e191a5812643c2b1f574441a2763ea.jpg" width="400" height="400" />
				   <!--  <img src="img/images/photos/img01.png" width="400" height="400" />
					<img src="img/images/photos/img02.png" width="400" height="400" />
					<img src="img/images/photos/img03.png" width="400" height="400" />
					<img src="img/images/photos/img04.png" width="400" height="400" />
					<img src="img/images/photos/img05.png" width="400" height="400" />
					<img src="img/images/photos/img06.png" width="400" height="400" /> -->
				</div>
				<!--  大图  end--->
				
				<!-- 轮播  start-->
				<div id="showsum">
					<!--展示图片里边-->
				</div>
				<!-- 轮播  end-->
				
				<!-- 轮播  上一张-->
				<p class="showpage">
					<a href="javascript:void(0);" id="showlast">	< </a>	
					<a href="javascript:void(0);" id="shownext">  > </a>
				</p>
				<!-- 轮播  下一张-->
				
			</div>
			<!--left 商品图片详情 end-->
			
			
			<!--right 商品名称等信息 conet start-->
			<div class="tb-property">
				<!---商品名称-->
				<div class="tr-nobdr">
					<h4 style="color: #ff0a18;font-size: 28px;font-family: cursive;font-weight: bolder;"> 春装2018新款女装韩版显瘦收腰碎花刺绣蕾丝短裙夏季 </h4>
				</div>
				
				<!---商品价格、原价、销量、评论-->
				<div class="txt">
					<span class="nowprice">
						狂欢价￥<a href="#">599.00</a>
					</span>
					&nbsp;
					<span class="oldprice">
						商城价￥<a href="#">599.00</a>
					</span>
					<div class="cumulative">
						<span class="number ty1">累计售出  <br />   <em id="add_sell_num_363">370 </em> </span>
						<span class="number tyu">累计评价  <br /> <a href="#ui-c"> <em id="add_sell_num_363">25  </em>  </a>   </span>
					</div>
					<div class="clear"></div>
					<span class="update">
						商品上市时间:2014年
					</span>
				</div>
				
				<!---商品分类  尺寸和颜色  start--->
				<div class="txt-h">
					<span class="tex-o">尺码</span>
					<ul class="glist" id="size" >
						<li class="select_active">							
							<a  title="S" href="#" id="S">S</a>
						</li>
						<li>
							<a title="M" href="#" id="M">M</a>
						</li>
						<li>
							<a title="L" href="#" id="L">L</a>
						</li>
            <li>
            	<a title="XL" href="#" id="XM">XL</a>
            </li>
					</ul>			
				</div>
				
				<div class="txt-h">
					<span class="tex-o">颜色分类</span>
					<ul class="glist" id="color" >
						<li class="select_active">
							<a title="红色" href="#" id="red" >粉红色
								<img src="" alt="" />
							</a>
						</li>
						<li >
							<a title="白色" href="#" id="white">图色
								<img src="" alt=""/>
							</a>
						</li>
						<li>
							<a title="黑色" href="#" id="blank">米色
								<img src="" alt="" />
							</a>
						</li>
					</ul>			
				</div>
				<!---商品分类  尺寸和颜色  end--->
				
				<!---数量和库存    start--->
				<div class="gcIpt">
					<span class="guT">数量</span>
					<!--  数量减一  -->
					<input id="min" name="" type="button" value="-" />
					<input id="quantity" name="quantity" type="text" value="1" style="width:40px; text-align: center; color: #0F0F0F;" />
					<!--  数量加一  -->
					<input id="add" name="" type="button" value="+" />					
					<span class="Hgt">库存（99）</span>
				</div>
				<!---数量和库存    start--->
				
				<!---支持货到付款--->
				<div class="guarantee">
					<span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img src="img/images/me.png"/></a></span>
				</div>
				
				<!---加入购物车    start--->
				<div class="nobdr-btns">
					<button class="addcart hu"><img src="img/images/shop.png" width="25" height="25"/>加入购物车</button>
					<button class="addcart yh"><img src="img/images/ht.png" width="25" height="25"/>立即购买</button>
				</div>
				<!---加入购物车    end--->
				
			</div>
			<!--right 商品名称等信息 conet start-->
			
			
			<!--right 店铺信息 start-->
			<div class="extInfo">
				
				<div class="brand-logo">
					<a href="http://ganquanzhong.top" title="ForFuture商城自营">
						<img src="img/logo.png" width="220" height="90"/>
					</a>
				</div>
				
				<div class="seller-pop-box">
					<span class="tr">ForFuture Shop商城自营</span>
					<span class="tr">Just for a better future shop</span>
					<span class="tr"><a href="http://ganquanzhong.top/shop" target="_blank">ForFuture Shop</a></span>
					<span class="tr hoh">
            <a title="ForFuture1号商城" href="http://ganquanzhong.top/shop" target="_blank">总部：ForFuture1号商城</a>
          </span>
				</div>
				
				<div class="seller-phone">
					<span class="pop im">
            <a href="http://ganquanzhong.top/Web/ForFuture-qq.html" target="_blank"  data-name="联系卖家"><img src="img/images/phon.png"/>联系卖家</a>
          </span>
					<span class="pop in">
            <a href="http://ganquanzhong.top/Web/ForFuture-qq.html" data-name="咨询卖家" target="_blank"><img src="img/images/qq.png"/>咨询卖家</a>
          </span>
          <center>
						<span class="pop in">
	            <a href="http://ganquanzhong.top/shop" data-name="进店逛逛"><img src="img/images/shop-line.png"/>进店逛逛</a>
	          </span>	
          </center>
				</div>
				
				<div class="jd-service">
					<a href="http://ganquanzhong.top/shop">
						ForFuture MAIL
					</a>
				</div>
				
				<div class="suport-icons" >					
					<img src="img/images/weixinGZH.png" />
				</div>
				
			</div>
			<!--right 店铺信息 start-->
			
		</div>
		<!--商品信息  end--->
				
		
		<!-- 商品介紹  start-->
		<div class="gdetail">
			<div class="detail">
				<div class="active_tab" id="outer">
					<!--轮播导航-->
					<ul class="act_title_left" id="tab">
						<li class="act_active">
							<a href="#">商品介绍</a>
						</li>
						<li>
							<a href="#">商品参数</a>
						</li>
						<li>
							<a href="#">商品评价</a>
						</li>
						<li>
							<a href="#">售后保障</a>
						</li>
					</ul>
					
					<ul class="act_title_right">
						<li class="mui">
							<a id="mui-a" href="#">扫手机下单+</a>
						</li>
						<li class="mui-ac">
							<a href="#">加入购物车</a>
						</li>
					</ul>
					
					<div class="clear"></div>
				</div>
				
				
				<div id="content" class="active_list">
					<!--商品详情-->
					<div id="ui-a" class="ui-a">
						<ul style="display:block;">
							<li>    品牌： 依苼美

									    商品名称：依苼美 性感连衣裙女春装2018新款女装韩版显瘦收腰碎花刺绣蕾丝短裙夏季 图片色 S
									    商品编号：27210118811
									    店铺： 荣美女装专营店
									    商品毛重：1.0kg
									    货号：AF5246
									    腰型：中腰
									    风格：OL通勤
									    领型：圆领
									    适用年龄：25-29周岁
									    图案：纯色
									    尺码：S，M，L，XL
									    组合规格：单件
									    版型：A型
									    主要材质：雪纺
									    流行元素：拼接
									    袖长：短袖
									    袖型：常规
									    衣门襟：拉链
									    裙型：A字裙
									    裙长：中裙
									    分类：其它
									    适用人群：中老年
									    上市时间：2018夏季
							</li>
							<li>商品编号：ECS001983</li>
							<li>品牌</li>
							<li>上架时间：2018-05-24</li>
							<li>商品毛重：480克</li>
							<li>库存： 999 </li>
						</ul>
					</div>
					
					<!--商品参数-->
					<div id="bit" class="bit">
						<ul style="display:none;">
						 	<li><img src="../pic/3b7c5a5d96e0435082d91152477a223f.png" width="400" height="400" /></li>
				    		<li><img src="../pic/a85015f2971b4fbeb98ae1b62547a53c.jpg" width="400" height="400" /></li>
				   			<li><img src="../pic/28e191a5812643c2b1f574441a2763ea.jpg" width="400" height="400" /></li>
							<!-- <li><img src="img/images/ko-1.jpg" /></li>
							<li><img src="img/images/ko-2.jpg" /></li>
							<li><img src="img/images/ko.jpg" /></li>
							<li><img src="img/images/ko-1.jpg" /></li>
							<li><img src="img/images/ko-2.jpg" /></li> -->
						</ul>
					</div>

					<!--商品评价-->
					<div id="ui-a" class="ui-a">
						<ul style="display:none;">
							<p>商品评价：</p>
						</ul>
					</div>
					
					<!--售后保障-->
					<div id="uic" class="uic">
						<ul style="display:none;">
							<p>商品名称：春装2018新款女装韩版显瘦收腰碎花刺绣蕾丝短裙夏季 </p>							
						</ul>
					</div>
					
				</div>
			</div>
		</div>
		<!-- 商品介紹  end-->
		<!-- 引入footer.jsp -->
		<jsp:include page="footer.jsp"></jsp:include>
	</body>

</html>