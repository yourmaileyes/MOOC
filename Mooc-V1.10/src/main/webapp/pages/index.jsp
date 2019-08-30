<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<link href="favicon.ico" rel="icon" type="image/x-icon" />
<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
<script src="style/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="style/css/base.css">
<link rel="stylesheet" type="text/css" href="style/css/home.css">
<script type="text/javascript" src="style/js/banner.js"></script>
<script type="text/javascript" src="style/js/ad.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<style type="text/css">
body {
	background-color: #f5f5f5;
	padding-left: 0px;
}

#contents {
	background-color: #FFF;
	padding-left: 20px;
}
</style>
</head>
<%@include file="head.jsp"%>
<div class="container" style="margin-top: 5%">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="carousel slide" id="carousel-624135">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0"
								data-target="#carousel-624135"></li>
							<li data-slide-to="1" data-target="#carousel-624135"></li>
							<li data-slide-to="2" data-target="#carousel-624135"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="style/image/index/2.jpg" width="100%"
									height="300px" />
								<div class="carousel-caption">
									<h4>
										<!-- First Thumbnail label -->
									</h4>
									<p>
										<!-- Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. -->
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="style/image/index/1.jpg" width="100%"
									height="300px" />
								<div class="carousel-caption">
									<h4>
										<!-- Second Thumbnail label -->
									</h4>
									<p>
										<!-- Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									 -->
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="style/image/index/3.jpg" width="100%"
									height="300px" />
								<div class="carousel-caption">
									<h4>
										<!-- Third Thumbnail label -->
									</h4>
									<p>
										<!-- Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									 -->
									</p>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-624135"
							data-slide="prev"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#carousel-624135"
							data-slide="next"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					<div class="row clearfix" style="margin-top: 3%">
						<div class="col-md-12 column" >
							<img alt="140x140" src="style/image/free.JPG" />
							<div class="row clearfix">
								<c:forEach var="course" items="${freecourses}" begin="0" end="2">
									<div class="col-md-4 column" >
										<!--Regular if23-->
										<div class="uc-coursecard uc-ykt-coursecard f-fl">
											<a target="_blank" class="j-href"
												href="coursedetail?id=${course.id}">
												<div class="uc-ykt-coursecard-wrap f-cb f-pr">
													<div class="uc-ykt-coursecard-wrap_box">
														<div class="uc-ykt-coursecard-wrap_picbox f-pr">
															<img class="imgPic j-img"
																src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>"
																data-src="" alt="课程图片">
															<div class="m-showLectorTag f-pa" style="display: none;">老师参与</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_tit">
															<h3 class="">${course.name}</h3>
														</div>
														<div class="uc-ykt-coursecard-wrap_orgName f-fs0 f-thide">
															${course.context}</div>
														<div
															class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
															<div class="m-scorecnt f-fl f-cb">
																<div class="uc-starrating">

																	<span class="uc-starrating_score">${course.label }</span>
																</div>
															</div>
															<div class="m-hot f-fl">
																<!--Regular if24-->
																(${course.hour }人学过)

															</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_price f-pa">
															<!--Regular if25-->
															<span class="u-free">免费</span>

														</div>
														<!--Regular if26-->
													</div>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>


							</div>
						</div>
					</div>
					<div class="row clearfix" style="margin-top: 3%">
						<div class="col-md-12 column">
							<img alt="140x140" src="style/image/nofree.JPG" />
							<div class="row clearfix">
								<c:forEach var="course" items="${vipcourses}" begin="0" end="2">

									<div class="col-md-4 column">
										<!--Regular if23-->
										<div class="uc-coursecard uc-ykt-coursecard f-fl">
											<a target="_blank" class="j-href"
												href="coursedetail?id=${course.id}">
												<div class="uc-ykt-coursecard-wrap f-cb f-pr">
													<div class="uc-ykt-coursecard-wrap_box">
														<div class="uc-ykt-coursecard-wrap_picbox f-pr">
															<img class="imgPic j-img"
																src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>"
																data-src="" alt="课程图片">
															<div class="m-showLectorTag f-pa" style="display: none;">老师参与</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_tit">
															<h3 class="">${course.name}</h3>
														</div>
														<div class="uc-ykt-coursecard-wrap_orgName f-fs0 f-thide">
															${course.context}</div>
														<div
															class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
															<div class="m-scorecnt f-fl f-cb">
																<div class="uc-starrating">

																	<span class="uc-starrating_score">${course.label }</span>
																</div>
															</div>
															<div class="m-hot f-fl">
																<!--Regular if24-->
																(${course.hour }人学过)

															</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_price f-pa">
															<!--Regular if25-->
															<span class="u-free">会员免费</span>

														</div>
														<!--Regular if26-->
													</div>
												</div>
											</a>
										</div>

									</div>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>
			</div>
			<img alt="140x140" src="style/image/bottom.JPG" />
		</div>
	</div>
</div>
<footer style="text-align: center">
<hr>
<p class="am-padding-left">
	© 2018 <a href="#">山西农业大学北京海淀基地</a>. 作者:杨祺晖
</p>
</br>
</br>
</br>
</footer>

</body>
</html>