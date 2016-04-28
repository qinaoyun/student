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
		<title>时光机</title>
		
		<!-- main JS libs -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/modernizr.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-1.10.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/jquery-ui.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/libs/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/module/js/general.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/timeProcess.js"></script>
		
		<!-- Style CSS -->
		<link href="<%=request.getContextPath() %>/module/css/bootstrap.css" media="screen" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/module/css/styletime.css" rel="stylesheet" type="text/css" >
		<link href="<%=request.getContextPath() %>/css/style.css" media="screen" rel="stylesheet">
		
		</script>
	</head>
	<body>
		<!-- container -->
		<div class="container">
			<div class="container container-wide">
		
			<!-- content -->
			<div class="content " role="main">
				<!-- row -->
				<div class="row">
					<div class="col-sm-12">
					
					<!-- header -->
					<div id="topmenu">
					    <ul class="dropdown clearfix boxed ">
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
					                <li><a href="#">test1</a></li>
					                <li><a href="#">test2</a></li>
					                <li><a href="#">test3</a></li>
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
							<div class="timeline">
							
							<div class="timeline-date">
								<h2 class="second" style="position: relative;background:#fff;">
									<span class="btn btn-small">
										<input type="button" value="作业历史" id="work_his">
									</span>
									<span class="btn btn-small">
										<input type="button" value="分组历史" id="task_his">
									</span>
									<c:choose>
										<c:when test="${frontnumber.status=='普通学生'}"> </c:when>
										<c:otherwise>
											<span class="btn btn-small">
												<input type="button" value="作业发布历史" id="worknotice_his">
											</span>
											<span class="btn btn-small">
												<input type="button" value="分组发布历史" id="tasknotice_his">
											</span>
										</c:otherwise>
									</c:choose>
								</h2>
							</div>
							
<!-- 							作业提交历史记录 -->
							<div  class="work_history">
								<c:forEach items="${workDiffyearList}" var="diffYear" varStatus="id1">
								<div class="timeline-date" >
									<ul>
										<h2 class="second" style="position: relative;">
											<span>${diffYear}年</span>
										</h2>
										<c:forEach items="${workcompList}" var="workcomp" varStatus="id2">
											<c:if test="${workEachYear[id2.index] == diffYear}">
												<li>
													<h3>${workcomp.wsuploaddate }</h3>
													<dl class="right">
														<span>
															提交作业${workcomp.wsname }
															<a href="<%=request.getContextPath() %>/downloadFile.do?ID=${workcomp.ID}" target="_blank">下载提交的作业</a>
														</span>
													</dl>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								</c:forEach>
							</div>
							
<!-- 							任务分组历史记录 -->
							<div  class="task_history hidden" >
								<c:forEach items="${taskDiffyearList}" var="diffYear" varStatus="id1">
								<div class="timeline-date">
									<ul>
										<h2 class="second" style="position: relative;">
											<span>${diffYear}年</span>
										</h2>
										<c:forEach items="${taskcompList}" var="taskcomp" varStatus="id2">
											<c:if test="${taskEachYear[id2.index] == diffYear}">
												<li>
													<h3>${taskcomp.tccompletedate }</h3>
													<dl class="right">
														<span>进行分组${taskcomp.tcname },分为第${taskcomp.tcgroupnum }组</span>
													</dl>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								</c:forEach>
							</div>
						
						<c:choose>
							<c:when test="${frontnumber.status=='普通学生'}"> </c:when>
							<c:otherwise>
							<div  class="worknotice_history hidden" >
								<c:forEach items="${worknoticeDiffyearList}" var="diffYear" varStatus="id1">
								<div class="timeline-date">
									<ul>
										<h2 class="second" style="position: relative;">
											<span>${diffYear}年</span>
										</h2>
										<c:forEach items="${worknoticeList}" var="worknotice" varStatus="id2">
											<c:if test="${worknoticeEachYear[id2.index] == diffYear}">
												<li>
													<h3>${worknotice.wreleasedate }</h3>
													<dl class="right">
														<span>发布${worknotice.wname }的作业</span>
													</dl>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								</c:forEach>
							</div>
							
							<div  class="tasknotice_history hidden">
								<c:forEach items="${tasknoticeDiffyearList}" var="diffYear" varStatus="id1">
								<div class="timeline-date">
									<ul>
										<h2 class="second" style="position: relative;">
											<span>${diffYear}年</span>
										</h2>
										<c:forEach items="${tasknoticeList}" var="tasknotice" varStatus="id2">
											<c:if test="${tasknoticeEachYear[id2.index] == diffYear}">
												<li>
													<h3>${tasknotice.treleasedate }</h3>
													<dl class="right">
														<span>发布${tasknotice.tname }的分组</span>
													</dl>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								</c:forEach>
							</div>
							
							</c:otherwise>
						</c:choose>
							
							</div>
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
		</div>
		<!--/ container -->
	</body>
</html>