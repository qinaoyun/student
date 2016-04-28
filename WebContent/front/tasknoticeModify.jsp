<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./header.jsp" %>
<head>
<script src="<%=request.getContextPath()%>/js/tasknotice.js"></script>
</head>
<body>
<div class="col-sm-9">

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
                                    <img src="<%=request.getContextPath()%>/module/images/temp/avatar6.png" alt="" />
                                </div>
                            </div>
                            <div class="comment-text">
                                <div class="comment-author clearfix">
                                    <a href="#" class="link-author">勉学篇</a>
                                </div>
                                <div class="comment-entry">
                                    书到用时方恨少。。 

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
            
            
            <form class="form-horizontial" role="form" method="post" action="<%=request.getContextPath()%>/tasknoticeModifySubmit.do">

                <div class="form-group" >
                    <label for="homework" class="col-sm-2 col-sm-offset-1"><h4 class="firstmar">任务名称</h4></label>
                    <div class="col-sm-8 padleft ">
                        <!-- <input type="text" placeholder="请输入作业名" class="form-control" id="homework" name="name"> -->
                        <div class="field_text wid" >
                            <input type="text" name="tname"  placeholder="请输入作业名" value="${task.tname}">
                        </div>
                    </div>
                </div>
                
                <div class="form-group" >
                    <label for="course" class="col-sm-2 col-sm-offset-1 " ><h4 class="martop">课程名称</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程名" class="form-control" id="course" name="name"
                        > -->
                        <div class="field_text wid" >
                         <select name=" tcoursename" id="tcoursename"class="form-control">
                    <c:forEach var="course"  items="${obj}">
                                  
                                   <option value="${course.ID}" id="scourseid"<c:if test="${task.tcoursename == course.ID}">selected="true"</c:if>>${course.coursename}</option>                                     
                                   
                     </c:forEach>
                    </select>
                        </div>
                    </div>
                </div>
<!-- 根据学院查询所有课程 --> 
            <script type="text/javascript">
            $("#tcoursename").blur(function(){
//             	alert($("#scourse").val());
                
        		$.post("<%=request.getContextPath() %>/queryteaname.do",{
        			courseid : $("#tcoursename").val(),
        			data:"test"	
        		},
        		function(data,status){
        			var result = data; 
//         			$("#sclass").empty();
        			for ( var i = 0; i < result.length; i++) {
/*         				alert(result[0].classinfo); */       				
        				$("#tcoursenum").val(result[i].courseno); 
        			} 		
        		},"json");
        	});
            </script>
                <div class="form-group" >
                    <label for="courseNum" class="col-sm-2 control-label col-sm-offset-1" ><h4 class="martop" >课程代号</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程代号" class="form-control" id="courseNum" name="name"> -->
                        <div class="field_text wid" >
                            <input type="text" name="tcoursenum" id="tcoursenum"placeholder="请输入课程代号"  value="${task.tcoursenum}">
                        </div>
                    </div>
                </div>

                <div class="form-group " >
                    <label for="extra" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">任务描述</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <div class="field_text field_textarea">
                               <textarea   placeholder="作业描述"  name="tcoursedesc">${task.tcoursedesc}</textarea>
                        </div>
                    </div>
                </div>
				
                <div class="form-group" >
                    <label for="peopleNum" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">总人数</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <div class="field_text field_textarea">
                            <input type="text" placeholder="40" min="1" max="50" class="form-control bgtrans" id="peopleNum" name="ttotalnum"  value="${task.ttotalnum}">
                        </div>
                        <!-- <input type="number" > -->
                    </div>
                </div>

                <div class="form-group" >
                    <label for="peopleNum" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">小组数目</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <div class="field_text field_textarea">
                            <input type="text" placeholder="6" min="1" max="50" class="form-control bgtrans" id="groupNum" name="tgroupnum" onblur="getLimitNum()" value="${task.tgroupnum}">
                        </div>
                        <!-- <input type="number" > -->
                    </div>
                </div>
				
                <div class="form-group" >
                    <label for="peopleNum" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">组限制人数</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <div class="field_text field_textarea">
                            <input type="text" placeholder="8" min="1" max="50" class="form-control bgtrans" id="group" name="tmaxsize" disabled="disabled" value="${task.tmaxsize }">
                        </div>
                        <!-- <input type="number" > -->
                    </div>
                </div>
                

                <div class="form-group ">
                    <div class="col-sm-10"></div>
                    <label for="date" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">上交日期</h4></label>
                    <div class="col-sm-8 martop padleft">
                        <div class="field_text field_textarea">
                            <input size="16" type="text" value="2012-06-15 14:45" class="form_datetime" name="tcompletedate" value="${task.tcompletedate}">
                        </div>
                    </div>
                    
                </div>
                <script src="<%=request.getContextPath()%>/module/js/libs/bootstrap-datetimepicker.min.js"></script> 
				    <script type="text/javascript">
				
				        $(".form_datetime").datetimepicker({
				        	format: 'yyyy-mm-dd hh:ii',       
				         	autoclose: true,
				        	todayBtn: true});
				   </script> 



                <div class="form-group">
                    <div class="col-sm-6">
                    	<input type="hidden" value="${task.ID }" name="ID">
                    	<span class="btn marbot"><input type="submit" value="提交" /></span>
                    </div>
                </div>

            </form>
           </div>
            <!-- form -->
        </div>
    </div>

   <!--  <div class="col-sm-8">
        

    </div> -->
</div>
<!--/ row level 2 -->
</div>

<%@ include file="./middle.jsp" %>

</div>
<!--/ row -->

<!-- row -->




</div>
<!-- footer -->
<%@include file="./footer.jsp" %>