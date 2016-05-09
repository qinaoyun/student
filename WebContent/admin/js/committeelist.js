$(function(){
   if($("#hidstatus").val()=="老师"){
  $('#dgList').datagrid({
        url: '../list.do?T=committee&_r='+Math.random(),
        fit: true,
        fitColumns: true,
        idField: 'id',
        loadMsg: '正在加载系统功能...',
        pagination: true,
        singleSelect: true, 
        pageSize: 10,
        pageNumber: 1,
        checkOnSelect:false,
        pageList: [1,10, 20, 30],
        rownumbers: true,
        queryParams: '',//表格初始化往后台发送异步请求后台的json数据时候额外发送的请求参数。
        columns: [[
		    { field: 'ck', checkbox: true, align: 'left', width: 50 },
	    	{ field: 'id', title: '文件ID', width: 40, hidden: true },
            { field: 'sname', title: '姓名', width: 40, hidden: false },
	    	{ field: 'sno', title: '学号', width: 40 },
			{ field: 'status', title: '身份', width: 40 },
			{ field: 'sclass', title: '班级', width: 40 },
			{ field: 'scollege', title: '学院', width: 40 },
//			{ field: 'sclass', title: '', width: 40 },
			{ field: 'smodifydate', title: '注册日期', width: 50,formatter:function(value,row,index){  
                var unixTimestamp = new Date(value);  
                return unixTimestamp.toLocaleString();  
                } }
			
        ]],
        toolbar: [
              	{
    			    iconCls: 'icon-add',
    			    text: '增加',
    			    handler: function () {
    			    	$("#add").form("clear");
    					$("#add").dialog("open");
    			    }
    			},
//    			'-',
//			{
//			    iconCls: 'icon-edit',
//			    text: '增加',
//			    handler: function () {
//					var rows = $('#dgList').datagrid('getSelections');
//					if (rows.length > 0) {
//					   //处理编辑
//					    if (rows[0].filetype == 'doc' || rows[0].filetype == 'docx' || rows[0].filetype == 'pdf' || rows[0].filetype == 'jpg' || rows[0].filetype == 'xls' || rows[0].filetype == 'xlsx')
//					        window.location.href="../printFile.html?fileID=" + rows[0].id + "&filetype=" + rows[0].filetype + "&fileName=" + rows[0].documentName;
//					    else
//			    	window.location.href="../admin/useradd.jsp";
//					        $.messager.alert('友情提示', rows[0].filetype + '系统暂时此类文件不支持自助打印', 'info');
//					}else{
//						$.messager.alert('友情提示','请选择需要编辑的选项!','error');
//					}
//			    }
//			},
			'-',{
			    iconCls: 'icon-remove',
			    text: '删除',
			    handler: function () {
					var rows = $('#dgList').datagrid('getSelections');
					if (rows.length > 0) {
					    //处理删除
                        if(confirm("确认要删除该文件吗？"))
                        	window.location.href="../delete.do?id="+ rows[0].id+"&F=committee";
					}else{
						$.messager.alert('友情提示','请选择需要删除的选项!','error');
					}
			    }
			},
			'-',{
			    iconCls: 'icon-edit',
			    text: '修改',
			    handler: function () {
					var rows = $('#dgList').datagrid('getSelections');
					if (rows.length > 0) {
					    //处理查看
						if (rows[0].filetype == 'doc' || rows[0].filetype == 'docx' || rows[0].filetype == 'pdf' || rows[0].filetype == 'jpg' || rows[0].filetype == 'xls' || rows[0].filetype == 'xlsx')
					        window.location.href="../printFile.html?fileID=" + rows[0].id + "&filetype=" + rows[0].filetype + "&fileName=" + rows[0].documentName;
					    else
					    	$("#edit").dialog("open");
							viewData();
//					    	window.location.href="../view.do?id="+ rows[0].id+"&S=teacher";
					}else{
						$.messager.alert('友情提示','请选择需要查看的选项!','error');
					}
			    }
			},
			'-',{
				 iconCls: 'icon-view',
				    text: '查看',
				    handler: function () {
						var rows = $('#dgList').datagrid('getSelections');
						if (rows.length > 0){
							$("#view").dialog("open");
							viewData();
						    	
						}else{
							$.messager.alert('友情提示','请选择需要查看的选项!','error');
						}
				    }
				},
			     '-',{
			    iconCls: 'icon-reload',
			    text: '刷新',
			    handler: function () {
			    	$("#dgList").datagrid("reload");
	
					
					
			    }
			}
		 ]
		
    });
   }
   else {
	   $('#dgList').datagrid({
	        url: '../list.do?T=committee&_r='+Math.random(),
	        fit: true,
	        fitColumns: true,
	        idField: 'id',
	        loadMsg: '正在加载系统功能...',
	        pagination: true,
	        singleSelect: true, 
	        pageSize: 10,
	        pageNumber: 1,
	        checkOnSelect:false,
	        pageList: [1,10, 20, 30],
	        rownumbers: true,
	        queryParams: '',//表格初始化往后台发送异步请求后台的json数据时候额外发送的请求参数。
	        columns: [[
			    { field: 'ck', checkbox: true, align: 'left', width: 50 },
		    	{ field: 'id', title: '文件ID', width: 40, hidden: true },
	            { field: 'sname', title: '姓名', width: 40, hidden: false },
		    	{ field: 'sno', title: '学号', width: 40 },
				{ field: 'status', title: '身份', width: 40 },
				{ field: 'sclass', title: '班级', width: 40 },
				{ field: 'scollege', title: '学院', width: 40 },
//				{ field: 'sclass', title: '', width: 40 },
				{ field: 'smodifydate', title: '注册日期', width: 50,formatter:function(value,row,index){  
	                var unixTimestamp = new Date(value);  
	                return unixTimestamp.toLocaleString();  
	                } }
				
	        ]],
	        toolbar: [
	              {
					 iconCls: 'icon-view',
					    text: '查看',
					    handler: function () {
							var rows = $('#dgList').datagrid('getSelections');
							if (rows.length > 0){
								$("#view").dialog("open");
								viewData();
							    	
							}else{
								$.messager.alert('友情提示','请选择需要查看的选项!','error');
							}
					    }
					},
				     '-',{
				    iconCls: 'icon-reload',
				    text: '刷新',
				    handler: function () {
				    	$("#dgList").datagrid("reload");
		
						
						
				    }
				}
			 ]
			
	    });
   }
});
function check(){
	var passwd1=$("#spasswd").val();
	var passwd2=$("#spasswd1").val();
	if(passwd1!=passwd2){
		$("#spasswd1").val("");
	}
	
}
function saveData(){	
	var validate = $("#add").form('validate');
    if (validate == false) {
        return false;
    }
    var url="../addcommittee.do";
//    var postData = $("#fm").serializeArray();
//    var teapasswd=$("#passwd").val();
//    var data = {};
//    alert("确定吗");
//    alert(postData);
//    $.each(postData, function(i, field){
//    	data[field.name] = field.value;
//      });
//    alert($("input[name='sname']").val());
//    alert($("input[name='status']").val());
    $.post(url,{
    	sname:$("input[name='sname']").val(),
    	sno:$("input[name='sno']").val(),
    	spasswd:$("input[name='spasswd']").val(),
    	sclass:$("input[name='sclass']").val(),
    	scollege:$("input[name='scollege']").val(),
    	semail:$("input[name='semail']").val(),
    	scontact:$("input[name='scontact']").val(),
    	sdesc:$("input[name='sdesc']").val(),
    	ssex:$("input[name='ssex']").val(),
    	status:$("input[name='status']").val()
    },function (msg) {
        if (msg=="yes") {
//        	alert("确定吗");
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	$.messager.alert("提示", "保存成功");
        	$('#add').dialog('close');
        	deleteCallBack();
            $("#add").form("clear");
        }
        else{
//        	alert("失败");
            showError("保存失败:" + data.ErrorMessage, 3000);
            $.messager.alert("提示", "保存失败");
        }
    },'text');
}
function viewData(){
	var data = $('#dgList').datagrid("getSelections");
	$.ajax({
        type: "GET",
        dataType:'json',
        url: "../view.do?id="+data[0].id+"&S=user",
        success: function(msg){
        	
        	for ( var i = 0; i < msg.length; i++) {
//        		alert("adsfa"+msg[i].id);
        		$("input[name='ID']").val(msg[i].id);
        		$("input[name='sname']").val(msg[i].sname);
        		$("input[name='sno']").val(msg[i].sno);
    	    	$("input[name='sclass']").val(msg[i].sclass);
    	    	$("input[name='scollege']").val(msg[i].scollege);
    	    	$("input[name='scontact']").val(msg[i].scontact);
    	    	$("input[name='semail']").val(msg[i].semail);
    	    	$("input[name='sdesc']").val(msg[i].sdesc);
        	}
        }
	});	
}
function editData(){
	var url="../stuupdate.do";
	
	 $.post(url,{
		 	id:$("input[name='ID']").val(),
		 	sname:$("#sname").val(),
	    	sno:$("#sno").val(),
	    	sclass:$("#sclass").val(),
	    	scollege:$("#scollege").val(),
	    	semail:$("#semail").val(),
	    	scontact:$("#scontact").val(),
	    	sdesc:$("#sdesc").val()
	    },function (msg) {
	        if (msg=="yes") {
	        	
	            //添加成功  1.关闭弹出层，2.刷新DataGird
	        	$.messager.alert("提示", "修改成功");
	        	$('#edit').dialog('close');
	        	deleteCallBack();
	            $("#edit").form("clear");
//	            $("#dgList").datagrid("reload");
	        }
	        else{
//	        	alert("失败");
//	            showError("保存失败:" + data.ErrorMessage, 3000);
	            $.messager.alert("提示", "修改失败");
	        }
	    },'text');
}
function deleteData(){
//	alert("adsfasdfa");
    var data = $('#dgList').datagrid("getSelections");
    //删除 
    //发送删除请求
    
    $.ajax({
        type: "GET",
        dataType:'text',
        url: "../delete.do?F=user&id="+data[0].id,
        success: function(msg){
        	if(msg=="yes"){
        		$.messager.alert("提示", "删除成功");
        		$("#dgList").datagrid("reload");
        	}
        	else{
            	 $.messager.alert("提示", "删除失败");
        	}
        }
    });
}
	         
	         
 //删除记录回调函数，默认调用刷新记录方法，
 function deleteCallBack(){
	 $("#dgList").datagrid("reload");
 }