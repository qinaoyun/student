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
<script type="text/javascript" src="js/stulist.js"></script>
<script type="text/javascript" src="js/queryselect.js"></script>

</head>
<body class="easyui-layout">
<div data-options="region:'center'">
  <table id="dgList" >
  </table>
  <div id="add" title="添加普通学生信息" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
       closed="true" data-options="iconCls: 'icon-add',buttons: '#dlg-buttons'">
       <form id="fm" method="post">
       <table id="tblAdd1" class="view">
       <input type="hidden" value="${user.status}${teacher.teastatus}" id="hidstatus">
       <tr>
       		<th><label>姓名：</label></th>
       		<td><input name="sname" class="easyui-validatebox" required="true" /></td>
       	</tr>
       	<tr>
       		<th><label>学号：</label></th>
       		<td><input name="sno" class="easyui-validatebox" required="true" /></td>
       	</tr>
       	<tr>
       		<th><label>密码:</label></th>
       		<td><input id="spasswd" name="spasswd" type="password" class="easyui-validatebox" required="true" /></td>
       	</tr>
       		<tr>
       		<th><label>确认密码:</label></th>
       		<td><input id="spasswd1" name="spasswd1" type="password" class="easyui-validatebox" required="true" onChange="check();" /></td>
       	</tr>
       		
     <tr>
                    <th><label>请选择学院：</label></th>
                    <td><select name="scollege" id="scollegee"class="easyui-vlidatebox" >
                    </select></td>
                </tr>
       		<tr>
                    <th><label>请选择班级：</label></th>
                    <td><select name="sclass"id="sclasss"class="easyui-vlidatebox" >
                               </select></td>
                </tr>
       	
       	   <script>
       	$("#scollegee").blur(function(){
    
   $.post("<%=request.getContextPath() %>/adminqueryclass.do",{
    		    collegeinfo : $("#scollegee").val(),
    		    			data:"test"	
    		    		},
    		    		function(data,status){
    		    			var result = data; 
    		    			$("#sclasss").empty();
    		    			for ( var i = 0; i < result.length; i++) {
    		    				$("#sclasss").append("<option value='"+result[i].classinfo+"'>"+result[i].classinfo+"</option>");  //添加一项option
    		    			} 		
    		    		},"json");
    	});
       	   </script>    
       	
       	       	<tr>
       	     <th><label>性别：</label></th>
       	      <td><input name="ssex" type="radio" id="sex-1" value="1" class="easyui-validatebox"
                               data-message="请选择一个性别" data-easytip="class:easy-blue;"><label class="radio-label" for="sex-1">男</label>
                        <input name="ssex" type="radio" id="sex-2" value="0" class="easyui-validatebox">
                        <label class="radio-label" for="sex-2">女</label>
                        </td>
       	</tr>
       
       	<tr>
       		<th><label>邮箱：</label></th>
       		<td><input name="semail"  type="email" class="easyui-validatebox"  required="true" /></td>
       	</tr>
       	<tr>
       		<th><label>联系方式：</label></th>
       		<td><input name="scontact"  class="easyui-vlidatebox"  required="true" /></td>
       	</tr>
       
       	<tr>
       		<th><label>个性签名：</label></th>
       		<td><input name="sdesc" class="easyui-vlidatebox" required="true" /></td>
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
 <div id="view" title="查看普通信息" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
       closed="true" data-options="iconCls: 'icon-view',buttons: '#dlg-buttons2'">
       <form id="fm" method="post">
       <table id="tblAdd1" class="view">
		   <tr>
       		<th><label>姓名：</label></th>
       		<td><input name="sname" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>学号：</label></th>
       		<td><input name="sno" class="easyui-validatebox" /></td>
       	</tr>
       	
       		
       	<tr>
       		<th><label>学院：</label></th>
       		<td><input name="scollege" class="easyui-vlidatebox" /></td>
       	</tr>
       <tr>
       		<th><label>班级：</label></th>
       		<td><input name="sclass" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>邮箱：</label></th>
       		<td><input name="semail" type="email" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>联系方式：</label></th>
       		<td><input name="scontact" class="easyui-vlidatebox" /></td>
       	</tr>
       
       	<tr>
       		<th><label>个性签名：</label></th>
       		<td><input name="sdesc" class="easyui-vlidatebox" /></td>
       	</tr>
				       </table>
				       <input type="hidden" name="ID" />
				      
        			   <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#view').dialog('close')"
            			iconcls="icon-cancel">取消</a>
				   </form>
                </div>
            </div>
<!--             <div style="text-align:right; padding-top:10px"> -->
                
    </div>
  <div id="edit" title="修改" class="easyui-dialog" style="width:680px;height:400px;padding:10px 20px"
            closed="true" resizable="true" modal="true" data-options="iconCls: 'icon-edit'">
            <div id="tabView" class="easyui-tabs" >
                <div title="基本信息" data-options="iconCls:'icon-view'"  style="padding:5px 5px">
                  <form id="fm" method="post">
				       <table id="tblAdd1" class="view">
				       <tr>
       		<th><label>姓名：</label></th>
       		<td><input name="sname" id="sname"class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>学号：</label></th>
       		<td><input name="sno" id="sno" class="easyui-validatebox" /></td>
       	</tr>
       		 	  <tr>
                    <th><label>请选择学院：</label></th>
                    <td><select name="scollege" id="scollege"class="easyui-vlidatebox" >
                    </select>
</td>
                </tr>
       	<tr>
                    <th><label>请选择班级：</label></th>
                    <td><select name="sclass"id="sclass"class="easyui-vlidatebox" >
                               </select></td>
                </tr>
       	
       	   <script>
       	$("#scollege").blur(function(){

   $.post("<%=request.getContextPath() %>/adminqueryclass.do",{
    		    collegeinfo : $("#scollege").val(),
    		    			data:"test"	
    		    		},
    		    		function(data,status){
    		    			var result = data; 
    		    			$("#sclass").empty();
    		    			for ( var i = 0; i < result.length; i++) {
    		    				$("#sclass").append("<option value='"+result[i].classinfo+"'>"+result[i].classinfo+"</option>");  //添加一项option
    		    			} 		
    		    		},"json");
    	});
       	   </script>    
       
       	          
       	<tr>
       		<th><label>邮箱：</label></th>
       		<td><input name="semail" id="semail" type="email" class="easyui-validatebox" /></td>
       	</tr>
       	<tr>
       		<th><label>联系方式：</label></th>
       		<td><input name="scontact" id="scontact" class="easyui-vlidatebox"  /></td>
       	</tr>
       
       	<tr>
       		<th><label>个性签名：</label></th>
       		<td><input name="sdesc" id="sdesc" class="easyui-vlidatebox" /></td>
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
</body>
</html>