<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="author" content="ThemeFuse">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>学生作业系统</title>

<!-- main JS libs -->
<script src="<%=request.getContextPath()%>/module/js/libs/modernizr.min.js"></script>
<script src="<%=request.getContextPath()%>/module/js/libs/jquery-1.10.0.js"></script>
<script src="<%=request.getContextPath()%>/module/js/libs/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/module/js/libs/bootstrap.min.js"></script>

<!-- Style CSS -->
<link href="<%=request.getContextPath()%>/module/css/bootstrap.css" media="screen" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" media="screen" rel="stylesheet">
<link href="<%=request.getContextPath()%>/module/css/bootstrap-datetimepicker.css" media="screen" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/hide.css" rel="stylesheet">


<!-- scripts -->
<script src="<%=request.getContextPath()%>/module/js/general.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

</head>

<body>

<div class="container container-wide">

<!-- content -->
<div class="content " role="main">
<!-- row -->
<div class="row">
<div class="col-sm-9">
<!-- Website Menu -->
<div id="topmenu">
    <ul class="dropdown clearfix boxed">
        <li class="menu-level-0"><a href="<%=request.getContextPath()%>/tasknoticeMain.do"><i class="icon-menu"></i><span>主页</span><sup class="note">3</sup></a></li>
        <li class="menu-level-0"><a href="<%=request.getContextPath()%>/querycourse.do"><i class="icon-menu icon-menu2"></i><span>发布作业</span></a> </li>
        <li class="menu-level-0"><a href="<%=request.getContextPath()%>/querycourse1.do"><i class="icon-menu icon-menu3"></i><span>发布分组</span></a>
            <ul class="submenu-1">
                <li class="menu-level-1"><a href="#">test1</a></li>
                <li class="menu-level-1"><a href="#">test2</a></li>
                <li class="menu-level-1"><a href="#">test3</a></li>
            </ul>
        </li>
        <li class="menu-level-0"><a href="#"><i class="icon-menu icon-menu4"></i><span>设置</span></a></li>
        <!-- <li class="menu-level-0"><a href="#"><i class="icon-menu icon-menu4"></i><input type="submit" value="search"></a></li> -->
    </ul>
</div>
</div>