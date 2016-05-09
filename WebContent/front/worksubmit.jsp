<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./header.jsp"%>
<head>
<meta charset="utf-8">
<meta name="author" content="ThemeFuse">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Metro Vibes | Index</title>

<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<!-- main JS libs -->
<script src="js/libs/modernizr.min.js"></script>
<script src="js/libs/jquery-1.10.0.js"></script>
<script src="js/libs/jquery-ui.min.js"></script>
<script src="js/libs/bootstrap.min.js"></script>
<script src="js/general.js"></script>
<script src="js/jquery.powerful-placeholder.min.js"></script>
<script src="jss/jquery-1.11.3.min.js"></script>
<link href="css/bootstrap.css" media="screen" rel="stylesheet">
<link href="style.css" media="screen" rel="stylesheet">

<script>
	$(document).ready(function() {
		$(".mybut").click(function() {
			$(this).next().css({
				"display" : "block"
			});
		});
	});

	$(function() {
		$("#inputt").bind("change", function() {
			var aa = $(this).val();
			// alert(aa);
			if (aa.indexOf('\\') > -1) {
				var filename = aa.split("\\");
				$("#content").val(filename[2]);
			} else {
				$("#content").val(aa);
			}
		});
	});
	
	
</script>
<script>
/*  判断是否提交过作业*/
function window_onload(){

	if($("#flag").val()==1){
	
		$("#selectfile").html("修改作业");
// 		alert($("#selectfile").val());
	}
	else{	
		$("#selectfile").html("选择作业");
	}
}
</script>
</head>

<body onload="window_onload()">

	<div class="container container-wide">

		<!-- content -->
		<div class="content " role="main">
			<!-- row -->
			<div class="row">
				<div class="col-sm-9">
					<!-- Website Menu -->
					<div id="topmenu">
						<ul class="dropdown clearfix boxed">

							<ul class="submenu-1">
								<li class="menu-level-1"><a href="#">Web design</a></li>
								<li class="menu-level-1"><a href="#">User interface</a></li>
								<li class="menu-level-1"><a href="#">Social media</a>
									<ul class="submenu-2">
										<li class="menu-level-2"><a href="#">Gallery images</a></li>
										<li class="menu-level-2"><a href="#">Fine Slider</a></li>
										<li class="menu-level-2"><a href="#">Video in header</a>
										</li>
										<li class="menu-level-2"><a href="#">Video Slider</a>
											<ul class="submenu-3">
												<li class="menu-level-3"><a href="#">Item 1</a></li>
												<li class="menu-level-3"><a href="#">Item 2</a></li>
												<li class="menu-level-3"><a href="#">Item 3</a></li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
							</li>
							<!-- <li class="menu-level-0"><a href="#"><i class="icon-menu icon-menu4"></i><input type="submit" value="search"></a></li> -->
						</ul>
					</div>
					<!--/ Website Menu -->

					<!-- row level 2 -->
					<div class="row">
						<div class="col-sm-12">
							<!-- form -->
							<div class="container ">
								<div class="jumbotron lememale ">									
                                     	<c:forEach items="${worknotice}" var="worknotice">
                                     	<h3>${worknotice.wname}<p class="text-right">任课老师：${worknotice.wcourseteacher}</p></h3>
											<small>${worknotice.wcoursedesc}</small>
                                			<p class="text-right">发布日期：${worknotice.wreleasedate}</p>
										</c:forEach>
									<div class="row boxed">
										<!-- 提交作业的表单 -->
										<form id="form4" action="<%=request.getContextPath()%>/fileUpload.do"
											method="post" class="form-horizontial"
											enctype="multipart/form-data">
											<div class="form-group">
												<div class="col-sm-2" >
													<a href="#" class="btn btn-right"><span id="selectfile"></span> </a>
												</div>
												<div class="col-sm-2 col-sm-pull-2">
													<input type="file" style="height: 50px; opacity: 0;"
														id="inputt" name="file">
												<c:forEach items="${worknotice}" var="worknotice">	
													 <input type="hidden"
														name="wsworkid"
														value="${worknotice.ID} " />
														</c:forEach>
												</div>
												<br>
												<div class="col-sm-12">
													<input type="text" name="name" id="content"
														placeholder="Name" required="true"value="${filename}">
												</div>
												<div class="col-sm-offset-9 col-sm-3"
													style="position: absolute; right: 20px;">
													<span class="btn btn-green"><input type="submit"
														name="remark" value="提交作业" class="martopdown"> </span>
												</div>
											</div>
										</form>
										<br>


										<!-- 提交评论的表单 -->
										<form action="<%=request.getContextPath()%>/messagely.do"
											method="post" class="form-horizontial">
											<div class="form-group">
												<div
													class="field_text field_textarea col-sm-setoff-1 col-sm-10">
													<textarea id="message" placeholder="Message" rows="3"
														cols="30" name="message"required="true"></textarea>
                                                      
												</div>
											</div>

											<div class="form-group">
												<div
													class="field_text field_textarea col-sm-setoff-1 col-sm-10"
													style="margin-top: -18px;">
													<span class="btn btn-blue"><input type="submit"
														name="remark" value="提交评论"> </span>


                                                       <c:forEach items="${worknotice}" var="worknotice">	
													 <input type="hidden"
														name="wsworkid"
														value="${worknotice.ID} " />
														</c:forEach>
												</div>
											</div>
										</form>
                                       <input type="hidden" id="flag"value="${flag}" />

										<div class="form-group">
											<div class="field_text field_textarea col-sm-setoff-1 col-sm-10" style="width: 100%; height: auto;padding-left: 10px;">
												<!-- 显示留言的内容 -->
												<c:forEach items="${msg}" var="msg">
													<ol>
														<div class="row">
															<div class="col-sm-9">
																<li><h6>${msg.mname}  :  ${msg.mcontent}</h6></li>
																<h5>&nbsp&nbsp&nbsp&nbsp回复</h5>
																<c:forEach items="${rpy}" var="rpy">
																<c:if test="${msg.ID==rpy.messageid}">
																<!-- 显示回复留言的内容 -->
                                                               <li><h6>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:out value="${rpy.rname}  ： ${rpy.rcontent}"/></h6></li>
                                                               </c:if>
																</c:forEach>
															</div>
															
															
														<!-- 回复评论的表单 -->
																	<form action="<%=request.getContextPath()%>/replayly.do"
											                method="post" class="form-horizontial">
															<div class="mybut col-sm-3 col-sm-push-2 "
																style="width: 40px; height: 40px; background: url(<%=request.getContextPath()%>/module/images/mess.png);">
															</div>
															<div class="row" style="display: none;">
																<!--   <div class="col-sm-10" > -->
																<input type="text" placeholder="请留下你的评论……"
																	style="margin-left: 30px; width: 70%;"name="replay">
																<!-- </div> -->
																<!-- <div class="col-sm-2"> -->
																<span class="btn btn-blue "><input type="submit"
																	value="回复" class="mydrop"
																	style="margin-left: -10px; margin-top: -10px; float: right; border-radius: 40px;">
																</span>
																<!-- </div> -->
																 <input type="hidden" name="messageid"value="${msg.ID} " />
																   <c:forEach items="${worknotice}" var="worknotice">	
													             <input type="hidden"
														                  name="wsworkid"
														                  value="${worknotice.ID} " />
														</c:forEach>
															</div>
 															</form>
														</div>

													</ol>
												</c:forEach>
											</div>

										</div>  <!-- 显示留言group -->

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				
<%@ include file="./middle.jsp" %>

</div>


</div >
<!-- footer -->
</div>
<%@include file="./footer.jsp" %>
