<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生修改</title>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
   <c:forEach items="${obj}" var="obj">
   
   <form action="./stuupdate.do?F=${flag }" method="post">
   <input type="hidden" name="ID" value="${obj.ID}" /> 
   <table style="border:1px solid blue">
   <tr height="50px">
   <th>姓名</th>
   <td>
     <input type="text" name="sname" value="${obj.sname}"/>
   <td>
   </tr>
   <tr>
   <th>学号</th>
   <td><input type="text" name="sno" value="${obj.sno}"/></td>
   </tr>
   <tr>
   <tr>
   <th>身份</th>
   <td>
<%--    <input type="text" name="status" value="${obj.status}"/> --%>
    <select name="status">   
        <option value="0" <c:if test="${obj.status==0}">selected</c:if>>普通学生</option>   
        <option value="1" <c:if test="${obj.status==1}">selected</c:if>>学习委员</option>   
        <option value="2" <c:if test="${obj.status==2}">selected</c:if>>班长</option>               
      </select>   
<%-- 	   <form:select path="${obj.status}">   --%>
<!-- 	           <option>请选择人员</option>  -->
<%-- 	           <form:option value="0">普通学生</form:option> --%>
<%-- 			   <form:option value="1">学习委员</form:option> --%>
<%-- 			   <form:option value="2">班长</form:option>   --%>
<%-- 	        </form:select><br/> --%>
   </td>
   </tr>
   <tr>
   <th>Email</th>
   <td>
   <input type="email" name="semail" value="${obj.semail}"/>   
   </td>
   </tr>
   <tr>
   <th>联系方式</th>
  <td>
    <input type="text" name="scontact" value="${obj.scontact}"/> 
  </td>
  </tr>
  <tr>
  <th>学院</th>
   <td>
	<input type="text" name="scollege" value="${obj.scollege}" />
	</td>
	</tr>
	<tr>
  <th>班级</th>
   <td>
	<input type="text" name="sclass" value="${obj.sclass}" />
	</td>
	</tr>
	<tr>
  <th>个性签名</th>
   <td>
	<input type="text" name="sdesc" value="${obj.sdesc}" />
	</td>
	</tr>
	</table>
	<input type="submit" class="formButton" value="确  定" />&nbsp;&nbsp;
	<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" />
	
	
   </form>
   </c:forEach>
 
</body>
</html>