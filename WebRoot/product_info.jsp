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
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<!-- <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script> -->
		
		<script src="js/util.js"></script>
		
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="css/style.css" type="text/css" />
		
		<link rel="stylesheet" type="text/css" href="css/shop_info.css" />
				
				
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
			.min_border{
				border: 0.5px solid red;
			}
		</style>	
		
			
	</head>

	<body style="width: 100%; background: url('img/bg.jpg');">
		<!-- 引入header.jsp -->
		<jsp:include page="header.jsp"></jsp:include>
		<div id="pinfoContainer" v-cloak >
		
		
		<!--商品路径导航--->
		<div class="active_tab">
			<span style="font-size: 20px;font-weight: bolder;color: red;margin-left:140px;">
				<a href="index" >首页</a>/
				<a href="#"><span @click="getCateProduct(pInfo.cid)">{{pInfo.cname}}</span></a>/
				<a href="#">{{pInfo.pname}}</span></a>/
			</span>
		</div>
		
		<!--商品信息  start--->
		<div class="showall">
			<!--left 商品图片详情 start-->
			<div class="showbot">
				
				<!--  大图  start   放图片--->
				<div id="showbox" >
				    <!--  v-for="(item,index) in images" <img alt="" :src="item" :class="{'active pro-img-item':index==0}" style="display: block; width: 400px; height: 400px;" >  -->
				    <img  src="image1" alt="image1" width="400" height="400" />
				   <!--  
					   <img id="img_2" src="image2" alt="image2" width="400" height="400" />
					   <img id="img_3" src="imgae3" alt="image3" width="400" height="400" />
					-->
				</div>
				<!--  大图  end--->
				
				<!-- 轮播  start-->
				<!-- <div id="showsum">
					展示图片里边
				</div> -->
				<!-- 轮播  end-->
				
				<!-- 商品详情页面 下面的小图 -->
			    <div class="clear"></div>
				<div  style="text-align:center;margin-top: 37px;">
					<ul id="show_images">
						<img v-for="(item,index) in images" :src="item"  width="62" height="60" style="margin-left:20px;max-width: 100%; max-height: 100%; position: relative;">
					</ul>
				</div>
				
				<!-- 轮播  上一张-->
				<!-- 	
				<p class="showpage">
					<a href="javascript:void(0);" id="showlast">  < </a>	
					<a href="javascript:void(0);" id="shownext">  > </a>
				</p>
				 -->
				<!-- 轮播  下一张-->
				
				
			</div>
			<!--left 商品图片详情 end-->
			
			
			<!--right 商品名称等信息 conet start-->
			<div class="tb-property">
				<!---商品名称-->
				<div class="tr-nobdr">
					<h4 style="color: #ff0a18;font-size: 28px;font-family: cursive;font-weight: bolder;"> {{pInfo.pname}} </h4>
				</div>
				
				<!---商品价格、原价、销量、评论-->
				<div class="txt">
					<span class="nowprice">
						狂欢价￥<a href="#">{{pInfo.newPrice}}</a>
					</span>
					&nbsp;
					<span class="oldprice">
						商城价￥<a href="#">{{pInfo.oldPrice}}</a>
					</span>
					<div class="cumulative">
						<span class="number ty1">累计售出  <br />   <em id="add_sell_num_363"> {{pInfo.volume}} </em> </span>
						<span class="number tyu">累计评价  <br /> <a href="#ui-c"> <em id="add_sell_num_363"> {{commentCount}}  </em>  </a>   </span>
					</div>
					<div class="clear"></div>
					<span class="update">
						商品上市时间:{{pInfo.pdate}}
					</span>
				</div>
				
				<!---商品分类  尺寸和颜色  start  :class="{'select_active':index==0}"      --->
				<div class="txt-h">
					<span class="tex-o">尺码</span>
					<ul class="glist" id="size" >
						<li id="q_size" v-for="(item,index) in inventorySize" :class="{'select_active':index==0}"  @click="changeSpec()">							
							<a  :title="item.psize"  href="#" id="S">
								{{item.psize}}
							</a>
						</li>						
					</ul>			
				</div>
				
				<div class="txt-h">
					<span class="tex-o">颜色分类</span>
					<ul class="glist" id="color" >
						<li id="q_color"  v-for="(item,index) in inventoryColor" :class="{'select_active':index==0}"  @click="changeSpec()">
							<a :title="item.pcolor"  href="#" id="red" >
								{{item.pcolor}}
							</a>
						</li>						
					</ul>			
				</div>
				<!---商品分类  尺寸和颜色  end--->
				
				<!---数量和库存    start--->
				<div class="gcIpt">
					<span class="guT">数量</span>
					<!--  数量减一  -->
					<input id="min" name="" type="button" value="-" @click="minQuantity()"/>
					<input id="quantity" name="quantity"  v-model="quantity"  type="text"  	style="width:40px; text-align: center; color: #0F0F0F;"  />
					<!--  数量加一  -->
					<input id="add" name="" type="button" value="+" @click="addQuantity()"/>					
					<span class="Hgt">库存（&nbsp;
						<a href="#" style="font-size:24px;color:red;" v-if="pInfo.total!=null" >
							{{pInfo.total}}
						</a>
						<a href="#" style="font-size:28px;color:red;" v-if="pInfo.total==null" >
							0
						</a> &nbsp;）
					</span>
				</div>
				<!---数量和库存    start--->
				
				<!---支持货到付款--->
				<div class="guarantee">
					<span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img src="img/images/me.png"/></a></span>
				</div>
				
				<!---加入购物车    start--->
				<div class="nobdr-btns">
					<button class="addcart hu" v-on:click="addCart()"><img src="img/images/shop.png" width="25" height="25"/>加入购物车</button>
					<button class="addcart yh" v-on:click="addOrders()"><img src="img/images/ht.png" width="25" height="25"/>立即购买</button>
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
			        
					   <span class="pop in">
				            <a href="http://ganquanzhong.top/shop" data-name="进店逛逛"><img src="img/images/shop-line.png"/>进店逛逛</a>
				       </span>	
         
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
							<a href="#" v-on:click="addCart">加入购物车</a>
						</li>
					</ul>
					
					<div class="clear"></div>
				</div>
				
				
				<div id="content" class="active_list">
					<!--商品详情-->
					<div id="ui-a" class="ui-a">
						<ul style="display:block;">
							<p style="text-indent:2em;" v-html="pInfo.pdesc"></p>
						</ul>
					</div>
					
					<!--商品参数-->
					<div id="ui-a" class="ui-a">
						<ul style="display:none;">
							商品参数：   ~~~~
						</ul>
					</div>

					<!--商品评价-->
					<div id="ui-a" class="ui-a">
						<ul style="display:none;">
							<table class="table">
								<thead> {{pInfo.pname}} 评价</thead>
								<tbody>
									<tr class="active" v-for="item in commentList">
										<td style="font-family:'sans-serif'">{{item.username}}</td>
										<td style="color:#f68105;">{{item.content}}</td>
										<td>{{item.created}}</td>
									</tr>
								</tbody>
							</table>
						</ul>
					</div>
					
					<!--售后保障-->
					<div id="ui-a" class="ui-a">
						<ul style="display:none;">
							<p style="text-indent:2em;" v-html="pInfo.pdesc"></p>
						</ul>
					</div>
					
				</div>
			</div>
		</div>
		<!-- 商品介紹  end-->
		</div>
		<!-- 引入footer.jsp -->
		<jsp:include page="footer.jsp"></jsp:include>
		
		<script type="text/javascript">
			$(function(){
				//获取大图
				$.ajax({
					url : "getProductInfo",
					data: { "pid":getQueryString("pid") },
					type : "post",
					dataType : "json",// 回调
					success : function(data) {
						var strs=new Array();
						strs=data.image.split(",");
						//修正图片的正确路径
						for(var i=0;i<strs.length;i++){
							strs[i]="/pic/"+strs[i];
						}
						$("#showbox img").attr('src', strs[0]);
					}
				});	
				
				$("#size>li").click(function(){
					$(this).addClass("select_active").siblings("li").removeClass("select_active");
					$(this).attr("id","q_size").siblings("#size>li").removeAttr("id");
				});
				$("#size>li").mouseenter(function(){
					$(this).attr("id","q_size").siblings("#size>li").removeAttr("id");
				}); 
				
				$("#color>li").click(function(){
					$(this).addClass("select_active").siblings("li").removeClass("select_active");
					$(this).attr("id","q_color").siblings("#color>li").removeAttr("id");
				});
				$("#color>li").mouseenter(function(){
					$(this).attr("id","q_color").siblings("#color>li").removeAttr("id");
				}); 
				
				$("#show_images>img").mouseover(function(){
					$(this).addClass("min_border").siblings("img").removeClass("min_border");
				    var imgSrc=$(this).attr("src");
				    $("#showbox img").attr('src', imgSrc);
				});
			});
		</script>
		
		<script src="js/shop_info.js" type="text/javascript" charset="utf-8"></script>
		
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
					commentList:[],//商品评论列表
					commentCount:0,//商品的评论数目
					inventoryList:[],//商品规格库存
					inventorySize:[],//商品规格库存
					inventoryColor:[],//商品规格库存
					inventoryid:0//选中商品对应的inventoryid
				},	
				methods:{
					getCateProduct:function(cid){
						location.href="product_list?cid="+cid;	
					},
					minQuantity:function(){
						if(this.quantity>1){
							this.quantity=this.quantity-1;
						}
					},
					addQuantity:function(){
						this.quantity=this.quantity+1;
					},
					changeSpec:function(){
						var qSize=$("#q_size>a").attr("title");
						var qColor=$("#q_color>a").attr("title");
						var params={
								"pid":getQueryString("pid"),
								"size":qSize,
								"color":qColor
							};
						//判断
						//alert("尺码："+qSize+" 颜色："+qColor);
						if(qSize!=null && qColor!=null){
							this.$http.post("queryInventory",params,{emulateJSON:true}).then(
								function(res){
									//请求成功
									this.pInfo.total=res.data.amount;
									this.inventoryid=res.data.id;
									//alert(this.pInfo.total);
								},
								function(res){
									//请求失败
									console.log(res);
								}
							);	
						}
					},
					//加入到购物车
					addCart:function(){
						if(this.pInfo.total<=0 || this.pInfo.total==null){
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
									"subtotal":subtotal,
									"specid":this.inventoryid
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
							if(this.pInfo.total<=0 || this.pInfo.total==null){
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
										/* "count":this.quantity,//数量 */
										"count":this.quantity,//数量
										"total":subtotal,//小计
										"specid":this.inventoryid
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
					this.$http.post("getCommentCount",params,{emulateJSON:true}).then(
							function(res){
								this.commentCount=res.data.count;
							},
							function(res){
								console.log(res);
							}
					);
					//获取商品规格库存
					/*
					this.$http.post("getInventoryByPid",params,{emulateJSON:true}).then(
							function(res){
								this.inventoryList=res.data;								
							},
							function(res){
								console.log(res);
							}
					);
					*/
					//获取  商品尺寸
					this.$http.post("getInventorySize",params,{emulateJSON:true}).then(
							function(res){
								this.inventorySize=res.data;								
							},
							function(res){
								console.log(res);
							}
					);
					//获取   商品yanse
					this.$http.post("getInventoryColor",params,{emulateJSON:true}).then(
							function(res){
								this.inventoryColor=res.data;								
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