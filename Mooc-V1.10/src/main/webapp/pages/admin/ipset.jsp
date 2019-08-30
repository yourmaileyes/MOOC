<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String jsUrl=request.getContextPath()+"/style/js/";
	String cssUrl=request.getContextPath()+"/style/css/";
	String imgUrl=request.getContextPath()+"/style/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ip管理</title>
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
</head>
<body><%-- 
	<%@include file="leftmeun.jsp"%> --%>
	<div
		style="float: left; margin-left: 30%; margin-top: 100px; background-color: #e7e7e7; width: 500px; height: 400px; padding-left:100px;padding: 20px;">
		<label for="ip">ip地址&nbsp;&nbsp;&nbsp;</label> <input type="text"
			id="ip" value="${ip.ip}"
			style="height: 46px; padding: 10px 16px; font-size: 18px; line-height: 1.3333333; border-radius: 6px; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc;"><br>
		<br> <label for="mark">封禁原因</label> <select 
			id="mark"
			style="height: 46px; padding: 10px 16px; font-size: 18px; line-height: 1.3333333; border-radius: 6px; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc;">
		    <option value="多次测试未知账户！" selected="selected"> 多次测试未知账户！</option>
		    <option value="密码多次输入错误！"> 密码多次输入错误！</option>
		    <option value="恶意评论！"> 恶意评论！</option>
		    <option value="恶意登陆管理员账号！">恶意登陆管理员账号！</option>
		    <option value="其他！">其他！</option>
		    </select>
		<br> <label for="time">封禁时长</label> <select 
			id="time"
			style="height: 46px; padding: 10px 16px; font-size: 18px; line-height: 1.3333333; border-radius: 6px; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc;">
		    <option value="5m" selected="selected"> 5分钟</option>
		    <option value="2h">2小时</option>
		    <option value="1d">一天</option>
		    <option value="1m">一月</option>
		    <option value="1y">一年</option>
		    <option value="ever">永久</option>
		    </select>
		<br> <span id="tishi" style="color: red;"></span><br>
		<br>
		<br>
		<button onclick="ban()"
			style="color: #fff; background-color: #286090; border-color: #204d74; cursor: pointer; height: 50px; width: 200px;">封禁IP</button>
	</div>
</body>
<script type="text/javascript">
	function ban() {
		var ip = $("#ip").val();
		var mark = $("#mark").val();
		var time = $("#time").val();
		var isok = true;
		$.ajax({
			type : "post",
			url : "banip",
			data : {
				"ip" : ip,
				"mark" : mark,
				"time" : time
			},
			async : false,
			dataType : 'text',
			success : function(data) {
				if (data == "0") {
					$("#tishi").text("封禁错误!");
					isok = false;
					return;
				}
				alert(data);
			},
			error : function(data) {
				alert("登录出错！请联系管理员" + data);
				isok = false;
			}
		});
		if(isok)
		$("#tishi").html("<b style='color:black;font-size:15px;'>封禁成功!</b>");
	}
</script>
</html>