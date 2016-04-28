<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hello World</title>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>  
   <form action="../applyadd.do" method="post" enctype="multipart/form-data">
   <table style="border:1px solid blue">
   <tr>
   <th>所属目录</th>
   <td>
   <select name="navigation">
      <option value="科技项目类">科技项目类</option>
      <option value="科技资质类">科技资质类</option>
      <option value="平台载体类">平台载体类</option>
      <option value="人才扶持类">人才扶持类</option>
   </select>
   <td>
   </tr>
   <tr>
   <th>新闻标题</th>
   <td><input type="text" name="title"/></td>
   </tr>
   <tr>
   <th>新闻图片</th>
   <td><input type="file" name="pic"/></td>
   </tr>
   <tr>
   <th>新闻内容</th>
  <td>
  <textarea id="editor" name="content" style="width:960px;height:300px;"></textarea>
   <script type="text/javascript">
    UE.getEditor('editor');
   </script>
  </td>
  </tr>
  <tr>
  <th>设置</th>
   <td>
	<input type="checkbox" name="isVisible" value="true" checked="checked" />显示
	</td>
	</tr>
	</table>
	<input type="submit" class="formButton" value="确  定" />&nbsp;&nbsp;
	<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" />
	
	
   </form>
</body>
</html>