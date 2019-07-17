<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录界面</title>
		
		<!-- 配置外部依赖 -->
		<link href="/MusicManagement/css/bootstrap.css" rel="stylesheet">
		
		<script src="/MusicManagement/js/jquery.1.9.min.js"></script>
		<script src="/MusicManagement/js/bootstrap.js"></script>
		
	</head>

	<body>
		<div style="text-align: center; background-color: #04ffe4; padding: 2%">
			<h1>欢迎使用在线音乐俱乐部！</h1>
		</div>
		
		<div style="text-align: center;">
			<img width="20%" src="/MusicManagement/img/login.gif"/>
		</div>
		
		<div class="container">
			<form action="/MusicManagement/LoginServlet" method="post">
			  <div class="form-group">
			    <label for="exampleInputEmail1">账号信息：</label>
			    <input type="text" name="username" class="form-control" placeholder="请输入用户名">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">密码信息：</label>
			    <input type="password" name="password" class="form-control" placeholder="请输入密码">
			  </div>
			  
			  <div  style="text-align: center;">
			  	<input type="submit" class="btn btn-info" value="登录"/>
			  	<input onclick="window.opener=null;window.close()" type="submit" class="btn btn-info" value="退出"/>
			  </div>
			</form>
		</div>
		
	</body>
</html>