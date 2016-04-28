$(function(){
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
			    	//window.location.href="../admin/useradd.jsp";
//					        $.messager.alert('友情提示', rows[0].filetype + '系统暂时此类文件不支持自助打印', 'info');
//					}else{
//						$.messager.alert('友情提示','请选择需要编辑的选项!','error');
//					}
			  //  }
			//},
			{
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
			{
			    iconCls: 'icon-edit',
			    text: '查看',
			    handler: function () {
					var rows = $('#dgList').datagrid('getSelections');
					if (rows.length > 0) {
					    //处理查看
						if (rows[0].filetype == 'doc' || rows[0].filetype == 'docx' || rows[0].filetype == 'pdf' || rows[0].filetype == 'jpg' || rows[0].filetype == 'xls' || rows[0].filetype == 'xlsx')
					        window.location.href="../printFile.html?fileID=" + rows[0].id + "&filetype=" + rows[0].filetype + "&fileName=" + rows[0].documentName;
					    else
					    	
					    	window.location.href="../view.do?id="+ rows[0].id+"&S=committee";
					}else{
						$.messager.alert('友情提示','请选择需要查看的选项!','error');
					}
			    }
			}
		 ]
		
    });
});