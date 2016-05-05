<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>邮箱绑定</title>
	
	<!-- main JS libs -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-1.10.0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/general.js"></script>
	
	<!-- Style CSS -->
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
			<!-- left -->
			
			<!-- right -->
			<div class="col-sm-9">
			
				<div class="pricing_box price_style2">
				    <ul class="clearfix">
				        <li class="price_col price_col_blue col_active">
				            <div class="price_item boxed">
				                <div class="price_col_head">
				                    <span class="badge badge-large"></span>
				                    <span class="price"><em>email</em></span>
				                </div>
				                <div class="price_col_body clearfix">
				                    <div class="price_body_inner">
				                        <div class="price_body_top">
				                            <span>Full Circle</span>
				                            <strong>Basic</strong>
				                            <div class="line"></div>
				                        </div>
				                        <ul>
				                            <li>Unlimited Traffic</li>
				                            <li>20 gb in Cloud</li>
				                            <li>0.5 gbit/sec</li>
				                        </ul>
				                    </div>
				                </div>
				                <div class="price_col_foot">
				                    <div class="sign_up">
				                        <a href="#" class="btn btn-blue " id="try" ><span>Buy Now</span></a>
				                    </div>
				                </div>
				            </div>
				        </li>
				    </ul>
				</div>
					
				<div class="widget-container boxed" style="position:absolute;width:300px;height:300px;top:0px;display:none;" id="mypart">
			        <h3 class="widget-title">
			            修改绑定邮箱<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        </h3>
	  
				    <div class="inner">
				        <form class="form-horizontial" role="form" method="post" >
				            <div class="form-group row">
				                <br>
				                <center><p>您当前绑定的邮箱为：</p></center>
				                <div class="col-sm-4" style="text-align:right;">
				                	<label for="mail" ><h5 style="color:black;">邮箱</h5></label>
				                </div>
				                <div class="col-sm-6 " >
				                	<input type="email" >
				                </div>
				
				                <div class="form-group">
				                	<div class="col-sm-4 col-sm-offset-4 " style="margin-top:20px;">
				                		<span class="btn btn-small btn-blue ">
				                			<input type="submit" value="提交">
				                		</span>
				                	</div>
				            	</div>
				            </div> 
				        </form>
				    </div>
				</div>

<script>
$(function(){
    $("#try").click(function(){
        // $("#mypart").css({"display":"block","z-index":"3"});
        $("#mypart").slideDown("slow");
        $(".price_style2 ").css({"opacity":"0.5"});
        $(".dropdownver").css({"opacity":"0.5"});
        $(".dropdown").css({"opacity":"0.5"});

    });

    $(".close").click(function(){
        $("#mypart").slideUp("slow");
        $(".price_style2 ").css({"opacity":"1","transition":"all 1s ease"});
        $(".dropdownver").css({"opacity":"1","transition":"all 1s ease"});
        $(".dropdown").css({"opacity":"1","transition":"all 1s ease"});
    });
});
</script>

			</div>
			<!-- right -->
		</div>
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
<!-- footer -->
    <!--/ container -->
	</body>
</html>