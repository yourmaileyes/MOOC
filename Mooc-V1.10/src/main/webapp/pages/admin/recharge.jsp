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
<title>账户充值</title>
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
</head>
<body><%-- 
	<%@include file="leftmeun.jsp"%> --%>
	<div
		style="float: left; margin-left: 500px; margin-top: 100px; background-color: #e7e7e7; max-height: 99%; max-width:99%; padding-left:100px;padding: 20px;">
		<label for="payid">用户ID&nbsp;&nbsp;&nbsp;</label> <input type="text"
			id="payid"
			style="height: 46px; padding: 10px 16px; font-size: 18px; line-height: 1.3333333; border-radius: 6px; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc;"><br>
		<br> <label for="paynumber">充值金额</label> <input type="text"
			id="paynumber"
			style="height: 46px; padding: 10px 16px; font-size: 18px; line-height: 1.3333333; border-radius: 6px; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc;"><br>
		<br> <label for="paypassword">充值密码</label> <input type="password"
			id="paypassword"
			style="height: 46px; padding: 10px 16px; font-size: 18px; line-height: 1.3333333; border-radius: 6px; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc;"><br>
		<br> <span id="tishi" style="color: red;"></span><br>
		<br>
		<br>
		<button onclick="repay()"
			style="color: #fff; background-color: #286090; border-color: #204d74; cursor: pointer; height: 50px; width: 200px;">确认充值</button>
	</div>
</body>
<script type="text/javascript">
	function repay() {
		var userid = $("#payid").val();
		var paynumber = $("#paynumber").val();
		var paypassword = $("#paypassword").val();
		var isok = true;
		var re = /^[1-9]+[0-9]*]*$/;
		if (paynumber == "" || userid == "") {
			$("#tishi").text("请输入用户ID和充值金额！");
			isok = false;
			return;
		}
		if (paypassword == "") {
			$("#tishi").text("请输入充值密码！");
			isok = false;
			return;
		}
		if (!re.test(paynumber) || !re.test(userid)) {
			$("#tishi").text("用户ID和充值金额必须为数字整数！");
			isok = false;
			return;
		}
		$.ajax({
			type : "post",
			url : "recharge",
			data : {
				"userid" : userid,
				"collect" : paynumber,
				"paypassword" : paypassword
			},
			async : false,
			dataType : 'text',
			success : function(data) {
				if (data == "0") {
					$("#tishi").text("充值密码错误!");
					isok = false;
					return;
				}
				$("#tishi").html(
						"<b style='color:black;font-size:15px;'>正在充值!</b>");
				alert(data);
			},
			error : function(data) {
				alert("登录出错！请联系管理员" + data);
				isok = false;
			}
		});
		if(isok)
		$("#tishi").html("<b style='color:black;font-size:15px;'>充值成功!</b>");
	}
</script>
</html>