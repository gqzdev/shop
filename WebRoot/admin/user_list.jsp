<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html lang="en" class="ie6 ielt7 ielt8 ielt9"><![endif]--><!--[if IE 7 ]><html lang="en" class="ie7 ielt8 ielt9"><![endif]--><!--[if IE 8 ]><html lang="en" class="ie8 ielt9"><![endif]--><!--[if IE 9 ]><html lang="en" class="ie9"> <![endif]--><!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en"><!--<![endif]--> 
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords" content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
		<meta name="author" content="mike zhong" />
		<link rel="shortcut icon" href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
	
		<jsp:include page="top.jsp"></jsp:include>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="../css/style.css" type="text/css" />
		<link rel="stylesheet" href="../css/style1.css" type="text/css" />
		<link rel="stylesheet" href="../css/zpageNav.css" type="text/css" />
	</head>
	<body>
		<div class="container" id="userListContainer" v-cloak>
			<jsp:include page="header.jsp"></jsp:include>
			<div class="row">
				<jsp:include page="left.jsp"></jsp:include>
				
				<!-- Main -->
				<div class="span9">
					<h1>
						用户列表
					</h1>
					<h4>请输入查询条件：</h4>
					
					<!-- 查询表单 start -->
					<form class="form-horizontal" method="post" action="selectUserByTerm">
						<fieldset>
						用户ID：
						<input type="text" name="uid" id="uid"/>
						&nbsp;&nbsp;
						用户名：
						<input type="text" name="username" id="username"/>
						&nbsp;&nbsp;
						<button id="search" type="submit" class="btn btn-primary">查询</button> 
						</fieldset>
					</form>
					<!-- 查询表单 start -->
					<center style="color:red;font-size:20px;font-weight:bolder;">${msg }</center>
					<table class="table table-bordered table-striped" <c:if test="${msg!=null }">style="visibility:hidden"</c:if>>	
						<thead>
							<tr>
								<th>用户编号</th>
								<th>用户名</th>
								<th>收件人姓名</th>
								<th>邮箱</th>
								<th>收件人电话</th>
								<th>收件人地址</th>
								<th>邮编</th>
							</tr>
						</thead>
						<tbody>
							<!-- 使用jsp标签 -->
							<%-- 
							<c:forEach items="${userList}" var="user" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
									<td>${user.username }</td>
									<td>${user.name }</td>
									<td>${user.email }</td>
									<td>${user.phone }</td>
									<td>${user.addr}</td>
									<td>${user.code }</td>
								</tr>
							</c:forEach> 
							--%>
							<tr v-for="(user,index) in userList">
							    <td>{{index+1+(page-1)*pageSize}}</td>
								<td>{{user.username}}</td>
								<td>{{user.name}}</td>
								<td>{{user.email}}</td>
								<td>{{user.phone}}</td>
								<td>{{user.addr}}</td>
								<td>{{user.code}}</td>
								<!-- 
								<td>
									<a href="javascript:void()" v-on:click="deleteOrder(order.oid)">删除</a>
								</td> 
								-->
							</tr>	
						</tbody>
					</table>	
					<!--分页 start-->
					<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
						<zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" 
								v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
						</zpagenav>
					</div>
					<!-- 分页 end -->	
								
					<!-- 
					<div class="pagination">
						<ul id="pagination1"></ul>
					</div>
					-->
				</div>
			</div>
		</div>
		<!-- Vue -->		
	<script type="text/javascript" src="../js/vue.min.js"></script>
	<script type="text/javascript" src="../js/vue-resource.js"></script>
	<script type="text/javascript" src="../js/zpageNav.js"></script>
	<script type="text/javascript">
		var headVue=new Vue({
			el:"#userListContainer",
			data:{
				userList:[],
				page:1,//显示的是哪一页
				pageSize:10,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9//最大的页数
			},
			methods:{
				pageHandler:function(page){//跳转到page页
					this.page=page;//修改显示的页数page
					//发送Ajax请求
					//参数Params 
					var params={"page":page,"pageSize":this.pageSize};
					this.$http.post("getUserlist",params,{emulateJSON:true}).then(
						function(res){
							this.userList=res.data.list;
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				},
				deleteUser:function(uid){
					var params={"uid":uid};
					this.$http.post("delectUser",params,{emulateJSON:true}).then(
						function(res){
							alert("删除成功！");
							window.location.reload(true);
						},
						function(res){
							console.log(res);
						}
					);
				}
				,
				//格式化时间
				dateFormat:function(time) {
				    var date=new Date(time);
				    var year=date.getFullYear();
				    /* 在日期格式中，月份是从0开始的，因此要加0
				     * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
				     * */
				    var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
				    var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
				    var hours=date.getHours()<10 ? "0"+date.getHours() : date.getHours();
				    var minutes=date.getMinutes()<10 ? "0"+date.getMinutes() : date.getMinutes();
				    var seconds=date.getSeconds()<10 ? "0"+date.getSeconds() : date.getSeconds();
				    // 拼接
				    return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
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

