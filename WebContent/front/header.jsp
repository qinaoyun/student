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
<style>
/* 代码整理：懒人之家www.lanrenzhijia.com */
*{ margin:0; padding:0;}
body{background-color: #F1F1F1;color: #333}
.dn{display: none;}

.go-top{position: fixed;bottom: 100px;right: 20px;width: 46px;z-index: 999;}
.go-top a{display: block;width: 46px;height: 46px;margin-bottom: 10px;background-image: url(<%=request.getContextPath()%>/images/go-top.png?);}
.go-top a:last-child{margin-bottom: 0;}
.go-top .go{background-position: 0 -150px;}
.go-top .go:hover{background-position: 0 -250px;}
.go-top .feedback{background-position: 0 -100px;}
.go-top .feedback:hover{background-position: 0 -300px;}
.go-top .uc-2vm{background-position: 0 0;}
.go-top .uc-2vm:hover{background-position: 0 -350px;}
.go-top .uc-2vm-pop{position: absolute;right: 60px;top: -100px;	width: 220px;box-shadow: 0px 1px 4px rgba(0,0,0,.1);background: #fff;}
.go-top .uc-2vm-pop .title-2wm{font-size: 14px; margin: 10px 20px;}
.go-top .uc-2vm-pop .logo-2wm-box{position: relative;}
</style>
</head>

<body>
<div class="go-top dn" id="go-top">
    <a href="javascript:;" class="uc-2vm"></a>
	<div class="uc-2vm-pop dn">
		<h2 class="title-2wm">扫一扫二维码下载app客户端</h2>
		<div class="logo-2wm-box">
			<img src="<%=request.getContextPath()%>/images/erwei.png" alt="iwork" width="220" height="220">
		</div>
	</div>
    <a href="http://www.lanrenzhijia.com/" target="_blank" class="feedback"></a>
    <a href="javascript:;" class="go"></a>
</div>
<script src="../js/ajaxja.js"></script>
<script>
$(function(){
	$(window).on('scroll',function(){
		var st = $(document).scrollTop();
		if( st>=0 ){
			if( $('#main-container').length != 0  ){
				var w = $(window).width(),mw = $('#main-container').width();
				if( (w-mw)/2 > 70 )
					$('#go-top').css({'left':(w-mw)/2+mw+20});
				else{
					$('#go-top').css({'left':'auto'});
				}
			}
			$('#go-top').fadeIn(function(){
				$(this).removeClass('dn');
			});
		}else{
			$('#go-top').fadeOut(function(){
				$(this).addClass('dn');
			});
		}	
	});
	$('#go-top .go').on('click',function(){
		$('html,body').animate({'scrollTop':0},500);
	});

	$('#go-top .uc-2vm').hover(function(){
		$('#go-top .uc-2vm-pop').removeClass('dn');
	},function(){
		$('#go-top .uc-2vm-pop').addClass('dn');
	});
});
</script>

<div class="container container-wide">

<!-- content -->
<div class="content " role="main">
<!-- row -->
<div class="row">
<div class="col-sm-9">
<!-- Website Menu -->
<div id="topmenu">
			    <ul class="dropdown clearfix boxed floatle">
			        <li>
			            <a href="<%=request.getContextPath()%>/tasknoticeMain.do">
			                <i class="icon-menu"></i>
			                <span>主页</span>
			                <sup class="note">3</sup>
			            </a>
			        </li>
			        <li>
			            <a href="#">
			                <i class="icon-menu icon-menu3"></i>
			                <span>发布</span>
			            </a>
			            <ul>
			                <li><a href="<%=request.getContextPath()%>/querycourse.do">发布作业</a></li>
			                <li><a href="<%=request.getContextPath()%>/querycourse1.do">发布分组</a></li>
			            </ul>
			        </li>
			    </ul>
</div>
</div>