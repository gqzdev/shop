<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html lang="en" class="ie6 ielt7 ielt8 ielt9"><![endif]--><!--[if IE 7 ]><html lang="en" class="ie7 ielt8 ielt9"><![endif]--><!--[if IE 8 ]><html lang="en" class="ie8 ielt9"><![endif]--><!--[if IE 9 ]><html lang="en" class="ie9"> <![endif]--><!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en"><!--<![endif]--> 
	<head>
		<jsp:include page="top.jsp"></jsp:include>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="../css/style.css" type="text/css" />
		<link rel="stylesheet" href="../css/style1.css" type="text/css" />
		<link rel="stylesheet" href="../css/zpageNav.css" type="text/css" />
	</head>
	<body>
		<div class="container" id="ordersListContainer" v-cloak>
			<jsp:include page="header.jsp"></jsp:include>
			<div class="row">
				<jsp:include page="left.jsp"></jsp:include>
				<div class="span9">
					<h1>
						订单列表
					</h1>
					<h4>请输入查询条件：</h4>
					<form class="form-horizontal">
						<fieldset>
						用户ID：
						<input type="text" name="uid" id="uid"/>
						&nbsp;&nbsp;
						状态：
						<select name="state" id="state">
								<option value="0" selected="selected">未付款</option>
								<option value="1">未发货</option>
								<option value="2">已发货</option>
								<option value="3">已收货</option>
						</select>
						&nbsp;&nbsp;
						<button id="search" type="button" class="btn btn-primary">查询</button> 
						</fieldset>
					</form>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>订单编号</th>
								<th>用户编号</th>
								<th>总价格</th>
								<th>创建时间</th>
								<th>状态</th>
								<th>快递单号</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(order,index) in ordersList">
								<!-- <td><input :id="'grid_'+(stu.id)" name="workerRadio"type="radio" aria-label="选择" /></td> -->
							    <!-- <td>{{index+1+(page-1)*pageSize}}</td> -->
								<td>{{order.oid}}</td>
								<td>{{order.uid}}</td>
								<td>{{order.total}}</td>
								<td>{{dateFormat(order.ordertime)}}</td>
								<td  v-if="order.state==0">未付款</td>
								<td  v-if="order.state==1">未发货</td>
								<td  v-if="order.state==2">已发货</td>
								<td  v-if="order.state==3">已收货</td>
								<td  v-if="order.state==4">交易完成</td>
								<td>{{order.number}}</td>
								<td>
									<a href="javascript:void()" v-on:click="deleteOrder(order.oid)">删除</a>
								</td>
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
			el:"#ordersListContainer",
			data:{
				ordersList:[],
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
					this.$http.post("getOrdersList",params,{emulateJSON:true}).then(
						function(res){
							this.ordersList=res.data.list;
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				},
				deleteOrder:function(oid){
					var params={"oid":oid};
					this.$http.post("delectOrder",params,{emulateJSON:true}).then(
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

