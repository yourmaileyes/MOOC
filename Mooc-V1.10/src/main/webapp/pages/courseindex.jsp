<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>  
<head>  
<meta charset="utf-8"> 
<link rel="stylesheet" href="style/css/login.css">
<script src="style/js/login.js"></script>
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
<c:if test="${search!=null}">
<div class="mc-search-course-breadcrumb">
		<ul class="g-flow f-cb">
			<li><a href="index" target="_blank">首页</a></li>

			<li class="current"><span class="arrow"></span> <a
				href="javascript: void(0);">搜索结果</a></li>
		</ul>
		<br>
		<c:if test="${courses==null}">暂无此课程</c:if>
	</div>
	</c:if>
	<c:if test="${search==null}">
 <div class="mc-search-course-breadcrumb">
<ul class="g-flow f-cb">
<li class="current">
</li>



</ul>
</div>
</c:if>
<!--下面是主要内容的代码-->
<div class="container-fluid">  
<div class="j-course-list"><div class="uc-course-list g-flow">
	 <div class="uc-course-list_content">	
		
	    <ul class="uc-course-list_ul">
	        <!--Regular list-->
	    <c:forEach var="course" items="${courses}" varStatus="status">
	       
	        <li class="uc-course-list_itm f-ib">
				<!--Regular if23-->
    <div class="uc-coursecard uc-ykt-coursecard f-fl">
    <a target="_blank" class="j-href" href="coursedetail?id=${course.id}">
        <div class="uc-ykt-coursecard-wrap f-cb f-pr">
            <div class="uc-ykt-coursecard-wrap_box">
                <div class="uc-ykt-coursecard-wrap_picbox f-pr"> 
                	<img class="imgPic j-img" src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>" data-src="" alt="课程图片" >
                    <div class="m-showLectorTag f-pa" style="display: none;">老师参与</div>
                </div>
                <div class="uc-ykt-coursecard-wrap_tit">
                    <h3 class="">${course.name}</h3>
                </div>
                <div class="uc-ykt-coursecard-wrap_orgName f-fs0 f-thide">
               ${course.context}</div>
                <div class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
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
                        <span class="u-free"><c:if test="${course.type==0 }">免费</c:if><c:if test="${course.type==1 }">会员免费</c:if></span> 
                    
                </div>
                <!--Regular if26-->
            </div>
        </div>
    </a>
</div>

	        </li>
	        </c:forEach>
	    </ul>
	    <!--Regular if22-->
	 </div>
</div></div>
</div>  
  <footer style="text-align: center">
    <hr>
<p class="am-padding-left">© 2018 <a href="#">山西农业大学北京海淀基地</a>. 作者:杨祺晖</p>
</footer>
  
</body>  
</html>
