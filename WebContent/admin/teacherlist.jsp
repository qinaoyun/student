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
<script type="text/javascript" src="js/teacherlist.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
  <table id="dgList" >
  </table>
  <div id="add" title="添加任课老师信息" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
       closed="true" data-options="iconCls: 'icon-add',buttons: '#dlg-buttons'">
       <form id="fm" method="post">
       <table id="tblAdd1" class="view">
       	<tr>
       		<th><label>工号：</label></th>
       		<td><input name="teano" class="easyui-validatebox" required="true" /></td>
       	</tr>
       	<tr>
       		<th><label>姓名：</label></th>
       		<td><input name="teaname" class="easyui-validatebox" required="true" /></td>
       	</tr>
       	<tr>
       		<th><label>密码:</label></th>
       		<td><input id="passwd" name="teapasswd" type="password" class="easyui-validatebox" required="true" /></td>
       	</tr>
       	<tr>
       		<th><label>确认密码:</label></th>
       		<td><input id="passwd1" name="teapasswd1" type="password" class="easyui-validatebox" required="true" onChange="check();" /></td>
       	</tr>
       	<tr>
       		<th><label>Email：</label></th>
       		<td><input name="teaemail" type="email" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>联系方式：</label></th>
       		<td><input name="teacontact" class="easyui-vlidatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>学院：</label></th>
       		<td><input name="teacollege" class="easyui-vlidatebox" /></td>
       	</tr>
       </table>
<!--        <input type="hidden" name="ID" /> -->
       </form>
  </div>
  <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveData();" iconcls="icon-save">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add').dialog('close')"
            iconcls="icon-cancel">取消</a>
    </div>
  <div id="edit" title="修改" class="easyui-dialog" style="width:680px;height:400px;padding:10px 20px"
            closed="true" resizable="true" modal="true" data-options="iconCls: 'icon-edit'">
            <div id="tabView" class="easyui-tabs" >
                <div title="基本信息" data-options="iconCls:'icon-view'"  style="padding:5px 5px">
                  <form id="fm" method="post">
				       <table id="tblAdd1" class="view">
				       	<tr>
				       		<th><label>工号：</label></th>
				       		<td><input id="teano" name="teano" class="easyui-validatebox" /></td>
				       	</tr>
				       	<tr>
				       		<th><label>姓名：</label></th>
				       		<td><input id="teaname" name="teaname" class="easyui-validatebox" /></td>
				       	</tr>
				       	<tr>
				       		<th><label>Email：</label></th>
				       		<td><input id="teaemail" name="teaemail" type="email" class="easyui-validatebox" /></td>
				       	</tr>
				       	<tr>
				       		<th><label>联系方式：</label></th>
				       		<td><input id="teacontact" type="text" name="teacontact" class="easyui-vlidatebox" /></td>
				       	</tr>
				       	<tr>
				       		<th><label>学院：</label></th>
				       		<td><input id="teacollege" name="teacollege" class="easyui-vlidatebox" /></td>
				       	</tr>
				       </table>
				       <input type="hidden" name="ID" />
				       <a href="javascript:void(0)" class="easyui-linkbutton" onclick="editData()" iconcls="icon-save">保存</a>
        			   <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#edit').dialog('close')"
            			iconcls="icon-cancel">取消</a>
				   </form>
                </div>
                <div title="修改密码" data-options="iconCls:'icon-passwd'"  style="padding:5px 5px">
                <form id="fm" method="post">
                    <table>
                        <tr>
                            <td>                    
                                <table id="tblAdd1" class="view">
                                    <tr> 
                                        <th>
                                            <label for="ProvinceName">输入当前密码：</label>
                                        </th>
                                        <td colspan="3">
                                            <input class="easyui-validatebox" type="password" id="ProvinceName" name="passwdold" style="width:280px;"  />
                                        </td>
 
                                    </tr>
                                    <tr> 
                                        <th>
                                            <label for="ProvinceName">输入新密码：</label>
                                        </th>
                                        <td colspan="3">
                                            <input class="easyui-validatebox" type="password" id="ProvinceName" name="passwdnew" style="width:280px;"  />
                                        </td>
 
                                    </tr>
                                    <tr> 
                                        <th>
                                            <label for="ProvinceName">确认新密码：</label>
                                        </th>
                                        <td colspan="3">
                                            <input class="easyui-validatebox" type="password" id="ProvinceName" name="passwdnewcon" style="width:280px;"  />
                                        </td>
                                    </tr>
                                 </table>
                            </td>
                        </tr>
                    </table>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a>
        			   <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#edit').dialog('close')"
            			iconcls="icon-cancel">取消</a>
            	</form>
                </div>
            </div>
<!--             <div style="text-align:right; padding-top:10px"> -->
                
    </div>
    
    <div id="view" title="查看任课老师信息" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
       closed="true" data-options="iconCls: 'icon-view',buttons: '#dlg-buttons2'">
       <form id="fm" method="post">
       <table id="tblAdd1" class="view">
       	<tr>
       		<th><label>工号：</label></th>
       		<td><input name="teano" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>姓名：</label></th>
       		<td><input name="teaname" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>Email：</label></th>
       		<td><input name="teaemail" type="email" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>联系方式：</label></th>
       		<td><input name="teacontact" class="easyui-vlidatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>学院：</label></th>
       		<td><input name="teacollege" class="easyui-vlidatebox" /></td>
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