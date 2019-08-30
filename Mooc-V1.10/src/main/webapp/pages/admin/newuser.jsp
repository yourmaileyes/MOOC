<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="com.mooc.entity.User" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String jsUrl=request.getContextPath()+"/style/js/";
	String cssUrl=request.getContextPath()+"/style/css/";
	String imgUrl=request.getContextPath()+"/style/img/";
%>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><c:choose><c:when test="${user!=null }">用户详情</c:when><c:otherwise>新建用户</c:otherwise></c:choose></title>
</head><%-- 
<%@include file="leftmeun.jsp" %> --%>
<body>
<div class="container-fluid full " style="float: left;width: 1500px;height: 2000px;margin-top: 100px;">
							<c:if test="${user!=null }">
					<form action="setuser"
						class="form-horizontal col-md-9 col-md-offset-2 " role="form"
						method="post" id="form1">
<input type="hidden" id="id" name="id" value="${user.id}" />
						<div class="form-group">
							<label for="firstName" class="col-md-3 control-label">用户名</label>
							<div class="col-md-6">
								<input name="username" type="text" id="username" maxlength="10"
									value="${user.username }" class="input form-control"
								 disabled />
							</div>
							<label class="col-md-3 control-label" id="spanUsername"
								style="text-align: left;"></label>
						</div>

						<div class="form-group">
							<label for="password" class="col-md-3 control-label">密码</label>
							<div class="col-md-6">
								<input name="password" type="text" id="password"
									maxlength="15" value="${user.password }" class="input form-control">
							</div>

							<label class="col-md-3 control-label" id="spanPassword"
								style="text-align: left;"></label>
						</div>
						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Email</label>
							<div class="col-md-6">
								<input name="mail" type="email" id="email" value="${user.mail }"
									class="form-control">
							</div>
							<label class="col-md-3 control-label" id="spanEmail"
								style="text-align: left;"></label>
						</div>

						<div class="form-group">
							<label for="birthDate" class="col-md-3 control-label">手机号</label>
							<div class="col-md-6">
								<input name="phone" type="text" id="birthDate" value="${user.phone }"
									class="form-control">
							</div>
							<label class="col-md-3 control-label" id="spanBirth"
								style="text-align: left;"></label>
						</div>
						<div class="form-group">
							<label for="education" class="col-md-3 control-label">学历</label>
							<div class="col-md-6">
								<%User user = (User) session.getAttribute("user");
										String edu = user.getEducation();
									%>
									<select id="education" name="education" data-am-selected>
										<option <%if (edu == null) {%> selected <%}%>></option>
										<option value="初中及以下" <%if ("初中及以下".equals(edu)) {%> selected
											<%}%>>初中及以下</option>
										<option value="高中/中专" <%if ("高中/中专".equals(edu)) {%> selected
											<%}%>>高中/中专</option>
										<option value="本科/大专" <%if ("本科/大专".equals(edu)) {%> selected
											<%}%>>本科/大专</option>
										<option value="研究生以上" <%if ("研究生以上".equals(edu)) {%> selected
											<%}%>>研究生以上</option>
									</select>
							</div>
							<label class="col-md-3 control-label" id="spanBirth"
								style="text-align: left;"></label>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3">性别</label>
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-6">
									<%
										
										String sex = user.getSex();
									%>
										<label class="radio-inline"> <input name="sex"
											class="gender" type="radio" id="femaleRadio" value="Female"
											<%if ("Female".equals(sex)) {%> checked <%}%> />女
										</label>
									</div>
									<div class="col-sm-6">
										<label class="radio-inline"> <input name="sex"
											class="gender" type="radio" id="maleRadio" value="Male" 
											<%if ("Male".equals(sex)) {out.print("checked");}%>/>男
										</label>
									</div>

								</div>
							</div>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3"></div>
						</div>
						<!-- /.form-group -->
						<div class="form-group">
							<div class="col-md-9 col-md-offset-1">
								<button type="button" id="submit1"
									class="btn btn-primary btn-block" onclick="setuser()">确认修改</button>
							</div>
						</div>
					</form>
							</c:if>
							<c:if test="${user==null }">
							<form action="newadduser"
						class="form-horizontal col-md-9 col-md-offset-2 " role="form"
						method="post" id="form1">

						<div class="form-group">
							<label for="firstName" class="col-md-3 control-label">用户名</label>
							<div class="col-md-6">
								<input name="username" type="text" id="username" maxlength="10"
									placeholder="请输入用户名" class="input form-control"
								 autofocus />
								 
							</div>
							<label class="col-md-3 control-label" id="spanUsername"
								style="text-align: left;"></label>
						</div>

						<div class="form-group">
							<label for="password" class="col-md-3 control-label">密码</label>
							<div class="col-md-6">
								<input name="password" type="text" id="password"
									maxlength="15" placeholder="请输入密码" class="input form-control">
							</div>

							<label class="col-md-3 control-label" id="spanPassword"
								style="text-align: left;"></label>
						</div>
						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Email</label>
							<div class="col-md-6">
								<input name="mail" type="email" id="email" placeholder="Email"
									class="form-control">
							</div>
							<label class="col-md-3 control-label" id="spanEmail"
								style="text-align: left;"></label>
						</div>

						<div class="form-group">
							<label for="birthDate" class="col-md-3 control-label">手机号</label>
							<div class="col-md-6">
								<input name="phone" type="text" id="birthDate"
									class="form-control">
							</div>
							<label class="col-md-3 control-label" id="spanBirth"
								style="text-align: left;"></label>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3">性别</label>
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-6">
										<label class="radio-inline"> <input name="sex"
											class="gender" type="radio" id="femaleRadio" value="Female"
											checked=true />女
										</label>
									</div>
									<div class="col-sm-6">
										<label class="radio-inline"> <input name="sex"
											class="gender" type="radio" id="maleRadio" value="Male" />男
										</label>
									</div>

								</div>
							</div>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3"></div>
						</div>
						<!-- /.form-group -->
						<div class="form-group">
							<div class="col-md-9 col-md-offset-1">
								<button type="button" id="submit1"
									class="btn btn-primary btn-block" onclick="newadduser()">新建用户</button>
							</div>
						</div>
					</form>
					</c:if>
				</div>
</body>
<script type="text/javascript">
function newadduser(){
	var username = $("#username").val();
	var password = $("#password").val();
	var isok = true;
	if(username==""||password==""){
		$("#spanPassword").html("<b style='color:red;font-size:15px;'>用户名和密码不能为空!</b>");
		isod=false;
		return;
	}
	$.ajax({
		type : "post",
		url : "usercheck",
		data : {
			"username" : username
		},
		async : false,
		dataType : 'text',
		success : function(data) {
			if (data == 1) {
				$("#spanUsername").html("<b style='color:red;font-size:15px;'>用户名已被使用!</b>");
				isok = false;
				return;
			}
		},
		error : function(data) {
			alert("出错！请联系管理员" + data);
			isok = false;
		}
	});
	if(isok){
		alert("创建成功！");
		$("#form1").submit();
	}
}
function setuser(){
	var username = $("#username").val();
	var password = $("#password").val();
	var isok = true;
	if(username==""||password==""){
		$("#spanPassword").html("<b style='color:red;font-size:15px;'>用户名和密码不能为空!</b>");
		isod=false;
		return;
	}
	if(isok){
		alert("修改成功！");
		$("#form1").submit();
	}
}
</script>
</html>