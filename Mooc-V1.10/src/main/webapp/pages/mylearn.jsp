<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>  
<head>  
<meta content="text/html; charset=UTF-8"> 
  <link rel="stylesheet" href="style/css/login.css">
<script src="style/js/login.js"></script>
<link rel="stylesheet" href="style/css/amazeui.min.css">
<link rel="stylesheet" href="style/css/course.css">
<link rel="stylesheet" href="style/css/admin.css">
<script src="style/js/loginandregist.js"></script>
<script src="style/js/jquery-2.1.4.min.js"></script>
<script src="style/js/amazeui.min.js"></script>
<link rel="stylesheet" href="style/css/bootstrap.min.css">
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css"> 
<script src="${pageContext.request.contextPath }/style/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/course.css">
 --%>
 <title>Mooc我的学习</title>
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
<li>
<a href="${pageContext.request.contextPath }" target="_blank">首页</a>
</li>

<li class="current">
<span class="arrow"></span>
<a href="javascript: void(0);">我的学习</a>
</li>

</ul>
</div>
<div class="container-fluid">  
<div class="j-course-list"><div class="uc-course-list g-flow">
	 <div class="uc-course-list_content">	
		
	    <ul class="uc-course-list_ul">
	        <!--Regular list-->
	    <c:forEach var="course" items="${mycourses}" varStatus="status">
	       
	        <li id="${course.id}" class="uc-course-list_itm f-ib">
				<!--Regular if23-->
    <div class="uc-coursecard uc-ykt-coursecard f-fl">
    <a target="_blank" class="j-href" href="coursevideo?courseid=${course.id}">
        <div class="uc-ykt-coursecard-wrap f-cb f-pr">
            <div class="uc-ykt-coursecard-wrap_box">
                <div class="uc-ykt-coursecard-wrap_picbox f-pr"> 
                	<img class="imgPic j-img" src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>" data-src="" alt="课程图片" >
                          <div class="uc-ykt-course-card_closewrap">
							<div class="uc-ykt-course-card_close f-dn" ></div>
						</div>
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
	 
	<span class="uc-starrating_score">${course.label}</span>
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
  
  

   <div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					你确定放弃学习？
				</h4>
			</div>
			<div class="modal-body">
				放弃学习将不再收到相关的课件更新和教学服务通知，你可以在课程有效期内免费重新参加。
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">取消
				</button>
				<button type="button" class="btn btn-primary" onclick="deleteCourse()">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div>

  <script>
$(document).ready(function(){
  $(".uc-ykt-coursecard-wrap_box").mouseenter(function(){
    $(this).children(".f-pr").children(".uc-ykt-course-card_closewrap").children(".f-dn").show();

  });
});
$(document).ready(function(){
$(".uc-ykt-coursecard-wrap_box").mouseleave(function(){
   $(this).children(".f-pr").children(".uc-ykt-course-card_closewrap").children(".f-dn").hide();
 });
  });
  
 
  $(document).ready(function(){
  $(".f-dn").click(function(){
   id =$(this).parents("li").attr('id');
  
  
  $('#loginModal').modal('show');
	return false;
	
  });
});

function deleteCourse() {
			
			$
					.ajax({
						type : "post",
						url : "deleteCourse",
						data : {
							"courseid" : id ,
							"userid" :   "${loginUser.id}"
						},
						async : true,
						success : function(data) {
							/* alert(password==data); */
							if (data == "true") {
								$('#loginModal').modal('hide');
								window.location = "${pageContext.request.contextPath }/mylearn";
							} else {
								$("#loginModal").focus();
									return;
							}
							/* alert(data); */
						},
						error : function(data){
							   //alert("进入了error方法");
							   location.reload(true) ;
							   }
					});
		}
</script>
 <footer style="text-align: center">
    <hr>
<p class="am-padding-left">© 2018 <a href="#">山西农业大学北京海淀基地</a>.作者:杨祺晖 </p>
</footer>
</body>  
</html>
