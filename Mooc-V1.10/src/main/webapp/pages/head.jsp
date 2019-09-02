<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/css/amazeui.min.css">
<link rel="stylesheet" href="style/css/course.css">
<link rel="stylesheet" href="style/css/admin.css">
<link rel="stylesheet" href="style/css/login.css">
<script src="style/js/login.js"></script>
<script src="style/js/loginandregist.js"></script>
<!-- <script src="style/js/jquery-3.2.1.min.js"></script> -->
 <script src="style/js/amazeui.min.js"></script> 
<link rel="stylesheet" href="style/css/bootstrap.min.css">
<script src="style/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style/css/course.css">
</head>
<body>
<body>
	<div id="dengluinput"
		style="position: fixed; background: rgb(255, 255, 255) none repeat scroll 0% 0%; z-index: 100000; width: 360px; left: 50%; top: 50%; margin: -218px 0px 0px -180px; box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.25); display: none;">

		<div
			style="font-size: 16px; line-height: 49px; height: 49px; color: #787d82; border-bottom: 1px solid #d0d6d9;">

			<span id="denglu" onclick="denglu()"
				style="border-bottom: 1px solid #f01400; color: #f01400; float: left; width: 80px; text-align: center; height: 49px; line-height: 49px; cursor: pointer; padding: 0 20px;">登录</span>

			<span id="zhuce" onclick="zhuce()"
				style="border-bottom: 1px solid #d0d6d9; color: #f01400; float: left; width: 80px; text-align: center; height: 49px; line-height: 49px; cursor: pointer; padding: 0 20px;">注册</span>

			<span style="float: right; cursor: pointer; padding-right: 20px"
				onclick="guanbi()"> X </span>

		</div>
		<div style="padding: 30px 30px;">
			<form id="form1" action="login" method="post">
				<label for="username">用户名</label> <input class="denglu-input"
					id="username" type="text" name="username"><br> <label
					for="password">密码</label> <input class="denglu-input" id="password"
					type="password" name="password"><br> <label
					id="labelrpw" for="rpassword"><br></label> <br />
					<label
					for="varcode">验证码</label> <br><input class="denglu-input" id="varcode"
					type="text" name="varcode" style="width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;<img onclick="changevarcode()" id="varcodeimg" alt="验证码" src="changevarcode"> <br>
				<span id="tishi"></span><br>
			</form>
			<button id="tijiao" onclick="quickpasswordchat()" type="button"
				style="color: #fff; margin-top: 20px; border-color: #c20a0a; width: 90%; height: 50px; background: #c20a0a;">登录</button>

		</div>
	</div>

	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top"
		role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="course">上课吧 </a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="${pageContext.request.contextPath }/index">首页</a></li>
				<li><a href="showvip">会员中心</a></li>
			</ul>
			<form class="navbar-form navbar-left" action="coursesearch"
				method="post">

				<input type="text" name="search" class="form-control"
					placeholder="课程">
				<button type="submit" class="btn">查找</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${loginUser != null }">
					<li><a href="mylearn">我的学习 </a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><c:if
								test="${loginUser.nickname !=null}">
								[${loginUser.nickname }]
								</c:if>
							<c:if test="${loginUser.nickname ==null}">
								[${loginUser.username }]
								</c:if><strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="info" class="glyphicon glyphicon-inbox">个人设置</a></li>
							<li><a href="logout" class="glyphicon glyphicon-inbox">
									退出帐号</a></li>

						</ul></li>


				</c:if>
				<c:if test="${loginUser == null }">
					<li><a href="#" onclick="showdenglu()"><span
							class="glyphicon glyphicon-log-in"></span> 登录</a></li>
					<li><a href="#" onclick="showdenglu()"><span
							class="glyphicon glyphicon-user"></span> 注册 </a></li>
					<li><a href="#">关于 </a></li>
				</c:if>

			</ul>
		</div>
	</div>
	</nav>
</body>
</html>