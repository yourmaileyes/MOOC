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
<title>系统日志</title>
</head>
<body><%-- 
<%@ include file="leftmeun.jsp" %> --%>
 <div>
       <div class="container" style="max-height: 99%; max-width:99%;margin-left: 0px;
    float:left; text-align:center;margin-right: 0px;">
    <p style="font-size: 50px;">Mooc系统日志</p>
			<div class="container" style="margin-top: 50px;
			margin-right: 0px;padding-left: 0px;padding-right: 0px;">
			<table class="table table-striped" width="950">
				<tr>
					<td class="col-md-2 text-center">用户ID</td>
					<td class="col-md-2 text-center">用户名</td>
					<td class="col-md-2 text-center">详情</td>
					<td class="col-md-2 text-center">操作ip</td>
					<td class="col-md-2 text-center">操作时间</td>
					<c:if test="${type!=null }">
					<td class="col-md-2 text-center">操作管理员</td>
					</c:if>
				</tr>
				<c:if test="${logs.size()==0 }">
				<tr>
				<td colspan="5" style="font-size: 35px;text-align:center;">暂无日志 </td>
				</tr>
				</c:if>
				 <c:forEach  items = "${logs }" var = "order" >
					 
					
					<tr>
						<td class="col-md-2 text-center " >
							${order.userid }
						</td>
						<td class="col-md-2 text-center" style="">
							${order.username } 
						</td>
						<td class="col-md-2 text-center">${order.type }</td>
						<td class="col-md-2 text-center">
						${order.ip }
						</td>
						<td class="col-md-2 text-center">
						<fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<c:if test="${type!=null }">
						<td class="col-md-2 text-center">
							${order.executor }
						</td>
						</c:if>
					</tr>
					
					
				 </c:forEach> 
			</table>
			<center>
			<c:if test="${page!=0 }">
			<button onclick="prevpage()">上一页</button>
			</c:if>
			<button onclick="reflash()">刷新</button>
			<c:if test="${page!=maxpage-1 }">
            <button onclick="nextpage()">下一页</button>
            </c:if>
            </center>
</div>
</div>
    </div>
</body>
<script type="text/javascript">
function reflash(){
	window.location.reload(true);
}
function prevpage(){
	var page = ${page}-1;
	window.location.href="logpage?page="+page;
}
function nextpage(){
	var maxpage = ${maxpage};
	var page = ${page}+1;
	if(page>maxpage){
		alert("这是最后一页！");
	}else{ 
	window.location.href="logpage?page="+page;
    }
	}
</script>
</html>