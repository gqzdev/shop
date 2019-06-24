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
					<h1 style="color:#ff9800">
						商品列表
					</h1>
					<h4 style="color:#0088cc">请输入查询条件：</h4>
					<form class="form-horizontal">
						<div class="control-group" style="text-align:center;">
						<fieldset>							
							<div >
								商品名称：<input type="text" name="pname" id="pname"/>							
								商品分类：<select name="cid" id="cid">	</select>
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
							<!-- 
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
							 -->
						</tbody>
						
					</table>	
					
					<!-- 分页start bootstrap分页pagination-->				
					<div class="pagination" style="text-align:center">
    					<ul id="pagination1"></ul>
					</div>
					<!-- 分页end -->	
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function load(url,params){
			//分页
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
						var tr=$("<tr id='"+n.pid+"'></tr>");
						tr.html(
								"<td>"+(i+1)+"</td>"+
								"<td >"+n.pname+"</td>"+
								"<td>"+n.oldPrice+"</td>"+
								"<td>"+n.newPrice+"</td>"+
								"<td>"+n.total+"</td>"+
								"<td>"+n.volume+"</td>"+
								"<td>"
									+"<a href='javascript:stock("+n.pid+")'>查看库存</a>&nbsp;&nbsp;"
									+"<a href='javascript:addInventory("+n.pid+")'>添加规格</a>&nbsp;&nbsp;"
									+"<a href='javascript:modify("+n.pid+")'>修改</a>&nbsp;&nbsp;"
									+"<a cdel("+n.pid+")'>删除</a>"
								+"</td>"
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
			
			//获取商品信息分类
			getCategory("getCategories");
	    });
		
		//查看商品库存
		function stock(pid){		
			window.location.href="product_stock?pid="+pid;
		}
		
		//添加规格
		function addInventory(pid){		
			window.location.href="product_inventory?pid="+pid;
		}
		
		//删除
		function del(pid){
			$("#"+pid).hide();
			$.post(
				"delProduct",
				{pid:pid},
				function(data){
					alert("删除成功！");
				}
			);
		}
	</script>
	
</html>

