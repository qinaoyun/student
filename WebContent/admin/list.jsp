<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body class="easyui-layout">
<%-- <c:set var="flag" value="${flag}" scope="application"/> --%>
	<script>
	function GetRequest() {
		var url = location.search; //获取url中"?"符后的字串
		var theRequest = new Object();
		if (url.indexOf("?") != -1) {
		var str = url.substr(1);
		strs = str.split("&");
		for(var i = 0; i < strs.length; i ++) {
		theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
		}
		}
		return theRequest;
		} 
	var Request = new Object();
	Request = GetRequest();
	var aa;
	aa = Request["F"];
	
	var head= document.getElementsByTagName('head')[0];
	var script= document.createElement('script');
	script.type= 'text/javascript';
	script.src= 'js/'+aa+'list.js';
	head.appendChild(script); 
 	</script>

<div data-options="region:'center'">
  <table id="dgList" >
  </table>
  	<div id="add" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
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
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add').dialog('close')"
            iconcls="icon-cancel">取消</a>
    </div>
</div>

</body>
</html>