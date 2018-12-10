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
<div class="container-fluid" style="background-color: white;">
	<div class="container-fluid" style="height: 1700px;border-radius:10px;;margin-bottom:50px;;padding-top:30px;margin-top:100px;margin-left: 450px;margin-right: 450px;background-color: #F5F6FA;">
			 <div class="col-md-6" id=contents style="padding-bottom: 20px;width: 910px;height: 350px;background-color: #F5F6FA;">
				<div class="aui-content-box">
					<div class="example2">
						<ul>
							<li><img src="style/image/index/2.jpg" alt="2" width="910"
								height="350"></li>
							<li><img src="style/image/index/1.jpg" alt="1" width="910"
								height="350"></li>
							<li><img src="style/image/index/3.jpg" alt="3" width="910"
								height="350"></li>
						</ul>
						<ol>
							<li></li>
							<li></li>
							<li></li>
						</ol>
					</div>
				</div>
			</div> 
		<div class="col-md-12">

		<br> <br> <br> 
</div>
		<!-- Content -->
		
			<div style="padding: 20px; background-color: #F5F6FA;margin: 20px;">
				<div style="">
					<img alt="" src="style/image/free.JPG">
				</div>

				<ul class="uc-course-list_ul">
					<!--Regular list-->
					<c:forEach var="course" items="${freecourses}" begin="0" end="2">

						<li class="uc-course-list_itm f-ib">
							<!--Regular if23-->
							<div class="uc-coursecard uc-ykt-coursecard f-fl">
								<a target="_blank" class="j-href"
									href="coursedetail.do?id=${course.id}">
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

						</li>
					</c:forEach>
				</ul>
			</div>
			<div
				style="margin: 20px; padding: 20px; background-color: #F5F6FA;">
				<div style="">
					<img alt="" src="style/image/nofree.JPG">
				</div>

				<ul class="uc-course-list_ul">
					<!--Regular list-->
					<c:forEach var="course" items="${vipcourses}" begin="0" end="2">

						<li class="uc-course-list_itm f-ib">
							<!--Regular if23-->
							<div class="uc-coursecard uc-ykt-coursecard f-fl">
								<a target="_blank" class="j-href"
									href="coursedetail.do?id=${course.id}">
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

						</li>
					</c:forEach>

				</ul>
			</div>
			<div style="margin-top: 20px;">
				<img alt="" src="style/image/bottom.JPG" width="900px">
			</div>

		


	</div>
</div>

<footer style="text-align: center">
<hr>
<p class="am-padding-left">
	© 2018 <a href="#">达内北京海淀基地</a>. 作者:杨祺晖
</p>
</br>
</br>
</br>
</footer>
<script type="text/javascript">
	$(function() {

		$(".next a").click(function() {
			nextscroll()
		});

		function nextscroll() {

			var vcon = $(".aui-content-box-list ");

			var offset = ($(".aui-content-box-list li").width()) * -1;

			vcon.stop().animate({
				left : offset
			}, "slow", function() {

				var firstItem = $(".aui-content-box-list ul li").first();

				vcon.find("ul").append(firstItem);

				$(this).css("left", "0px");

				circle()

			});

		}
		;

		function circle() {

			var currentItem = $(".aui-content-box-list ul li").first();

			var currentIndex = currentItem.attr("index");

			$(".circle li").removeClass("circle-cur");

			$(".circle li").eq(currentIndex).addClass("circle-cur");

		}

		$(".prev a").click(function() {

			var vcon = $(".aui-content-box-list ");

			var offset = ($(".aui-content-box-list li").width() * -1);

			var lastItem = $(".aui-content-box-list ul li").last();

			vcon.find("ul").prepend(lastItem);

			vcon.css("left", offset);

			vcon.animate({
				left : "0px"
			}, "slow", function() {

				circle()

			})

		});

	});

	var intDiff = parseInt(600000);//倒计时总秒数量

	function timer(intDiff) {
		window.setInterval(function() {

			var day = 0,

			hour = 0,

			minute = 0,

			second = 0;//时间默认值

			if (intDiff > 0) {

				day = Math.floor(intDiff / (60 * 60 * 24));

				hour = Math.floor(intDiff / (60 * 60)) - (day * 24);

				minute = Math.floor(intDiff / 60) - (day * 24 * 60)
						- (hour * 60);

				second = Math.floor(intDiff) - (day * 24 * 60 * 60)
						- (hour * 60 * 60) - (minute * 60);

			}

			if (minute <= 9)
				minute = '0' + minute;

			if (second <= 9)
				second = '0' + second;

			$('#hour_show').html('<s id="h"></s>' + hour + '时');

			$('#minute_show').html('<s></s>' + minute + '分');

			$('#second_show').html('<s></s>' + second + '秒');

			intDiff--;

		}, 1000);

	}

	$(function() {

		timer(intDiff);

	});

	//ad自动滚动
	$(function() {
		$(".example2").luara({
			width : "910",
			height : "350",
			interval : 3500,
			selected : "seleted",
			deriction : "left"
		});

	});
</script>
</body>
</html>