<%@ page language="java"
	import="com.gdp.mooc.entity.User, java.util.Date,java.text.DateFormat"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>

<meta charset="utf-8">
<link rel="stylesheet" href="style/css/amazeui.min.css">
<link rel="stylesheet" href="style/css/course.css">
<link rel="stylesheet" href="style/css/admin.css">
<script src="style/js/loginandregist.js"></script>
<script src="style/js/jquery-2.1.4.min.js"></script>
<script src="style/js/amazeui.min.js"></script>
<link rel="stylesheet" href="style/css/bootstrap.min.css">
<link rel="stylesheet" href="style/css/login.css">
<script src="style/js/login.js"></script>
<script src="style/js/jquery.min.js"></script>
<script src="style/js/loginkuang.js"></script>
<script src="style/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style/css/course.css">
<title>Mooc会员中心</title>
<!--[if lt IE 9]>  
<script src="js/html5shiv.js"></script>  
<script src="js/respond.min.js"></script>  
<![endif]-->
<style>
body {
	padding-top: 50px;
	padding-bottom: 40px;
	color: #5a5a5a;
}
</style>

</head>

<body>
	<!--下面是顶部导航栏的代码 登录隐藏框-->
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
		<form id="form1" action="login.do" method="post">
			<label for="username">用户名</label> <input class="denglu-input"
				id="username" type="text" name="username"><br> <label
				for="password">密码</label> <input class="denglu-input" id="password"
				type="password" name="password"><br> <label
				id="labelrpw" for="rpassword"><br></label>
				<br/>
				<label
					for="varcode">验证码</label> <br><input class="denglu-input" id="varcode"
					type="text" name="varcode" style="width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;<img onclick="changevarcode()" id="varcodeimg" alt="验证码" src="changevarcode.do"> <br>
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
			<a class="navbar-brand" href="course.do">上课吧 </a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath }/index.do">首页</a></li>
				<li class="active"><a href="vip.jsp">会员中心</a></li>
			</ul>
			<form class="navbar-form navbar-left" action="coursesearch.do" method="post">

				<input type="text" name="search" class="form-control" placeholder="课程">
				<button type="submit" class="btn">查找</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${loginUser != null }">
					<li><a href="mylearn.do">我的学习 </a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><c:if
								test="${loginUser.nickname !=null}">
								[${loginUser.nickname }]
								</c:if> <c:if test="${loginUser.nickname ==null}">
								[${loginUser.username }]
								</c:if><strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="infoset.jsp" class="glyphicon glyphicon-inbox">个人设置</a></li>
							<li><a href="logout.do" class="glyphicon glyphicon-inbox">
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
	<div class="mc-search-course-breadcrumb">
		<ul class="g-flow f-cb">
			<li class="current"></li>



		</ul>
	</div>

	<!--下面是主要内容的代码-->
	<div class="container-fluid">
		<div class="j-course-list">
			<div class="uc-course-list g-flow">
				<div class="uc-course-list_content"
					style="padding-bottom: 50px; height: 1000px;">
					<img alt="" src="style/image/showvip.jpg" width="1205">
					<c:if test="${loginUser!=null}">
						<c:if test="${loginUser.vip==null }">
							<p style="font-size: 40px;">
								欢迎您，普通用户<img alt="普通用户" src="style/image/vi.JPG">余额：${loginUser.collect}元
							</p>
						</c:if>
						<c:if test="${loginUser.vip!=null }">
							<p style="font-size: 40px;">
								欢迎您，超级会员用户<img alt="超级会员" src="style/image/vip.JPG">到期日为：
								<%
								User loginUser = (User) session.getAttribute("loginUser");
										out.print(DateFormat.getDateInstance().format(
												loginUser.getVip()));
							%>
								余额：${loginUser.collect}元
							</p>
						</c:if>

					</c:if>
					<!--Regular if22-->



					<div
						style="border: 2px solid; border-radius: 5px; border-color: #EDEDED; box-shadow: 0 0 8px #D7D7D7; margin-top: 80px; position: relative; background-color: white; left: 50px; top: 20px; height: 400px; margin-right: 100px; width: 300px; float: left; padding: 10px 20px 40px;">
						<div
							style="text-align: center; padding: 10px 0 20px; border-bottom: 1px solid #ddd; font-size: 20px;">
							包月卡</div>
						<div
							style="color: red; font-family: red; font-size: 40px; text-align: center; padding: 20px 0;">
							￥500</div>
						<div
							style="margin-right: -20px; margin-bottom: 8px; min-height: 170px;">
							<img alt="观看视频" src="style/image/vip1.JPG"
								style="position: absolute;"> <img alt="下载视频"
								src="style/image/vip2.JPG"
								style="position: absolute; left: 139px;">
						</div>
						<button
							style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%"
							onclick="buyvip('0')">立即购买</button>
					</div>
					<div
						style="border: 2px solid; border-radius: 5px; border-color: #EDEDED; box-shadow: 0 0 8px #D7D7D7; margin-top: 80px; position: relative; background-color: white; left: 50px; top: 20px; height: 400px; width: 300px; margin-right: 100px; position: relative; float: left; padding: 10px 20px 40px;">
						<div
							style="text-align: center; padding: 10px 0 20px; border-bottom: 1px solid #ddd; font-size: 20px;">
							半年卡</div>
						<div
							style="color: red; font-family: red; font-size: 40px; text-align: center; padding: 20px 0;">
							￥2000</div>
						<div
							style="margin-right: -20px; margin-bottom: 8px; min-height: 170px;">
							<img alt="观看视频" src="style/image/vip1.JPG"
								style="position: absolute;"> <img alt="下载视频"
								src="style/image/vip2.JPG"
								style="position: absolute; left: 139px;"> <img alt="优先答疑"
								src="style/image/vip3.JPG"
								style="position: absolute; top: 220px;">
						</div>
						<button
							style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%"
							onclick="buyvip('1')">立即购买</button>


					</div>
					<div
						style="border: 2px solid; border-radius: 5px; border-color: #EDEDED; box-shadow: 0 0 8px #D7D7D7; margin-top: 80px; position: relative; background-color: white; left: 50px; top: 20px; height: 400px; width: 300px; position: relative; float: left; padding: 10px 20px 40px;">
						<div
							style="position: absolute; height: 52px; width: 52px; background: url(style/image/tuijian.png) no-repeat; top: 0; left: 0;">
						</div>
						<div
							style="text-align: center; padding: 10px 0 20px; border-bottom: 1px solid #ddd; font-size: 20px;">
							包年卡</div>
						<div
							style="color: red; font-family: red; font-size: 40px; text-align: center; padding: 20px 0;">
							￥3000</div>
						<div
							style="margin-right: -20px; margin-bottom: 8px; min-height: 170px;">
							<img alt="观看视频" src="style/image/vip1.JPG"
								style="position: absolute;"> <img alt="下载视频"
								src="style/image/vip2.JPG"
								style="position: absolute; left: 139px;"> <img alt="下载视频"
								src="style/image/vip3.JPG"
								style="position: absolute; top: 220px;"> <img alt="下载视频"
								src="style/image/vip4.JPG"
								style="position: absolute; left: 140px; top: 220px;">
						</div>
						<button
							style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%"
							onclick="buyvip('2')">立即购买</button>


					</div>
				</div>
			</div>
		</div>
	</div>

	<footer style="text-align: center">
	<hr>
	<p class="am-padding-left">
		© 2018 <a href="#">山西农业大学北京海淀基地</a>.作者:杨祺晖
	</p>
	</footer>
	<script type="text/javascript">
function buyvip(viptype) {
	if(${loginUser==null}){
		showdenglu();
		return ;
	}
	$
			.ajax({
				type : "post",
				url : "vip.do",
				data : {
					"viptype" : viptype 
				},
				async : true,
				success : function(data) {
					/* alert(password==data); */
					alert(data);
					location.reload(true);
					/* alert(data); */
				},
				error : function(data){
					   alert("进入了error方法"+data);
					   //location.reload(true) ;
					   }
			});
}
</script>
</body>
</html>
