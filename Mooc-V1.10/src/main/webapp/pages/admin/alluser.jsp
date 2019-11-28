<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>mooc后台管理系统</title>
</head>
<%-- <%@include file="leftmeun.jsp" %> --%>

<body>

<div class="container" style="max-height: 99%; max-width:99%;margin-left: 0px;
    float:left; text-align:center;                margin-right: 0px;">
    <p style="font-size: 50px;">Mooc用户管理</p>
			<div class="container" style="max-height: 99%; max-width:99%;margin-top: 50px;
			margin-right: 0px;padding-left: 0px;padding-right: 0px;">
			<table class="table table-striped" width="950">
				<tr>
					<td class="col-md-2 text-center">用户ID</td>
					<td class="col-md-2 text-center">用户名</td>
					<td class="col-md-2 text-center">用户昵称</td>
					<td class="col-md-2 text-center">用户密码</td>
					<td class="col-md-2 text-center">余额</td>
					<td class="col-md-2 text-center">vip到期日</td>
					<td class="col-md-2 text-center">注册时间</td>
					<td class="col-md-2 text-center">权限</td>
					<td class="col-md-2 text-center">操作</td>
					<td class="col-md-2 text-center">详情</td>
					<td class="col-md-2 text-center">删除用户</td>
				</tr>
				<c:if test="${users.size()==0 }">
				<tr>
				<td colspan="5" style="font-size: 35px;text-align:center;">暂无订单 </td>
				</tr>
				</c:if>
				 <c:forEach items = "${users }" var = "order">
					 <c:if test="${order.username ne 'yangqihui'}">
					
					<tr>
						<td class="col-md-2 text-center " >
							${order.id }
						</td>
						<td class="col-md-2 text-center" style="">
							${order.username } 
						</td>
						<td class="col-md-2 text-center">${order.nickname }</td>
						<td class="col-md-2 text-center">
						<c:choose>
						<c:when test="${order.mission eq 'admin' }">
						-----
						</c:when>
						<c:otherwise> 
						${order.password }
						</c:otherwise>
						</c:choose>
						</td>
						<td class="col-md-2 text-center">
							${order.collect }
						</td>
						<td class="col-md-2 text-center">
							<fmt:formatDate value="${order.vip}" pattern="yyyy-MM-dd"/>
						</td>
						<td class="col-md-2 text-center">
						<fmt:formatDate value="${order.fristtime}" pattern="yyyy-MM-dd"/>
						</td>
						<td class="col-md-2 text-center">
						<c:choose>
						<c:when test="${order.mission eq 'admin' }">
						管理员
						</c:when>
						<c:otherwise> 
						-----------
						</c:otherwise>
						</c:choose>
						</td>
						<td class="col-md-2 text-center ">
						<c:choose>
						<c:when test="${order.mission eq 'admin' }">
						-----
						</c:when>
						<c:otherwise>
						<c:if test="${order.buycase==1}">
						<a class="btn btn-danger delete" style="background-color: gray;" href="banuser?userid=${order.id }&type=1">恢复登录</a>
						</c:if>
						<c:if test="${order.buycase!=1}">
						<a class="btn btn-danger delete"  href="banuser?userid=${order.id }&type=0">禁止登录</a>
						</c:if>
						</c:otherwise>
						</c:choose>
						 </td>
						<td class="col-md-2 text-center ">
						<c:choose>
						<c:when test="${order.mission eq 'admin' }">
						-----
						</c:when>
						<c:otherwise>
							<a class="btn btn-danger delete" style="background-color: green;" href="newuser?userid=${order.id }">查看详情</a>
						 </c:otherwise>
						 </c:choose>
						 </td>
						 <td class="col-md-2 text-center ">
						<c:choose>
						<c:when test="${order.mission eq 'admin' }">
						-----
						</c:when>
						<c:otherwise>
							<a class="btn btn-danger delete" style="background-color: red;" href="javascript:removeuser(userid='${order.id }')">删除用户</a>
						 </c:otherwise>
						 </c:choose>
						 </td>
					</tr>
					 </c:if>
					
				 </c:forEach> 
			</table><center>
<c:if test="${page!=0 }">
			<button onclick="prevpage()">上一页</button>
			</c:if>
			<button onclick="reflash()">刷新</button>
			<c:if test="${page!=maxpage }">
            <button onclick="nextpage()">下一页</button>
            </c:if></center>

</div>
</div>

</body>
<script type="text/javascript">
function reflash(){
	window.location.reload(true);
}
function prevpage(){
	var page = ${page}-1;
	window.location.href="alluser?page="+page;
}
function nextpage(){
	var page = ${page}+1;
	window.location.href="alluser?page="+page;
	}
function removeuser(userid){
	var r=confirm("确认要删除用户："+userid+"?");
	if (r==true){
		var removepassword=prompt("请输入删除密码","");
		if (removepassword==null || removepassword==""){
			alert("删除密码不能为空！");
		    return;
		}else{
		$.ajax({
			type : "post",
			url : "removeuser",
			data : {
				"userid" : userid,
				"removepassword" : removepassword
			},
			async : true,
			dataType : 'text',
			success : function(data) {
				if (data == "0") {
					alert("删除密码错误！");
					return;
				}
				alert(data);
				location.reload(true);
			},
			error : function(data) {
				alert("出错！请联系管理员" + data);
				isok = false;
			}
		});}
	}
}
</script>
</html>