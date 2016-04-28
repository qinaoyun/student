<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>头像修改</title>
	
	<!-- 	导入js文件 -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-1.10.0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/general.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/headModify.js"></script>
	
	<!-- 	导入css文件 -->
	<link href="<%=request.getContextPath() %>/module/css/bootstrap.css" media="screen" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/css/style.css" media="screen" rel="stylesheet">

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
				            <a href="<%=request.getContextPath()%>/front/worknotice.jsp">
				                <i class="icon-menu icon-menu2"></i>
				                <span>发布作业</span>
				            </a>
				        </li>
				        <li>
				            <a href="<%=request.getContextPath()%>/front/tasknotice.jsp">
				                <i class="icon-menu icon-menu3"></i>
				                <span>发布分组</span>
				            </a>
				            <ul>
				                <li><a href="#">Web design</a></li>
				                <li><a href="#">User interface</a></li>
				                <li><a href="#">Social media</a></li>
				            </ul>
				        </li>
				        <li>
				            <a href="#">
				                <i class="icon-menu icon-menu4"></i>
				                <span>设置</span>
				            </a>
				        </li>
				    </ul>
				</div>
				<!-- header -->
				
				<!-- left -->
				<div class="row">
					<div class="col-sm-12">
					
					<!-- left -->
					<div class="col-sm-3">
						<ul class="dropdownver clearfix boxed lememale" >
					        <li>
					            <a href="<%=request.getContextPath() %>/front/personInfoModify.jsp">
					               <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					               <span>个人信息</span>
					               
					            </a>
					        </li>
					        <li>
					            <a href="<%=request.getContextPath() %>/front/passwdModify.jsp">
					                <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
					                <span>修改密码</span>
					            </a>
					        </li>
					        <li>
					            <a href="<%=request.getContextPath() %>/front/emailModify.jsp">
					                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
					                <span>邮箱绑定</span>
					            </a>
					        
					        </li>
					        <li>
					            <a href="<%=request.getContextPath() %>/front/headModify.jsp">
					                <span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
					                <span>头像上传</span>
					            </a>
					        </li>
			    		</ul>
					</div>
					<!-- right -->
					<div class="col-sm-9">
						<div class=" row widget-container boxed">
							<!-- <span class="badge col-sm-offset-11 marleft" ></span> -->
							<div class="ribbon">
	                        	<span>
	                            	<em></em>
	                            	<strong>*^_^*</strong>
	                        	</span>
							</div>
			
		                    <div class="row">
		                        <center><img src="<%=request.getContextPath()%>${frontnumber.sheadimg}" alt="touxiang" class="img-circle" width="240px" height="240px;"></center>
		                    </div>
					
		                    <div class="row">
		                    	<form action="<%=request.getContextPath() %>/headModify.do"  method="post" enctype="multipart/form-data">
		                        	<center>
		                        		<input type="file" width="200px" name="head_upload" onChange="fileUpload_CheckType(this.files);" >
		                        		<p id="check_remind"></p>
		                        		<ul id="show_pic"></ul>
		                        		<span class="btn btn-blue marbot" >
		                        			<input type="submit" value="提交" id="head_submit" disabled="disabled"/>
		                        		</span>
		                        	</center>
		                    	</form>
		                    </div>
								
						</div>
					</div>
			
						<!-- right -->
					</div>
				</div>
				<!-- left -->
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
	<!-- footer -->
    <!--/ container -->
</body>
</html>