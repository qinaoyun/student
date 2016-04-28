<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./header.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="<%=request.getContextPath()%>/module/js/libs/bootstrap-datetimepicker.min.js"></script> 
</head>
<body>
<div class="container container-wide">
		<div class="content " role="main">
			<div class="row">
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
                                    <img src="<%=request.getContextPath()%>/images/worknotice1.png" alt="" />
                                </div>
                            </div>
                            <div class="comment-text">
                                <div class="comment-author clearfix">
                                    <a href="#" class="link-author">劝学篇</a>
                                </div>
                                <div class="comment-entry">
                                   书山有路勤为径，学海无涯苦作舟。  
                                                                                                     --韩愈
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
            <form class="form-horizontial" role="form" action="<%=request.getContextPath()%>/worknoticemodify.do" method="post" >
                <c:forEach items="${worknotice}" var="worknotice">
                 <input type="hidden"name="wsworkid"value="${worknotice.ID} " />
                
                <div class="form-group" >
                    
                    <label for="homework" class="col-sm-2 col-sm-offset-1"><h4 class="firstmar">作业名</h4></label>
                    <div class="col-sm-8 padleft ">
                        <!-- <input type="text" placeholder="请输入作业名" class="form-control" id="homework" name="name"> -->
                        <div class="field_text wid" >
                            <input type="text" name="wname" id="name" value="${worknotice.wname}">
                        </div>
                    </div>
                </div>
                
                <div class="form-group" >
                    <label for="course" class="col-sm-2 col-sm-offset-1 " ><h4 class="martop">课程名</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <div class="field_text wid" >
                            <select name="wcoursename" id="wcoursename"class="form-control">                 
                    <c:forEach var="course"  items="${obj}">                                 
                                   <option value="${course.ID}" id="scourseid"<c:if test="${worknotice.wcoursename == course.ID}">selected="true"</c:if>>${course.coursename}</option>                                                                      
                     </c:forEach>
                    </select>
                        </div>
                    </div>
                </div>
 <!-- 根据学院查询所有课程 --> 
            <script type="text/javascript">
            $("#wcoursename").blur(function(){
//             	alert($("#scourse").val());
                
        		$.post("<%=request.getContextPath() %>/queryteaname.do",{
        			courseid : $("#wcoursename").val(),
        			data:"test"	
        		},
        		function(data,status){
        			var result = data; 
//         			$("#sclass").empty();
        			for ( var i = 0; i < result.length; i++) {
/*         				alert(result[0].classinfo); */       				
        				$("#wcourseteacher").val(result[i].teaname); 
        				$("#wcoursenum").val(result[i].courseno); 
        			} 		
        		},"json");
        	});
            </script>

                <div class="form-group" >
                    <label for="courseNum" class="col-sm-2 control-label col-sm-offset-1" ><h4 class="martop" >课程代号</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <!-- <input type="text" placeholder="请输入课程代号" class="form-control" id="courseNum" name="name"> -->
                        <div class="field_text wid" >
                            <input type="text" name="wcoursenum" id="wcoursenum" value="${worknotice.wcoursenum}">
                        </div>
                    </div>
                </div>

                <div class="form-group " >
                    <label for="extra" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">备注</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <div class="field_text field_textarea">
                                <textarea  name="wcoursedesc" >${worknotice.wcoursedesc}</textarea>
                        </div>
                    </div>
                </div>

                <div class="form-group" >
                    <label for="peopleNum" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">上交人数</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <div class="field_text field_textarea">
                            <input type="text" min="1" max="50" class="form-control bgtrans" id="peopleNum" name="wtotalnum" value="${worknotice.wtotalnum}">
                        </div>
                        <!-- <input type="number" > -->
                    </div>
                </div>
              
               
             

                <div class="form-group ">
                    <div class="col-sm-10"></div>
                    <label for="date" class="col-sm-2 col-sm-offset-1" ><h4 class="martop">上交日期</h4></label>
                    <div class="col-sm-8 martop padleft">
                        <div class="field_text field_textarea">
                             <input size="16" type="text" value="2012-06-15 14:45" class="form_datetime" name="wuploaddate" >
                        </div>
                    </div>
                </div>
                
				<script type="text/javascript">
				    $(".form_datetime").datetimepicker({
				       	format: 'yyyy-mm-dd hh:ii:ss',       
				        autoclose: true,
				        todayBtn: true});
				</script> 

                <div class="form-group" >
                     <div class="col-sm-10"></div>
                    <label for="course" class="col-sm-2 col-sm-offset-1 " ><h4 class="martop">任课教师</h4></label>
                    <div class="col-sm-8  martop padleft" >
                        <div class="field_text wid" >
                            <input type="text" name="wcourseteacher" id="wcourseteacher" value="${worknotice.wcourseteacher}">
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-6">
                    <span class="btn marbot"><input type="submit" value="修改" /></span>

                    </div>
                </div>


                </c:forEach>
            </form>
           </div>

        </div>
    </div>
</div>

</div>

<%@ include file="./middle.jsp" %>

</div>



</div>
<!-- footer -->
<%@include file="./footer.jsp" %>