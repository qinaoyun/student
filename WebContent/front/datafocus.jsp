<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>班级资料库</title>
	
	<!-- main JS libs -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-1.10.0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.velocity.min.js"></script> 
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/general.js"></script>
	
	<!-- Style CSS -->
	<link href="<%=request.getContextPath() %>/module/css/bootstrap.css" media="screen" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/css/style.css" media="screen" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/css/styles.css" media="screen" rel="stylesheet">
</head>
<body>
	<div class="container container-wide">

		<!-- content -->
		<div class="content " role="main">
			<!-- row -->
			<div class="row">
				<div class="col-sm-12">
				
				<!-- header -->
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
				<!-- header -->
	
				<!-- left -->
    			</div>
			</div>
			<div class="col-sm-12">
        		<div class="htmleaf-container">
        
        		<div class="htmleaf-content bgcolor-3" >
        		<form  action="<%=request.getContextPath() %>/classfileUpload.do" method="post" enctype="multipart/form-data">
        			<input type="file" name="classfile">
        			<input type="submit" value="提交">
        		</form>
	          	<ul class="mtree bubba" style=" height:40px;">
	            	<li><h6>${frontnumber.scollege }>>${frontnumber.sclass }</h6></li>

	          	</ul>
	            <!-- This is mtree list -->
	            <ul class="mtree bubba" style="margin-top:-10px;">
	            <c:forEach items="${filelist}" var="file">
	              <li><a href="#">${file.cfilename}</a>
	                <ul>
	                  <li>上传人：${file.csname }</li>
	                  <li>上传时间：${file.cuploaddate }</li>
	                  <li><a href="<%=request.getContextPath() %>/classfileDownload.do?ID=${file.ID }" target="_blank">下载</a></li>
	                </ul>
	              </li>
	            </c:forEach>
	            </ul>
        		</div>
        		
    			</div>

			</div>
		</div>

		<!-- footer -->
		<div class="row">
		    <div class="col-sm-12">
		        <div class="widget-container boxed" style="margin-top:-55px;">
		        <h3 ><center>  Copyright&nbsp©2016 Sunny Corporation, All Rights Reserved</center></h3>
		        </div>
		    </div>
		</div>
	</div>
	
<!-- <script src='js/jquery.velocity.min.js'></script>  -->
<script>
    $(function ($, window, document, undefined) {
        if ($('ul.mtree').length) {
            var collapsed = true;
            var close_same_level = false;
            var duration = 400;
            var listAnim = true;
            var easing = 'easeOutQuart';
            $('.mtree ul').css({
                'overflow': 'hidden',
                'height': collapsed ? 0 : 'auto',
                'display': collapsed ? 'none' : 'block'
            });
            var node = $('.mtree li:has(ul)');
            node.each(function (index, val) {
                $(this).children(':first-child').css('cursor', 'pointer');
                $(this).addClass('mtree-node mtree-' + (collapsed ? 'closed' : 'open'));
                $(this).children('ul').addClass('mtree-level-' + ($(this).parentsUntil($('ul.mtree'), 'ul').length + 1));
            });
            $('.mtree li > *:first-child').on('click.mtree-active', function (e) {
                if ($(this).parent().hasClass('mtree-closed')) {
                    $('.mtree-active').not($(this).parent()).removeClass('mtree-active');
                    $(this).parent().addClass('mtree-active');
                } else if ($(this).parent().hasClass('mtree-open')) {
                    $(this).parent().removeClass('mtree-active');
                } else {
                    $('.mtree-active').not($(this).parent()).removeClass('mtree-active');
                    $(this).parent().toggleClass('mtree-active');
                }
            });
            node.children(':first-child').on('click.mtree', function (e) {
                var el = $(this).parent().children('ul').first();
                var isOpen = $(this).parent().hasClass('mtree-open');
                if ((close_same_level || $('.csl').hasClass('active')) && !isOpen) {
                    var close_items = $(this).closest('ul').children('.mtree-open').not($(this).parent()).children('ul');
                    if ($.Velocity) {
                        close_items.velocity({ height: 0 }, {
                            duration: duration,
                            easing: easing,
                            display: 'none',
                            delay: 100,
                            complete: function () {
                                setNodeClass($(this).parent(), true);
                            }
                        });
                    } else {
                        close_items.delay(100).slideToggle(duration, function () {
                            setNodeClass($(this).parent(), true);
                        });
                    }
                }
                el.css({ 'height': 'auto' });
                if (!isOpen && $.Velocity && listAnim)
                    el.find(' > li, li.mtree-open > ul > li').css({ 'opacity': 0 }).velocity('stop').velocity('list');
                if ($.Velocity) {
                    el.velocity('stop').velocity({
                        height: isOpen ? [
                            0,
                            el.outerHeight()
                        ] : [
                            el.outerHeight(),
                            0
                        ]
                    }, {
                        queue: false,
                        duration: duration,
                        easing: easing,
                        display: isOpen ? 'none' : 'block',
                        begin: setNodeClass($(this).parent(), isOpen),
                        complete: function () {
                            if (!isOpen)
                                $(this).css('height', 'auto');
                        }
                    });
                } else {
                    setNodeClass($(this).parent(), isOpen);
                    el.slideToggle(duration);
                }
                e.preventDefault();
            });
            function setNodeClass(el, isOpen) {
                if (isOpen) {
                    el.removeClass('mtree-open').addClass('mtree-closed');
                } else {
                    el.removeClass('mtree-closed').addClass('mtree-open');
                }
            }
            if ($.Velocity && listAnim) {
                $.Velocity.Sequences.list = function (element, options, index, size) {
                    $.Velocity.animate(element, {
                        opacity: [
                            1,
                            0
                        ],
                        translateY: [
                            0,
                            -(index + 1)
                        ]
                    }, {
                        delay: index * (duration / size / 2),
                        duration: duration,
                        easing: easing
                    });
                };
            }
            if ($('.mtree').css('opacity') == 0) {
                if ($.Velocity) {
                    $('.mtree').css('opacity', 1).children().css('opacity', 0).velocity('list');
                } else {
                    $('.mtree').show(200);
                }
            }
        }
    }(jQuery, this, this.document));

    </script>


</body>
</html>