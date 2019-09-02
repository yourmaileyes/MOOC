<%@ page language="java" import="com.mooc.entity.User"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="style/css/amazeui.min.css">
<link rel="stylesheet" href="style/css/admin.css">
<script src="style/js/jquery-2.1.4.min.js"></script>
<script src="style/js/amazeui.min.js"></script>
<script type="text/javascript">
	function validate() {
		var password1 = $("#password2").val();
		var password2 = $("#password3").val();
		var username = $("#passname").val();
		var password = $("#password1").val();
		var isok = true;
		if (password1 == "") {
			$("#spanPassword2")
					.html(
							"<b style='color:red;font-size:15px;margin-top:auto;'>新密码不能为空！</b>");
			isok = false;
			return;
		} else if (password2 != password1) {
			$("#spanPassword1")
					.html(
							"<b style='color:red;font-size:15px;margin-top:auto;'>两次密码不一致！</b>");
			isok = false;
			return;
		} 

		$.ajax({
			type : "post",
			url : "passwordcheck",
			data : {
				"username" : username,
				"password" : password
			},
			async : false,
			dataType : 'text',
			success : function(data) {
				if (data == 0) {
					$("#spanPassword")
					.html(
							"<b style='color:red;font-size:15px;margin:5px auto;text-align:left'>密码错误！</b>");
			        isok = false;
					return;
				}
			},
			error : function(data) {
				alert("出错！请联系管理员" + data);
				isok = false;
			}
		});
		 if (isok) {
			$("#passwordform").submit();
		} 

	}
	
</script>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/style/css/course.css"> --%>
<title>mooc</title>
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
	<!--下面是顶部导航栏的代码-->
<%@include file="head.jsp"%>
	<div class="mc-search-course-breadcrumb">
		<ul class="g-flow f-cb">
			<li class="current"></li>



		</ul>
	</div>
	<!--下面是主要内容的代码-->
	<div class="am-cf admin-main">


		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">个人设置</strong> / <small>form</small>
				</div>
			</div>

			<div class="am-tabs am-margin" data-am-tabs>
				<ul class="am-tabs-nav am-nav am-nav-tabs">
					<li class="am-active"><a href="#tab1">基本信息</a></li>
					<li><a href="#tab3">修改密码</a></li>
				</ul>

				<div class="am-tabs-bd">
					<div class="am-tab-panel am-fade am-in am-active" id="tab1">
						<form class="am-form am-form-horizontal" id="information-form"
							action="infoset" method="post" data-am-validator>
							<input type="hidden" id="id" name="id" value="${loginUser.id}" />
							<div class="am-form-group">
								<label for="userid" class="am-u-sm-2 am-form-label">用户名</label>
								<div class="am-u-sm-10">
									<input type="text" id="username" name="username"
										value="${loginUser.username}" disabled>
								</div>
							</div>

							<div class="am-form-group">
								<label for="nickname" class="am-u-sm-2 am-form-label">昵称</label>
								<div class="am-u-sm-10">
									<input type="text" id="nickname" name="nickname"
										value="${loginUser.nickname}" required
										placeholder="这里输入你的昵称...">
								</div>
							</div>
							<div class="am-form-group">
								<label for="phone" class="am-u-sm-2 am-form-label">手机号</label>
								<div class="am-u-sm-10">
									<input type="text" id="phone" name="phone"
										value="${loginUser.phone}" required placeholder="这里输入你的手机...">
								</div>
							</div>
							<div class="am-form-group">
								<label for="mail" class="am-u-sm-2 am-form-label">邮箱</label>
								<div class="am-u-sm-10">
									<input type="text" id="mail" name="mail"
										value="${loginUser.mail}" required placeholder="这里输入你的邮箱...">
								</div>
							</div>
							<div class="am-form-group">
								<label for="vx" class="am-u-sm-2 am-form-label">微信号</label>
								<div class="am-u-sm-10">
									<input type="text" id="vx" name="vx" value="${loginUser.vx}"
										required placeholder="这里输入你的微信...">
								</div>
							</div>
							<div class="am-form-group">
								<label for="sex" class="am-u-sm-2 am-form-label">性别</label>
								<div class="am-u-sm-10">
									<%
										User loginUser = (User) session.getAttribute("loginUser");
										String sex = loginUser.getSex();
									%>
									<label class="radio-inline"> <input name="sex"
										class="gender" type="radio" id="femaleRadio" value="Female"
										<%if ("Female".equals(sex)) {%> checked <%}%> >女
									</label> <label class="radio-inline"> <input name="sex"
										class="gender" type="radio" id="maleRadio" value="Male"
										<%if ("Male".equals(sex)) {out.print("checked");}%> >男
									</label>

								</div>
							</div>
							<div class="am-form-group">
								<label for="education" class="am-u-sm-2 am-form-label">学历</label>
								<div class="am-u-sm-10">
									<%
										String edu = loginUser.getEducation();
									%>
									<select id="education" name="education" >
										<option <%if (edu == null) {%> selected="selected" <%}%>></option>
										<option value="初中及以下" <%if ("初中及以下".equals(edu)) {%> selected="selected"
											<%}%>>初中及以下</option>
										<option value="高中/中专" <%if ("高中/中专".equals(edu)) {%> selected="selected"
											<%}%>>高中/中专</option>
										<option value="本科/大专" <%if ("本科/大专".equals(edu)) {%> selected="selected"
											<%}%>>本科/大专</option>
										<option value="研究生以上" <%if ("研究生以上".equals(edu)) {%> selected="selected"
											<%}%>>研究生以上</option>
									</select>
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-10 am-u-sm-offset-2"></div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-10 am-u-sm-offset-2">
									<button type="submit" class="am-btn am-round am-btn-success">
										<span class="am-icon-send"></span> 提交
									</button>
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-10 am-u-sm-offset-2"></div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-10 am-u-sm-offset-2"></div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-10 am-u-sm-offset-2"></div>
							</div>
						</form>
					</div>

					<div class="am-tab-panel am-fade" id="tab3">
						<form id="passwordform" class="am-form am-form-horizontal"
							 action="infoset" method="post">
							<div class="am-form-group">
								<input type="hidden" id="id" name="id" value="${loginUser.id}" />
								<input type="hidden" id="passname" name="id" value="${loginUser.username}" />
								<label for="password1" class="am-u-sm-2 am-form-label">原密码</label>
								<div class="am-u-sm-10">
									<input type="password" id="password1" name="oldpass" required
										placeholder="请输入原密码...">
								</div>
								<label class="col-md-3 control-label" id="spanPassword"
									style="text-align: left; margin-left: 200px;"></label>
							</div>

							<div class="am-form-group">
								<label for="password2" class="am-u-sm-2 am-form-label">新密码</label>
								<div class="am-u-sm-10">
									<input type="password" id="password2" name="password" required
										placeholder="请输入新密码...">
								</div>
								<label class="col-md-3 control-label" id="spannewPassword1"
									style="text-align: left;"></label>
							</div>

							<div class="am-form-group">
								<label for="password3" class="am-u-sm-2 am-form-label">确认新密码</label>
								<div class="am-u-sm-10">
									<input type="password" id="password3"
										data-equal-to="#password2" required placeholder="请确认新密码...">
								</div>
								<label class="col-md-3 control-label" id="spannewPassword2"
									style="text-align: left;"></label>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-10 am-u-sm-offset-2">
								</div>
							</div>
						</form>
									<button onclick="validate()" class="am-btn am-round am-btn-success"
										style=" margin-left: 200px;">
										<span class="am-icon-send"></span> 提交修改
									</button>
					</div>
				</div>
			</div>
		</div>
		<!-- content end -->
	</div>
	<footer style="text-align: center">
	<hr>
	<p class="am-padding-left">
		© 2018 <a href="#">山西农业大学北京海淀基地</a>.作者:杨祺晖
	</p>
	</footer>



</body>
</html>
