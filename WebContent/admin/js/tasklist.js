$(function(){
  $('#dgList').datagrid({
        url: '../listwork.do?T=tasknotice&_r='+Math.random(),
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
                   { field: 'tname', title: '任务名称', width: 40, hidden: false },
       	    	{ field: 'tcoursename', title: '课程名称', width: 40 },
       	    	{ field: 'tcoursedesc', title: '分组任务描述信息', width: 80 },
       			{ field: 'tclass', title: '发布人所在班级', width: 40 },
       			{ field: 'tcollege', title: '发布人所在学院', width: 40 },		
//       			{ field: 'sclass', title: '', width: 40 },
       			{ field: 'tcoursenum', title: ' 课程代码', width: 40 },	
       			{ field: 'ttotalnum', title: '需要分组的总人数', width: 60 },	
       			{ field: 'tgroupnum', title: '需要分组的组数', width: 40 },	
       			{ field: 'tmaxsize', title: '每组最大的人数', width: 40 },	
       			{ field: 'treleasesno', title: '发布人学号', width: 40 },	
       			{ field: 'tcourseteacher', title: '老师工号', width: 40 },
       			{ field: 'tcompletedate', title: '需要完成分组任务的日期', width: 60,formatter:function(value,row,index){  
                       var unixTimestamp = new Date(value);  
                       return unixTimestamp.toLocaleString();  
                       }},
       			{ field: 'treleasedate', title: '发布分组任务的日期', width: 60,formatter:function(value,row,index){  
                       var unixTimestamp = new Date(value);  
                       return unixTimestamp.toLocaleString();  
                       } },
                  { field: 'tmodifydate', title: '修改分组任务日期', width: 60,formatter:function(value,row,index){  
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
        url: "../viewwork.do?id="+data[0].id+"&S=tasknotice",
        success: function(msg){
        	
        	for ( var i = 0; i < msg.length; i++) {
//        		alert("adsfa"+msg[i].id);
        		$("input[name='ID']").val(msg[i].id);
        		$("input[name='tname']").val(msg[i].tname);
    	    	$("input[name='tcoursename']").val(msg[i].tcoursename);
    	    	$("input[name='tcoursedesc']").val(msg[i].tcoursedesc);
//    	    	$("input[name='teacontact']").val(msg[i].teacontact);
    	    	$("input[name='tclass']").val(msg[i].tclass);
    	    	$("input[name='tcollege']").val(msg[i].tcollege);
    	    	$("input[name='tcoursenum']").val(msg[i].tcoursenum);
    	    	$("input[name='ttotalnum']").val(msg[i].ttotalnum);
    	    	$("input[name='tgroupnum']").val(msg[i].tgroupnum);
    	    	$("input[name='tmaxsize']").val(msg[i].tmaxsize);
    	    	$("input[name='treleasesno']").val(msg[i].treleasesno);
    	    	$("input[name='tcourseteacher']").val(msg[i].tcourseteacher);
        	}
        }
	});	
}


 //删除记录回调函数，默认调用刷新记录方法，
 function deleteCallBack(){
	 $("#dgList").datagrid("reload");
 }