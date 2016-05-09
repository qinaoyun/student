$(function(){
  $('#dgList').datagrid({
        url: '../listwork.do?T=worknotice&_r='+Math.random(),
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
                   { field: 'wname', title: '作业名称', width: 40, hidden: false },
       	    	{ field: 'wcoursename', title: '课程名称', width: 40 },
       	    	{ field: 'wcoursedesc', title: '作业描述信息', width: 50 },
       			{ field: 'wclass', title: '发布人所在班级', width: 40 },
       			{ field: 'wreleasename', title: '发布人姓名', width: 40 },		
//       			{ field: 'sclass', title: '', width: 40 },
       			{ field: 'wcollege', title: ' 发布人所在学院', width: 40 },	
       			{ field: 'wcoursenum', title: '课程代码', width: 60 },	
       			{ field: 'wtotalnum', title: '上交总人数', width: 40 },	
       			{ field: 'wreleasesno', title: '发布人学号', width: 40 },	
       			{ field: 'wcourseteacher', title: '任课老师', width: 40 },	
       			{ field: 'wmodifydate', title: '修改日期', width: 60,formatter:function(value,row,index){  
                       var unixTimestamp = new Date(value);  
                       return unixTimestamp.toLocaleString();  
                       }},
       			{ field: 'wreleasedate', title: '发布日期', width: 60,formatter:function(value,row,index){  
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
        url: "../viewwork.do?id="+data[0].id+"&S=worknotice",
        success: function(msg){
        	
        	for ( var i = 0; i < msg.length; i++) {
//        		alert("adsfa"+msg[i].id);
        		$("input[name='ID']").val(msg[i].id);
        		$("input[name='wname']").val(msg[i].wname);
    	    	$("input[name='wcoursename']").val(msg[i].wcoursename);
    	    	$("input[name='wcoursedesc']").val(msg[i].wcoursedesc);
//    	    	$("input[name='teacontact']").val(msg[i].teacontact);
    	    	$("input[name='wclass']").val(msg[i].wclass);
    	    	$("input[name='wreleasename']").val(msg[i].wreleasename);
    	    	$("input[name='wcollege']").val(msg[i].wcollege);
    	    	$("input[name='wcoursenum']").val(msg[i].wcoursenum);
    	    	$("input[name='wtotalnum']").val(msg[i].wtotalnum);
    	    	$("input[name='wreleasesno']").val(msg[i].wreleasesno);
    	    	$("input[name='wcourseteacher']").val(msg[i].wcourseteacher);
        	}
        }
	});	
}


 //删除记录回调函数，默认调用刷新记录方法，
 function deleteCallBack(){
	 $("#dgList").datagrid("reload");
 }