<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>In</title>
<link href="http://www.cnblogs.com/Resources/easyui/css/default.css" rel="stylesheet" type="text/css" />
<link href="http://www.cnblogs.com/Resources/easyui/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="http://www.cnblogs.com/Resources/easyui/js/themes/icon.css" rel="stylesheet" type="text/css" />
<script src="http://www.cnblogs.com/Resources/easyui/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="http://www.cnblogs.com/Resources/easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript">
        var url;
        var type;
        function newuser() {
            $("#dlg").dialog("open").dialog('setTitle', 'New User'); ;
            $("#fm").form("clear");
            url = "UserManage.aspx";
            document.getElementById("hidtype").value="submit";
        }
        function edituser() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                $("#dlg").dialog("open").dialog('setTitle', 'Edit User');
                $("#fm").form("load", row);
                url = "UserManage.aspx?id=" + row.ID;
            }
        }
        function saveuser() {
            $("#fm").form("submit", {
                url: url,
                onsubmit: function () {
                    return $(this).form("validate");
                },
                success: function (result) {
                    if (result == "1") {
                        $.messager.alert("提示信息", "操作成功");
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("load");
                    }
                    else {
                        $.messager.alert("提示信息", "操作失败");
                    }
                }
            });
        }
        function destroyUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('Confirm', 'Are you sure you want to destroy this user?', function (r) {
                    if (r) {
                        $.post('destroy_user.php', { id: row.id }, function (result) {
                            if (result.success) {
                                $('#dg').datagrid('reload');    // reload the user data 
                            } else {
                                $.messager.show({   // show error message 
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        } 
    </script>
</head>
<body>
<div id="dlg" class="easyui-layout" style="width: 400px; height: 280px; padding: 10px 20px;"
       closed="true" buttons="#dlg-buttons">
       <div class="ftitle">
           信息编辑
       </div>
       <form id="fm" method="post">
       <div class="fitem">
           <label>
               编号
           </label>
           <input name="AccountCode" class="easyui-validatebox" required="true" />
       </div>
       <div class="fitem">
           <label>
               卡号</label>
           <input name="AccountName" class="easyui-validatebox" required="true" />
       </div>
       <div class="fitem">
           <label>
               密码</label>
           <input name="AccountPwd" class="easyui-validatebox" required="true" />
       </div>
       <div class="fitem">
           <label>
               创建时间</label>
           <input name="CreateTime" class="easyui-datebox" required="true" />
       </div>
       <div class="fitem">
           <label>
               创建人</label>
           <input name="CreateName" class="easyui-vlidatebox" />
       </div>
       <input type="hidden" name="action" id="hidtype" />
       <input type="hidden" name="ID" id="Nameid" />
       </form>
   </div>

<div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')"
            iconcls="icon-cancel">取消</a>
    </div> 
    
    
     
</body>
</html>