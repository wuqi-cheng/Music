<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加音乐</title>
		
		<!-- 配置外部依赖 -->
		<link href="/MusicManagement/css/bootstrap.css" rel="stylesheet">
		
		<script src="/MusicManagement/js/jquery.1.9.min.js"></script>
		<script src="/MusicManagement/js/bootstrap.js"></script>
	</head>

	<body>
		<!-- 导航栏 -->
		<div>
			<nav class="navbar navbar-inverse">
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li><a href="/MusicManagement/index.jsp">首页<span class="sr-only"></span></a></li>
			        <li class="active"><a href="/MusicManagement/addMusic.jsp">添加音乐</a></li>
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多操作   <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="#">购买专辑</a></li>
			            <li><a href="#">排行榜</a></li>
			            <li><a href="#">歌单</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="#">朋友</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="#">商城</a></li>
			          </ul>
			        </li>
			      </ul>
			      
			      <ul class="nav navbar-nav navbar-right">
			        <li><a href="#">下载客户端</a></li>
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">操作  <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="#">账号登录</a></li>
			            <li><a href="#">手机号登录</a></li>
			            <li><a href="#">微信登录</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="#">个人中心</a></li>
			            <li><a href="#" onClick="window.opener=null;window.close()">退出</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</div>
		
		<!-- 添加音乐 -->
		<div class="container">
			<form action="/MusicManagement/AddServlet" method="post" enctype="multipart/form-data">
			  <div class="form-group">
			    <label for="exampleInputEmail1">音乐名称：</label>
			    <input type="text" name="mname" class="form-control" placeholder="请输入音乐名称">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">作者名称：</label>
			    <input type="text" name="author" class="form-control" placeholder="请输入作者名称">
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputFile">选择需要添加的音乐文件：</label>
			    <input type="file" name="files" >
			  </div>
			  <div>
			  	<input type="submit" class="btn btn-info" value="添加音乐"/>
			  </div>
			</form>
		</div>
		
	</body>
</html>