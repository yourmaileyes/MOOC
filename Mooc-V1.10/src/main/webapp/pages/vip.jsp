<%@ page language="java"
	import="com.mooc.entity.User, java.util.Date,java.text.DateFormat"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<!-- <script src="style/js/login.js"></script>
<script src="style/js/jquery.min.js"></script>
<script src="style/js/loginkuang.js"></script>
<script src="style/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style/css/course.css"> -->
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
	<%@include file="head.jsp"%>
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
				url : "vip",
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
