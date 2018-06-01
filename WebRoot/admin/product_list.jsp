<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="top.jsp"></jsp:include>
	</head>
	<body>
		<div class="container">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="row">
				<jsp:include page="left.jsp"></jsp:include>
				<div class="span9">
					<h1>
						商品列表
					</h1>
					<h4>请输入查询条件：</h4>
					<form class="form-horizontal">
						<div class="control-group">
						<fieldset>
						<label class="control-label" for="input01">商品名称：</label>
						<div class="controls">
							<input type="text" name="pname" id="pname"/>
						</div>
						&nbsp;&nbsp;
						<label class="control-label" for="input01">商品分类：</label>
						<div class="controls">
							<select name="cid" id="cid"></select>
						</div>
						&nbsp;&nbsp;
						<div class="controls">
						<button type="button" id="search" class="btn btn-primary">查询</button> 
						</div>
						</fieldset>
						</div>
					</form>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>
									商品编号
								</th>
								<th>
									商品名称
								</th>
								<th>
									商品原价
								</th>
								<th>
									商品新价
								</th>
								<th>
									商品库存
								</th>
								<th>
									商品销量
								</th>								
								<th>
									操作
								</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${productList}" var="product" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
									<td>${product.pname }</td>
									<td>${product.newPrice }</td>
									<td>${product.oldPrice }</td>
									<td>${product.volume }</td>
									<td>${product.total }</td>
									<td>
										<a class="link-update" href="adminEdit/${product.pid }.htm">修改</a>
										<a class="link-del" href="javascript:del(${product.pid })">删除</a>
										<a class="link-del" href="#new-project">添加</a>
									</td>
								</tr>
							
							</c:forEach>
						</tbody>
						
					</table>	
					
					<!-- 分页start bootstrap分页pagination-->				
					<div class="pagination">
    					<center>
    						<ul id="pagination1"></ul>
    					</center>
					</div>
					<!-- 分页end -->	
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function load(url,params){
			$.ajax({
				url:url,
				type:"post",
				data:params,
				dataType:"json",
				success:function(data){
					//修改初始配置 (总的页数，当前页数)
					$("#pagination1").jqPaginator('option',{
						totalPages:data.pages,
						currentPage:data.pageNumber
					});
					//加载前，清空tbody
					$("tbody").empty();
					//显示数据  使用jQuery的循环
					$.each(data.list,function(i,n){
						//创建一行
						var tr=$("<tr></tr>");
						tr.html(
								"<td>"+(i+1)+"</td>"+
								"<td>"+n.pname+"</td>"+
								"<td>"+n.oldPrice+"</td>"+
								"<td>"+n.newPrice+"</td>"+
								"<td>"+n.total+"</td>"+
								"<td>"+n.volume+"</td>"+
								"<td><a href='javascript:modify("+n.pid+")'>修改</a>&nbsp;&nbsp;<a href='javascript:del("+n.pid+")'>删除</a></td>"
						);
						//添加一行tr到tbody中
						$("tbody").append(tr);
					});
				}
			});
		}	

		$(function(){
			$.jqPaginator("#pagination1",{
				totalPages:100,//
				visiblePages:10,
				currentPage:1,
				pageSize:10,
				prev:'<li class="prev"><a herf="javascript:;"><上一页</a></li>',
				next:'<li class="prev"><a herf="javascript:;">下一页></a></li>',
				page:'<li class="prev"><a herf="javascript:;">{{page}}</a></li>',
				onPageChange:function(page,type){
					//页码发生变化时，执行的回调函数
					var params ={page:page,pageSize:10};
					var url="/shop/admin/listProduct";
					load(url,params);
				}
			});
	    });
	</script>
	
</html>

