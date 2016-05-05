<%@ page language="java"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 	导入库文件 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/libs/jquery-1.10.0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/libs/jquery-ui.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/libs/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/general.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/jquery.customInput.js"></script>
	<link href="<%=request.getContextPath()%>/module/css/bootstrap.css" rel="stylesheet" media="screen">
<%-- 	<link href="<%=request.getContextPath()%>/module/css/bootstrap-responsive.css" rel="stylesheet" media="screen"> --%>
	<link href="<%=request.getContextPath() %>/css/style.css" media="screen" rel="stylesheet">
	<title>个人信息</title>
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
				<div class="col-sm-3 " >
				 <ul class="dropdownver boxed lememale">
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
			
			<!-- 个人信息修改 -->
			<div class="col-sm-9" >
					<div class=" row widget-container boxed">
						<span class="badge col-sm-offset-11 marleft" ></span>
                <form class="form-horizontial" role="form" >

              
                <div class="form-group martop row" >
                    <label for="course" class="col-sm-2 col-sm-offset-1 " ><h4 class="martop">姓名</h4></label>
                    <div class="col-sm-7  martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程名" class="form-control" id="course" name="name"
                        > -->
                        <div class="field_text wid" >
                            <input type="text" name="sname"  placeholder="姓名" disabled="disabled" style="cursor:not-allowed;" value="${frontnumber.sname}">
                        </div>
                    </div>
                    <div class="col-sm-2" ></div>
                </div>

				<div class="form-group martop row" >
                    <label for="course" class="col-sm-2 col-sm-offset-1 " ><h4 class="martop">学号</h4></label>
                    <div class="col-sm-7  martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程名" class="form-control" id="course" name="name"
                        > -->
                        <div class="field_text wid" >
                            <input type="text" name="sno"  placeholder="学号" disabled style="cursor:not-allowed;" value="${frontnumber.sno}">
                        </div>
                    </div>
                    <div class="col-sm-2" ></div>
				</div>


                <div class="form-group martop row" >
                    <label for="course" class="col-sm-2 col-sm-offset-1 " ><h4 class="martop">性别</h4></label>
                    <div class="col-sm-8  martop padleft " >
                            <div class="row">
                                <div class=" inlinelist row field_radio">
                                    <div class="rowRadio col-sm-3 col-sm-offset-0">
                                       <input type="radio" name="ssex" value="1" id="radio_v1" checked disabled="disabled"">
                                        <label for="radio_v1" class="radio1" style="text-align:left;">男生</label>
                                    </div>
                                    <div class="rowRadio col-sm-3 ">
                                        <input type="radio" name="ssex" value="0" id="radio_v2" disabled="disabled" >
                                        <label for="radio_v2" class="radio2" style="text-align: left;">女生</label>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>


				<div class="form-group martop row" >
                    <label for="courseNum" class="col-sm-2 control-label col-sm-offset-1" ><h4 class="martop" >班级</h4></label>
                    <div class="col-sm-7  martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程代号" class="form-control" id="courseNum" name="name"> -->
                        <div class="field_text wid" >
                            <input type="text" name="sclass"  placeholder="班级" disabled style="cursor:not-allowed;" value="${frontnumber.sclass}">
                        </div>
                    </div>
                    <div class="col-sm-2" style="color: red"></div>
				</div>

				<div class="form-group martop row" >
                    <label for="courseNum" class="col-sm-2 control-label col-sm-offset-1" ><h4 class="martop" >学院</h4></label>
                    <div class="col-sm-7  martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程代号" class="form-control" id="courseNum" name="name"> -->
                        <div class="field_text wid" >
                            <input type="text" name="scollege" placeholder="学院" disabled style="cursor:not-allowed;" value="${frontnumber.scollege}">
                        </div>
                    </div>
                    <div class="col-sm-2" style="color: red"></div>
                </div>

				<div class="form-group martop row" >
                    <label for="courseNum" class="col-sm-2 control-label col-sm-offset-1" ><h4 class="martop" >职位</h4></label>
                    <div class="col-sm-7  martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程代号" class="form-control" id="courseNum" name="name"> -->
                        <div class="field_text wid" >
                            <input type="text" name="status" placeholder="身份" disabled style="cursor:not-allowed;" value="${frontnumber.status}">
                        </div>
                    </div>
                    <div class="col-sm-2" style="color: red"></div>
                </div>

				<div class="form-group martop row" >
                    <label for="courseNum" class="col-sm-2 control-label col-sm-offset-1" ><h4 class="martop" >联系方式</h4></label>
                    <div class="col-sm-7 martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程代号" class="form-control" id="courseNum" name="name"> -->
                        <div class="field_text wid" >
                            <input type="text" name="scontact" placeholder="联系方式"  disabled value="${frontnumber.scontact}">
                        </div>
                    </div>
                    <div class="col-sm-2" style="color: red"></div>
                </div>
                    
				<div class="form-group martop row" >		
                    <label for="extra" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">个性签名</h4></label>
                    <div class="col-sm-7  martop padleft" >
                        <div class="field_text field_textarea">
                                <textarea  name="sdesc"  disabled>${frontnumber.sdesc}</textarea>
                        </div>
                    </div>
                    <div class="col-sm-2" style="color: red"></div>
                </div>

                

                <div class="col-sm-2 col-sm-offset-3">
                    <span class="btn marbot"><input type="button" value="修改" id="personInfoModify"  /></span>
                </div>

                <div class="col-sm-2 col-sm-offset-1">
                   	<span class="btn marbot"><input type="button" value="提交" id="submit1" disabled="disabled"/></span>
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
        <h3 ><center>  Copyright&nbsp;©2016 Sunny Corporation, All Rights Reserved</center></h3>
        </div>
    </div>
    
</div>
</body>
<!-- 	css导入 -->
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<!-- js导入 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/rightContent.js"></script>
</html>