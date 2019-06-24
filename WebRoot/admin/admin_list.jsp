<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords" content="网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买,网上卖,购物网站,团购,网上贸易,安全购物,电子商务,放心买,供应,买卖信息,网店,一口价,拍卖,网上开店,网络购物,打折,免费开店,网购,频道,店铺" />
	<meta name="author" content="mike zhong" />
	<link rel="shortcut icon" href="https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png">
	<head>
	
		<!-- 引入样式文件 -->
		<link rel="stylesheet" href="../css/zpageNav.css" type="text/css" />
		<jsp:include page="top.jsp"></jsp:include>
		
	</head>
	<body>
		<div class="container" id="adminListContainer">
			<jsp:include page="header.jsp"></jsp:include>
			
			<div class="row">
			<jsp:include page="left.jsp"></jsp:include>
			
				<!-- Main  -->
				<div class="span9">
					<h1>
						管理员用户列表
					</h1>
					<!-- 查询表单 start -->
					<form class="form-horizontal" method="post" action="selectAdminuserByTerm">
						<fieldset>
						用户名：
						<input type="text" name="username" id="username"/>
						&nbsp;&nbsp;
						管理员类型：
						<select id="type" name="type"> 
							<option>-- 选择管理员类型 --</option> 
							<option value="1">超级管理员</option> 
							<option value="2">普通管理员</option> 
						</select>
						&nbsp;&nbsp;
						<button id="search" type="submit" class="btn btn-primary" >查询</button> 
						</fieldset>
					</form>
					<!-- 查询表单 start -->
					<center style="color:red;font-size:20px;font-weight:bolder;">${msg }</center>
					<table class="table table-bordered table-striped" <c:if test="${msg!=null }">style="visibility:hidden"</c:if>>	
						<thead>
							<tr>
								<td colspan="2">
									<button type=submit class="btn btn-primary" onclick="javascript:batchDel()">批量删除</button> 
								</td>
								<td >
									<a class="toggle-link btn btn-primary">新增管理员</a> 
								</td>
							</tr>
							<tr>
								<th>
									选择
								</th>
								<th>
									序号
								</th>
								<th>
									用户名
								</th>
								<th>
									类型
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${adminlist}" var="admin" varStatus="status">
							<tr>
								<td>
									<input type="checkbox" name="delId" value="${admin.uid }"/>
								</td>
								<td>${status.index+1 }</td>
								<td>${admin.username}</td>
								<td>
									<c:if test="${admin.type==1 }">超级管理员</c:if>
									<c:if test="${admin.type==2 }">普通管理员</c:if>
								</td>
								<td>
									<a class="link-update" href="adminEdit/${admin.uid }">修改</a>
									<a class="link-del" href="javascript:del(${admin.uid })">删除</a>
									<a class="link-del" href="#new-project">添加</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					
						
					
						
						
					</table>		
						
					<!-- 分页start -->	
					<center>
						<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
							<zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" 
									v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
							<zpagenav>
						</div>
					</center>	
					<!-- 分页end -->	
					
					<a class="toggle-link" href="#new-project"> <i class="icon-plus"> </i> 新增管理员</a>
					<!-- 新增管理form start class="toggle-link"   -->
					<form id="new-project" class="form-horizontal hidden" method="post" action="addAdmin">
							<fieldset>
								<legend>新增管理员</legend>
									<div class="control-group">
										<label class="control-label" for="input01">管理员姓名</label>
										<div class="controls">
											<input type="text" class="input-xlarge" id="username" name="username" required="required"/>
										</div>
									</div>
										
										<div class="control-group">
											<label class="control-label" for="input01">密码</label>
											<div class="controls">
												<input type="password" class="input-xlarge" id="password" name="password" required="required"/>
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label" for="select01">管理员类型</label>
											<div class="controls">
												<select id="type" name="type" required="required"> 													
													<option value="1">超级管理员</option> 
													<option value="2">普通管理员</option> 
												</select>
											</div>
										</div>
										
										<div class="form-actions">
											<button type=submit class="btn btn-primary" onclick="javascript:">创建</button> 
											
											<button type=submit class="btn btn-primary" onclick="javascript:addAdmin()">添加</button> 
											
											<button class="btn" onclick="javascript:history.back()">取消</button>
										</div>
							</fieldset>
					</form>
					<!-- 新增管理form end -->
					
				</div>
			</div>
		</div>
		<script type="text/javascript" src="../js/vue.min.js"></script>
		<script type="text/javascript" src="../js/vue-resource.js"></script>
		<script type="text/javascript" src="../js/zpageNav.js"></script>
		<script type="text/javascript">
			function del(uid){
				$.post(
					"deleteAdmin",
					{uid:uid},
					function(data){
						alert("删除成功！");
						window.location.reload(true);
					}
				);
			}


			//批量删除  异步请求
			function batchDel(){
				//定义一个数组
				var delIds=new Array();
				//获取复选框中的每一个值value（delId）,将其加入到数组
				$("input:checked").each(
					function(){
						delIds.push($(this).val());
					}
				);
				//异步请求
				$.post(
					"batchDel",
					{uIds:delIds},
					function(data){
						alert("删除成功！");
						window.location.reload(true);
					}
				);
			}

			//添加管理员
			function addAdmin(){
				//序列化
				var params=$("form").serializArray();
				$.post(
					"addAdmin",
					params,//表单参数
					function(data){
						alert("删除成功！");
						window.location.reload(true);
					}
				);
			}
			
			//分页
			var adminListVue = new Vue( {
				el:"#adminListContainer",
				data:{
					adminList:[],					
					page:1,//显示的是哪一页
					pageSize:10,//页面显示的数据条数
					total:100,//记录总数
					maxPage:9//最大的页数
				},
				methods : {
					pageHandler:function(page){//跳转到page页
						this.page=page;//修改显示的页数page
						//发送Ajax请求
						//参数Parama  getQueryString方法【通过参数name获取URL的参数值】
						var params={"page":page,"pageSize":this.pageSize};
						this.$http.post("adminListByPage",params,{emulateJSON:true}).then(
							function(res){
								this.adminList=res.data.list;
								this.total=res.data.total;
								this.maxPage=res.data.maxPage;
							},
							function(res){
								console.log(res);
							}
						);
					}
				},
				created : function() {
					this.pageHandler(1);
				}
			});
		</script>
		
	</body>
</html>

