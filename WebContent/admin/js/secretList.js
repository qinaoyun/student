 $(function () {
            var dg = $('#dgList');
            var opts = dg.datagrid('options');
            var pager = dg.datagrid('getPager');
            
            pager.pagination({
                onSelectPage: function (pageNum, pageSize) {
                    opts.pageNumber = pageNum;
                    opts.pageSize = pageSize;
                    pager.pagination('refresh', {
                        pageNumber: pageNum,
                        pageSize: pageSize
                    });
                    Search();  //从数据库中获取数据，并加载                   
                },
                pagination: true,
                pageList: [10, 30, 50, 100], //可以设置每页记录条数的列表           
                beforePageText: '第', //页数文本框前显示的汉字           
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            });         
        })

       //从数据库中获取数据，并加载    

       function Search() {
            var page_Number = $('#dgList').datagrid('options').pageNumber;   //pageNumber为datagrid的当前页码
            var page_Size = $('#dgList').datagrid('options').pageSize;                 //pageSize为datagrid的每页记录条数
            var name = $('#inputName').val(); //得到查询关键字
      
            $.post('../userlist.do', { Name: name, PageNumber: page_Number, PageSize: page_Size }, function (data) {
                var data = $.parseJSON(data);
                if (data != undefined && data != null) {
                    if (data.rows != undefined && data.rows != null && data.rows.length > 0   && data.rows[0].TotalCount != undefined &&    data.rows[0].TotalCount!=null) {                  

                        data.total = Number(data.rows[0].TotalCount);
                        $('#dgList').datagrid('loadData', data);
                    }
                }
            })
        }