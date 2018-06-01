<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="navbar" style="margin-top:10px;">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="#">ForFuture商城后台</a>
			<div class="nav-collapse">
				<ul class="nav">
					<li class="active"><a href="../index.jsp">后台主界面</a></li>

				</ul>
				<form class="navbar-search pull-left" action="">
					<input type="text" class="search-query span2" placeholder="Search" />
				</form>
				<ul class="nav pull-right">
					<li><a href="#">${sessionScope.adminuser.username }</a></li>
					<li><a href="exit">退出登录</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
