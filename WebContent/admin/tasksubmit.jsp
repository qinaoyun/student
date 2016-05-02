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
<script type="text/javascript" src="js/tasksubmitlist.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
  <table id="dgList" >
  </table>
    <div id="view" title="查看作业发布信息" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
       closed="true" data-options="iconCls: 'icon-view',buttons: '#dlg-buttons2'">
       <form id="fm" method="post">
       <table id="tblAdd1" class="view">
       	<tr>
       		<th><label>任务名称：</label></th>
       		<td><input name="tcname" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>课程代码：</label></th>
       		<td><input name="tccoursenum" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>完成分组任务学生学号：</label></th>
       		<td><input name="tcsno" type="email" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>完成分组任务的学生姓名：</label></th>
       		<td><input name="tcsname" class="easyui-vlidatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>完成分组任务学生所在班级：</label></th>
       		<td><input name="tcclass" class="easyui-vlidatebox" /></td>
       	</tr>
       		<tr>
       		<th><label>完成分组任务学生所在学院：</label></th>
       		<td><input name="tccollege" class="easyui-vlidatebox" /></td>
       	</tr>
       		<tr>
       		<th><label>组号：</label></th>
       		<td><input name="tcgroupnum" class="easyui-vlidatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>小组组长：</label></th>
       		<td><input name="tcleader" class="easyui-vlidatebox" /></td>
       	</tr>
       		<tr>
       		<th><label>小组主题或描述信息：</label></th>
       		<td><input name="tcdesc" class="easyui-vlidatebox" /></td>
       	</tr>
       		<tr>
       		<th><label>任课老师工号：</label></th>
       		<td><input name="wsteachersno" class="easyui-vlidatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>分组任务通知表中的ID：</label></th>
       		<td><input name="wstaskid" class="easyui-vlidatebox" /></td>
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