<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mooc后台管理系统</title>
<script src="style/js/adapter.js"></script> <!--rem适配js-->
<script src="style/js/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="style/css/base.css"> <!--初始化文件-->
<link rel="stylesheet" href="style/css/menu.css"> <!--主样式-->
</head>
<body>
<div id="menu" style="float: left;">
    <!--隐藏菜单-->
    <div id="ensconce">
        <h2>
            <img src="style/image/show.png" alt="">
            mooc后台管理系统
        </h2>
    </div>

    <!--显示菜单-->
    <div id="open">
        <div class="navH">
            <a href="adminindex" target="rigt_main" style="color: white;font-size: 20px;">mooc后台管理系统</a>
            <span><img class="obscure" src="style/image/obscure.png" alt=""></span>
        </div>
        <div class="navBox">
            <ul>
                <li>
                    <h2 class="obtain">用户管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="alluser?page=0" target="rigt_main" style="color: white;font-size: 13px;">所有用户</a></h3>
                        <h3><a href="newuser" target="rigt_main" style="color: white;font-size: 13px;">新增用户</a></h3>
                        <h3><a href="rechargeindex" target="rigt_main" style="color: white;font-size: 13px;">账户余额充值</a></h3>
                    </div>
                </li>
                <li>
                    <h2 class="obtain">课程管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="allcourse?page=0" target="rigt_main" style="color: white;font-size: 13px;">查看所有课程信息</a></h3>
                        <h3><a href="coursede?" target="rigt_main" style="color: white;font-size: 13px;">添加课程信息</a></h3>
                    </div>
                </li>
                <li>
                    <h2 class="obtain">日志管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="showlog" target="rigt_main" style="color: white;font-size: 13px;">用户日志</a></h3>
                        <h3><a href="showlog?type=admin" target="rigt_main" style="color: white;font-size: 13px;">管理员操作日志</a></h3>
                    </div>
                </li>
                <li>
                    <h2 class="obtain">IP管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="allip?page=0" target="rigt_main" style="color: white;font-size: 13px;">所有IP日志</a></h3>
                        <h3><a href="ipset" target="rigt_main" style="color: white;font-size: 13px;">新建IP管理</a></h3>
                    </div>
                </li>
            </ul>
<div style="margin-top: 50px;text-align: center;">
                        <h3><a href="logoutadmin" style="font-size: 15px;color: white;">退出mooc后台管理</a></h3>
                    </div>
        </div>
    </div>
</div>
<div>
<iframe id="iframe" style="text-align:center;" src="adminindex"  width="" height="" name="rigt_main" frameborder="0" scrolling="auto"></iframe>
</div>
<script src="style/js/menu.js"></script> <!--控制js-->
<script type="text/javascript">

</script>
</body>
</html>