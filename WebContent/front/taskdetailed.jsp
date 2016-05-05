<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="author" content="ThemeFuse">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<title>任务详情</title>
	
	<!-- main JS libs -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-1.10.0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/bootstrap.min.js"></script>
	
	<!-- Style CSS -->
	<link href="<%=request.getContextPath() %>/module/css/bootstrap.css" media="screen" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/css/style.css" media="screen" rel="stylesheet">
	
	<!-- scripts -->
	<script src="<%=request.getContextPath() %>/module/js/general.js"></script>
	<script src="<%=request.getContextPath() %>/module/js/jquery.powerful-placeholder.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/taskdetailed.js"></script>
	
</head>
<body>
	<div class="container container-wide">
		<!-- content -->
		<div class="content" role="main">
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
		
		<!--/ Website Menu -->
		
		<!-- row level 2 -->
		<div class="row">
		    <div class="col-sm-12">
		        
		            <!-- screen -->
		                        <div class="comment-list styled clearfix">
		                <ol>
		                    <li class="comment">
		                        <div class="comment-body boxed">
		                            <div class="comment-arrow"></div>
		                            <div class="comment-avatar">
		                                <div class="avatar">
		                                    <img src="<%=request.getContextPath() %>/module/images/temp/avatar6.png" alt="" />
		                                </div>
		                            </div>
		                            <div class="comment-text">
		                                <div class="comment-author clearfix">
		                                    <a href="#" class="link-author">${task.tname}</a>
		                                </div>
		                                <div class="comment-entry">
		                                	<strong style="font-size: 20px;">课程描述:</strong>
											${task.tcoursedesc}
		                                </div>
		                            </div>
		                            <div class="clear"></div>
		                        </div>
		                    </li>
		                </ol>
		            </div>
		            <!-- screen -->
		
		            <!-- form -->
		           <div class="row widget-container boxed martop mydiv" >
		            <div class="col-sm-12">
		                
		                <div class="form-group" >
		                    <label for="homework" class="col-sm-2 col-sm-offset-1"><h4 class="firstmar">每组人数</h4></label>
		                    <div class="col-sm-8 padleft ">
		                        <!-- <input type="text" placeholder="请输入作业名" class="form-control" id="homework" name="name"> -->
		                        <div class="row">
									<c:forEach items="${numUserlist}" var="numUser"  varStatus="id">
				                        <div class="col-sm-1">
				                            <div style="background:url(<%=request.getContextPath() %>/images/pic2.png);width:40px;height:40px;margin-bottom:20px;"><h5 style="text-align:center;line-height:40px;">${numUser}</h5></div>
				                        </div>
			                        </c:forEach>
		                        </div>
		                    </div>
		                </div>

						<c:forEach items="${userlist}" var="username" varStatus="id">
				            <div class="form-group" >
				                <form action="<%=request.getContextPath() %>/taskdetailedSubmit.do" method="post" name="form_${id.count}">
				                    <label for="course" class="col-sm-2 col-sm-offset-1 " ><h4 style="color:black;">第${id.count}小组</h4></label>
				                    <div class="col-sm-8  martop padleft" >
				                        <div class="field_text wid" >
				                            <input type="text" name="name" id="name" placeholder="暂时还无人选择这组" disabled class="name" value="${username}">
				                        </div>
				                    </div>
				                    <div class="col-sm-1 martop padleft">
										<input type="hidden" name="url" value="<%=request.getContextPath() %>/taskdetailedSubmit.do">
										<input type="hidden" name="tasktag" value="${tasktag}">
										<input type="hidden" name="groupNum" value="${id.count}">
										<input type="image" src="<%=request.getContextPath() %>/module/images/icons/plus.png" class="submit" onclick="return false;">
									</div>
								</form>
				            </div>
		                </c:forEach>
		
		           </div>
		            <!-- form -->
		        </div>
		    </div>
		
		   <!--  <div class="col-sm-8">
		        
		
		    </div> -->
		</div>
		<!--/ row level 2 -->
		</div>
		
		<div class="col-sm-3">
		   
		
		<!--dddddddddddddddddddddddd-->
		<div class="widget-container widget_avatar boxed">
		    <div class="avatar-image">
		        <img src="<%=request.getContextPath() %>/module/images/temp/avatar-image.jpg" alt="" />
		    </div>
		    <div class="inner clearfix">
		        <div class="avatar">
		            <img src="<%=request.getContextPath() %>/module/images/temp/avatar.png" alt="" />
		        </div>
		        <h5>${frontnumber.sname}</h5>
		        <span class="subtitle">
		            ${frontnumber.sdesc}
		        </span>
		    </div>
		    <div class="post-meta-links">
		        <ul class="clearfix">
		            <li class="post-view">
		                <a href="<%=request.getContextPath() %>/front/personInfoModify.jsp" title="homepage"><span><i class=" icon-post"></i>设置</span></a>
		            </li>
		            <li class="post-comm">
		                <a href="#"><span><i class="icon-post"></i>34</span></a>
		            </li>
		            <li class="post-like">
		                <a href="#"><span><i class="icon-post"></i>210</span></a>
		            </li>
		        </ul>
		    </div>
		</div>
		<!--dddddddddddddddddddddddd-->
		
		
		<!--panel-->
		<div class="widget-container widget_gallery boxed">
		        <div class="inner">
		            <div id="myCarousel" class="carousel slide" data-interval="20000">
		                <!-- Carousel items -->
		                <div class="carousel-inner">
		                    <div class="active item"><img src="<%=request.getContextPath() %>/module/images/temp/post_img6.jpg" alt="" /><div class="carousel-desc"><span>Wild Deer</span></div></div>
		                    <div class="item"><img src="<%=request.getContextPath() %>/module/images/temp/post_img1.jpg" alt="" /><div class="carousel-desc"><span>Change your fate</span></div></div>
		                    <div class="item"><img src="<%=request.getContextPath() %>/module/images/temp/post_img3.jpg" alt="" /><div class="carousel-desc"><span>Unstoppable hero</span></div></div>
		                    <div class="item"><img src="<%=request.getContextPath() %>/module/images/temp/post_img2.jpg" alt="" /><div class="carousel-desc"><span>Change your fate</span></div></div>
		                    <div class="item"><img src="<%=request.getContextPath() %>/module/images/temp/post_img4.jpg" alt="" /><div class="carousel-desc"><span>Unstoppable hero</span></div></div>
		                </div>
		                <!-- Carousel indicators -->
		                <ol class="carousel-indicators">
		                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		                    <li data-target="#myCarousel" data-slide-to="1"></li>
		                    <li data-target="#myCarousel" data-slide-to="2"></li>
		                    <li data-target="#myCarousel" data-slide-to="3"></li>
		                    <li data-target="#myCarousel" data-slide-to="4"></li>
		                </ol>
		                <!-- Carousel nav -->
		                <a class="carousel-control left" href="#myCarousel" data-slide="prev"></a>
		                <a class="carousel-control right" href="#myCarousel" data-slide="next"></a>
		            </div>
		        </div>
		    </div>
		
		<!-- link -->
		        <div class="horizontal widget-social boxed ">
		        <ul class="rerange">
		        <li >
		            <a href="#" class="social-facebook"><span>Facebook</span></a>
		        </li>
		        <li > 
		            <a href="#" class="social-pinterest"><span>Pinterest</span></a>
		        </li>
		        <li>
		            <a href="#" class="social-twitter"><span>Twitter</span></a>
		        </li>
		       </ul>
		</div>
		<!-- link -->
		<!--panel-->
		
		
		</div>
		</div>
		<!--/ row -->
		
		<!-- row -->
		
		
		
		
		</div>
		<!-- footer -->
		<div class="row">
		    <div class="col-sm-12">
		        <div class="widget-container boxed" style="margin-top:-55px;">
		        <h3 ><center>  Copyright&nbsp©2016 Sunny Corporation, All Rights Reserved</center></h3>
		        </div>
		    </div>
		    
		</div>
		<!-- footer -->
		</div>
</body>
</html>