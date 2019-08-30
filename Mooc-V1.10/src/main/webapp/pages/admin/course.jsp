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
<title>课程属性</title>
</head>
<body>
<div class="container" style="margin-top: 150px;">
	<div class="row clearfix">
		<div class="col-md-6 column">
		 <c:if test="${course!=null}">
		 <img alt="" src="style/image/courses/${course.id}.jpg">
		 </c:if>
			<form role="form" action="coursesave" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${course.id }">
			    <div class="form-group">
					 <label for="exampleInputEmail1">课程名</label>
					 <input type="text" name="name" value="${course.name }" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">简介</label>
					 <input type="text" name="context" value="${course.context }" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">课程属性</label>
					 <select name="type" class="form-control" id="exampleInputEmail1">
					 <c:if test="${course.type eq '1' }">
                     <option value="1" selected="selected">会员免费</option>
                     <option value="0">免费</option>
                     </c:if>
                     <c:if test="${course.type eq '0' }">
                     <option value="1">会员免费</option>
                     <option value="0" selected="selected">免费</option>
                     </c:if>
                     <c:if test="${course==null}">
                     <option value="1">会员免费</option>
                     <option value="0">免费</option>
                     </c:if>
                     </select>
				</div>
				<c:if test="${course!=null }">
				<div class="form-group">
					 <label for="exampleInputEmail1">评价</label>
					 ${course.label }
				</div>
				</c:if>
				<div class="form-group">
					 <label for="exampleInputFile">文件上传</label>
					 <input type="file" id="exampleInputFile" multiple="multiple" name="file" accept=".jpg,.jpeg,.ogg"/>
					<p class="help-block">
						将封面图片（jpg,如上传多个图片或多个视频只按照最后一个处理）和视屏文件一起上传或单个上传，视屏文件只支持OGG格式，请转换格式之后在上传，避免客户端播放不了，视频文件上传限制500MB.
					</p>
				</div>
				<c:if test="${course!=null }">
				 <button type="submit" class="btn btn-default">提交修改</button>
				 </c:if>
				 <c:if test="${course==null }">
				 <button type="submit" class="btn btn-default">生成课程</button>
				 </c:if>
				 ${msg }
			</form>
		</div>
		<div class="col-md-6 column">
		</div>
	</div>
</div>
</body>
</html>