$(function(){
  $('#dgList').datagrid({
        url: '../listwork.do?T=tasksubmit&_r='+Math.random(),
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
                   { field: 'tcname', title: '任务名称', width: 40, hidden: false },
       	    	{ field: 'tccoursenum', title: '课程代码', width: 40 },
       	    	{ field: 'tcsno', title: '完成分组任务学生学号', width: 50 },
       			{ field: 'tcsname', title: '完成分组任务的学生姓名', width: 40 },
       			{ field: 'tcclass', title: '完成分组任务学生所在班级', width: 40 },		
//       			{ field: 'sclass', title: '', width: 40 },
       			{ field: 'tccollege', title: ' 完成分组任务学生所在学院', width: 40 },	
       			{ field: 'tcgroupnum', title: '组号', width: 60 },	
       			{ field: 'tcleader', title: '小组组长', width: 40 },	
       			{ field: 'tcdesc', title: '小组主题或描述信息', width: 40 },	
       			{ field: 'wsteachersno', title: '任课老师工号', width: 40 },	
       			{ field: 'wstaskid', title: '分组任务通知表中的ID', width: 40 },	
       			{ field: 'tccompletedate', title: '上交作业日期', width: 60,formatter:function(value,row,index){  
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
        url: "../viewwork.do?id="+data[0].id+"&S=tasksubmit",
        success: function(msg){
        	
        	for ( var i = 0; i < msg.length; i++) {
//        		alert("adsfa"+msg[i].id);
        		$("input[name='ID']").val(msg[i].id);
        		$("input[name='tcname']").val(msg[i].tcname);
    	    	$("input[name='tccoursenum']").val(msg[i].tccoursenum);
    	    	$("input[name='tcsno']").val(msg[i].tcsno);
//    	    	$("input[name='teacontact']").val(msg[i].teacontact);
    	    	$("input[name='tcsname']").val(msg[i].tcsname);
    	    	$("input[name='tcclass']").val(msg[i].tcclass);
    	    	$("input[name='tccollege']").val(msg[i].tccollege);
    	    	$("input[name='tcgroupnum']").val(msg[i].tcgroupnum);
    	    	$("input[name='tcleader']").val(msg[i].tcleader);
    	    	$("input[name='tcdesc']").val(msg[i].tcdesc);
    	    	$("input[name='wsteachersno']").val(msg[i].wsteachersno);
    	    	$("input[name='wstaskid']").val(msg[i].wstaskid);
        	}
        }
	});	
}


 //删除记录回调函数，默认调用刷新记录方法，
 function deleteCallBack(){
	 $("#dgList").datagrid("reload");
 }