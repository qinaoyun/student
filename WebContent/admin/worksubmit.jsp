<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户列表</title>
<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css"/>
<script type="text/javascript" src="../js/adminjs/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/worksubmitlist.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
  <table id="dgList" >
  </table>
    <div id="view" title="查看作业上交信息" class="easyui-dialog" style="width: 400px; height: 360px; padding: 10px 20px;overflow:hidden;"
       closed="true" data-options="iconCls: 'icon-view',buttons: '#dlg-buttons2'">
       <form id="fm" method="post">
       <table id="tblAdd1" class="view">
       	<tr>
       		<th><label>作业名称：</label></th>
       		<td><input name="wsname" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>上交作业学生姓名：</label></th>
       		<td><input name="wssname" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>课程代码：</label></th>
       		<td><input name="wscoursenum" type="email" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>上交作业学生学号：</label></th>
       		<td><input name="wsno" class="easyui-vlidatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>上交学生所在班级：</label></th>
       		<td><input name="wsclass" class="easyui-vlidatebox" /></td>
       	</tr>
       		<tr>
       		<th><label>上交学生所在学院：</label></th>
       		<td><input name="wscollege" class="easyui-vlidatebox" /></td>
       	</tr>
       		<tr>
       		<th><label>作业上交路径：</label></th>
       		<td><input name="wsfilepath" class="easyui-vlidatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>任课老师：</label></th>
       		<td><input name="wsteachersno" class="easyui-vlidatebox" /></td>
       	</tr>
       		<tr>
       		<th><label>得分情况：</label></th>
       		<td><input name="wsscore" class="easyui-vlidatebox" /></td>
       	</tr>
       		<tr>
       		<th><label>作业通知表中的ID：</label></th>
       		<td><input name="wsworkid" class="easyui-vlidatebox" /></td>
       	</tr>
       </table>
       </form>
  </div>
  <div id="dlg-buttons2">
<!--         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveDate();" iconcls="icon-save">保存</a> -->
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#view').dialog('close')"
            iconcls="icon-cancel">取消</a>
    </div>
</div>

</body>
</html>