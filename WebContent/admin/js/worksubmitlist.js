$(function(){
  $('#dgList').datagrid({
        url: '../listwork.do?T=worksubmit&_r='+Math.random(),
        fit: true,
        fitColumns: true,
        nowrap:true,
        idField: 'id',
        loadMsg: '正在加载系统功能...',
        pagination: true,
        singleSelect: true, 
        pageSize: 10,
        pageNumber: 1,
        checkOnSelect:true,
        pageList: [1,10, 20, 30],
        rownumbers: true,
        queryParams: '',//表格初始化往后台发送异步请求后台的json数据时候额外发送的请求参数。
        columns: [[
       		    { field: 'ck', checkbox: true, align: 'left', width: 50 },
       	    	{ field: 'id', title: '文件ID', width: 40, hidden: true },
                   { field: 'wsname', title: '作业名称', width: 40, hidden: false },
       	    	{ field: 'wssname', title: '上交作业学生姓名', width: 40 },
       	    	{ field: 'wscoursenum', title: '课程代码', width: 50 },
       			{ field: 'wsno', title: '上交作业学生学号', width: 40 },
       			{ field: 'wsclass', title: '上交学生所在班级', width: 40 },		
//       			{ field: 'sclass', title: '', width: 40 },
       			{ field: 'wscollege', title: ' 上交学生所在学院', width: 40 },	
       			{ field: 'wsfilepath', title: '作业上交路径', width: 60 },	
       			{ field: 'wsteachersno', title: '任课老师', width: 40 },	
       			{ field: 'wsscore', title: '得分情况', width: 40 },	
       			{ field: 'wsworkid', title: '作业通知表中的ID', width: 40 },	
       			{ field: 'wsuploaddate', title: '上交作业日期', width: 60,formatter:function(value,row,index){  
                       var unixTimestamp = new Date(value);  
                       return unixTimestamp.toLocaleString();  
                       }},
       			{ field: 'wsmodifydate', title: '作业修改日期', width: 60,formatter:function(value,row,index){  
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
  
});
function viewData(){
	var data = $('#dgList').datagrid("getSelections");
	$.ajax({
        type: "GET",
        dataType:'json',
        url: "../viewwork.do?id="+data[0].id+"&S=worksubmit",
        success: function(msg){
        	
        	for ( var i = 0; i < msg.length; i++) {
//        		alert("adsfa"+msg[i].id);
        		$("input[name='ID']").val(msg[i].id);
        		$("input[name='wsname']").val(msg[i].wsname);
    	    	$("input[name='wssname']").val(msg[i].wssname);
    	    	$("input[name='wscoursenum']").val(msg[i].wscoursenum);
//    	    	$("input[name='teacontact']").val(msg[i].teacontact);
    	    	$("input[name='wsno']").val(msg[i].wsno);
    	    	$("input[name='wsclass']").val(msg[i].wsclass);
    	    	$("input[name='wscollege']").val(msg[i].wscollege);
    	    	$("input[name='wsfilepath']").val(msg[i].wsfilepath);
    	    	$("input[name='wsteachersno']").val(msg[i].wsteachersno);
    	    	$("input[name='wsscore']").val(msg[i].wsscore);
    	    	$("input[name='wsworkid']").val(msg[i].wsworkid);
        	}
        }
	});	
}


 //删除记录回调函数，默认调用刷新记录方法，
 function deleteCallBack(){
	 $("#dgList").datagrid("reload");
 }