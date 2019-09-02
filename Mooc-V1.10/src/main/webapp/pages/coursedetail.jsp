<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta content="text/html; charset=UTF-8">

<link rel="stylesheet" href="style/css/amazeui.min.css">
<link rel="stylesheet" href="style/css/course.css">
<link rel="stylesheet" href="style/css/admin.css">
<script src="style/js/loginandregist.js"></script>
<script src="style/js/jquery-2.1.4.min.js"></script>
<script src="style/js/amazeui.min.js"></script>
<link rel="stylesheet" href="style/css/bootstrap.min.css">
<!-- <script src="style/js/jquery.min.js"></script>
<script src="style/js/loginkuang.js"></script>
<script src="style/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style/css/course.css"> -->
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
			<li><a href="${pageContext.request.contextPath }"
				target="_blank">首页</a></li>

			<li class="current"><span class="arrow"></span> <a
				href="javascript: void(0);">课程详情</a></li>

		</ul>
	</div>
	<div class="g-flow f-cb">


		<div class="f-bg courseheadbox" id="j-coursehead">

			<div class="u-courseHead" id="auto-id-1509947716498">

				<div class="ov f-pr j-ch" style="padding-top: 0px; top: 10px;">


					<div class="g-sd1 left j-chimg">
						<img width="450" height="250"
							src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=450y250&amp;quality=100"/>">
					</div>

					<div class="g-mn1">

						<div class="g-mn1c right j-right f-pr">
							<div class="ctarea f-fl j-cht">
								<div class="u-coursetitle f-fl" id="auto-id-1509947716616">
									<h2 class="f-thide">
										<span class="u-coursetitle_title" title="">${course.name}</span>
									</h2>

									<div class="f-cb margin-top-15">
										<c:if test="${course.type==0 }">免费</c:if>
										<c:if test="${course.type==1 }">会员免费</c:if>

										<span class="cmt">学习人数(${course.hour }) </span> <br>
										<c:if test="${course.label}!=null">
											<span class="cmt">平均评价：${course.label} </span>
											<br />
										</c:if>


										<div class="f-fl" style="margin-right: 3px;">
											<a href="#" target="_blank" class="j-userNode"
												data-id="837467" data-type="10" id="auto-id-1509947716617">${course.context}</a>
										</div>




									</div>

								</div>
							</div>
							<div>

								<div class="btnarea f-pa j-chbtnarea">

									<c:if test="${isSelect == false }">
									   <c:choose>
											<c:when test="${course.price eq 0 }">
										<a class="learnbtn f-db f-cb j-joinBtn"> <span>立即参加</span></a>
										</c:when>
											<c:otherwise>
											<a style="background: gray; color: white; font-size: 20px; line-height: 45px; width: 160px; height: 45px; text-align: center; vertical-align: middle; display: inline-block;"> <span>暂时下架</span></a>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${isSelect == true }">
										<a class="learnbtn f-db f-cb j-joinBtn"><span>取消课程</span></a>
										<c:choose>
											<c:when test="${course.price eq 0 }">
												<a href="coursevideo?courseid=${course.id}"><span
													style="background: #ee6600; color: white; font-size: 20px; line-height: 45px; width: 160px; height: 45px; text-align: center; vertical-align: middle; display: inline-block;">去听课</span></a>
											</c:when>
											<c:otherwise>
												<a href="#"><span
													style="background: gray; color: white; font-size: 20px; line-height: 45px; width: 160px; height: 45px; text-align: center; vertical-align: middle; display: inline-block;">课程暂时下架</span></a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>



	</div>
	<script>
		$(document)
				.ready(
						function() {
							$(".learnbtn")
									.click(
											function() {
												if (!"${loginUser}") {
													window.location = "${pageContext.request.contextPath }/login.jsp";
												} else {
													if ("${isSelect}" == "true") {
														deleteCourse();

													} else {
														insertCourse();
														//location.reload() ;
													}
												}

											});
						});

		function insertCourse() {

			$.ajax({
				type : "post",
				url : "insertCourse",
				data : {
					"courseid" : "${course.id}",
					"userid" : "${loginUser.id}"
				},
				async : false,
				method : 'post',
				dataType : "text",
				success : function(data) {
					alert(data);
					/* alert(password==data); */
					location.reload(true);

				},
				error : function(data) {
					//alert("进入了error方法");
					location.reload(true);
				}
			});
			//location.reload() ;
		}
		function deleteCourse() {

			$.ajax({
				type : "post",
				url : "deleteCourse",
				data : {
					"courseid" : "${course.id}",
					"userid" : "${loginUser.id}"
				},
				async : true,
				success : function(data) {
					/* alert(password==data); */
					if (data == "true") {

						location.reload(true);
					} else {
						$(".learnbtn").focus();
						return;
					}
					/* alert(data); */
				},
				error : function(data) {
					//alert("进入了error方法");
					location.reload(true);
				}
			});
		}
	</script>
	<footer style="text-align: center">
	<hr>
	<p class="am-padding-left">
		© 2018 <a href="#">山西农业大学北京海淀基地</a>. 作者:杨祺晖
	</p>
	</footer>
</body>
</html>
