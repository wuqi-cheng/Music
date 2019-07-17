<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>首页信息</title>
		
		<!-- 配置外部依赖 -->
		<link href="/MusicManagement/css/bootstrap.css" rel="stylesheet">
		
		<script src="/MusicManagement/js/jquery.1.9.min.js"></script>
		<script src="/MusicManagement/js/bootstrap.js"></script>
		
		<style type="text/css">
			tr{
				text-align: center;
			}
			.t1{
				font-size: 15px;
				font-weight: 900;
				color: red;
				background-color: pink;
			}
		</style>
		
	</head>
	
	<body>
		<!-- 导航栏 -->
		<div>
			<nav class="navbar navbar-inverse">
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li class="active"><a href="/MusicManagement/index.jsp">首页<span class="sr-only"></span></a></li>
			        <li><a href="/MusicManagement/addMusic.jsp">添加音乐</a></li>
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
			      
			      <div class="navbar-form navbar-left">
			        <div class="form-group">
			          <input id="search" type="text" class="form-control" placeholder="搜索音乐"/>
			        </div>
			        <button onclick="sea()" class="btn btn-danger">搜索</button>
			      </div>
			      
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
		
		<!-- 设置轮播图 -->
		<div class="center-block" >
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-left: 22%; margin-right: 22%">
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
			  </ol>
			
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img class="img-responsive center-block" src="/MusicManagement/img/01.jpg">
			    </div>
			    <div class="item">
			      <img class="img-responsive center-block" src="/MusicManagement/img/02.jpg">
			    </div>
			    <div class="item">
			      <img class="img-responsive center-block" src="/MusicManagement/img/03.jpg">
			    </div>
			    <div class="item">
			      <img class="img-responsive center-block" src="/MusicManagement/img/04.jpg">
			    </div>
			    <div class="item">
			      <img class="img-responsive center-block" src="/MusicManagement/img/05.jpg">
			    </div>
			  </div>
			
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		
		<br/>
		
		<!-- 表格 -->
		<div>
			<table id="t1" class="table table-hover">
				<tr class="t1">
					<td>序号</td>
					<td>歌曲名</td>
					<td>作者</td>
					<td>试听</td>
					<td>操作</td>
				</tr>
			</table>
		</div>
		
		<audio id="audio"></audio>
		
		
		<!-- 调用ajax -->
		<script type="text/javascript">
		
			$.post("/MusicManagement/IndexServlet",function(data){
				//将字符串数据封装成集合对象
				var json = eval("(" + data + ")");
				//循环
				for(var i = 0; i < json.length; i++){
					$("#t1").append("<tr><td>" 
							+ json[i].id + "</td><td>"
							+ json[i].mname + "</td><td>"
							+ json[i].author + 
							"</td><td>"
							+"<button class='btn btn-info' onclick='start(&quot;" + json[i].murl + "&quot;)'><span class='glyphicon glyphicon-play'></span></button>"
							+"<button class='btn btn-info' onclick='stop()'><span class='glyphicon glyphicon-pause'></span></button>"
							+"</td><td><button class='btn btn-danger' onclick='del("+json[i].id+")'><span class='glyphicon glyphicon-remove'></span></button></td></tr>");
				}
				
			});
		
			//播放音乐
			function start(murl){
				var audio = document.getElementById("audio");
				audio.src = "/MusicManagement/music/" + murl;
				audio.play();
			}
			
			//停止音乐
			function stop(){
				var audio = document.getElementById("audio");
				//audio.pause();
				if(audio.paused){ 
			         audio.play();//audio.play();// 播放  
			     }
			     else{
			          audio.pause();// 暂停
			     } 
			}
			
			//删除音乐
			function del(id){
				$.post("/MusicManagement/DeleteServlet",{"id":id},function(data){
					alert(data);
					//刷新页面
					window.location.reload();
				});
			}
			
			//搜索音乐
			function sea(){
				//获取到输入内容信息
				var value = $("#search").val();
				//判断输入信息是否为空
				$.post("/MusicManagement/SelectServlet",{"value":value},function(data){
					//先清除原先数据
					$("#t1 tr:not(:first)").empty("");
					
					//重新将数据写入表格中
					var json = eval("(" + data + ")");
					//循环
					for(var i = 0; i < json.length; i++){
						$("#t1").append("<tr><td>" 
								+ json[i].id + "</td><td>"
								+ json[i].mname + "</td><td>"
								+ json[i].author + 
								"</td><td>"
								+"<button class='btn btn-info' onclick='start(&quot;" + json[i].murl + "&quot;)'><span class='glyphicon glyphicon-play'></span></button>"
								+"<button class='btn btn-info' onclick='stop()'><span class='glyphicon glyphicon-pause'></span></button>"
								+"</td><td><button class='btn btn-danger' onclick='del("+json[i].id+")'><span class='glyphicon glyphicon-remove'></span></button></td></tr>");
					}
				});
			}
			
		</script>
		
	</body>
</html>