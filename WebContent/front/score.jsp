<%@ page language="java"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 	导入库文件 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/libs/jquery-1.10.0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/libs/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/jquery.customInput.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/libs/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/module/js/general.js"></script>

<script src="<%=request.getContextPath()%>jquery-1.9.1/jquery-1.8.3.min.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/exporting.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.hbar.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.common.core.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.line.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.common.tooltips.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.pie.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.bar.js"></script>

<link href="<%=request.getContextPath()%>/module/css/bootstrap.css" rel="stylesheet" media="screen">
<link href="<%=request.getContextPath()%>/module/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
	
	<title>个人信息</title>
</head>
<body onload="window_onload()">
    <div class="container container-wide">

<!-- content -->
<div class="content " role="main">
<!-- row -->
<div class="row">
<div class="col-sm-12" >
	<div id="topmenu">
    <ul class="dropdown clearfix boxed floatle">
        <li>
            <a href="<%=request.getContextPath()%>/tasknoticeMain.do">
                <i class="icon-menu"></i>
                <span>主页</span>
                <sup class="note">3</sup>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/front/worknotice.jsp">
                <i class="icon-menu icon-menu2"></i>
                <span>发布作业</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/front/tasknotice.jsp">
                <i class="icon-menu icon-menu3"></i>
                <span>发布分组</span>
            </a>
            <ul>
                <li><a href="#">test1</a></li>
                <li><a href="#">test2</a></li>
                <li><a href="#">test3</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class="icon-menu icon-menu4"></i>
                <span>设置</span>
            </a>
        </li>
    </ul>
</div>
<!-- <div  class="col-sm-12" style="text-align:center;"> -->
<tr>z
                    <td ><h3>请选择要查询的作业</h3></td>
                    <td><select name="sscore" id="sscore">
                   <c:forEach var="wscore"  items="${obj}">
                      <option value="${wscore}" id="sscoreid">${wscore}</option>
                 
                      </c:forEach>
                    </select>
                     </td>
                </tr>
                <input id='query' type=button value="查询成绩" >
<!--   </div> -->
<!--  根据作业名称查询数据    -->
<script type="text/javascript">
   function window_onload(){
      var score=new Array();  
    $("#query").click(function(){
            	alert($("#sscore").val());
            	var score=new Array();
            	var score1=new Array();
            	var score2=new Array();
            	var color=new Array;
            	var count1=0;
            	var count2=0;
            	var count3=0;
            	var count4=0;            	
            	var count5=0;
            	var count6=0;
            	var count=new Array();
            	color[0]='red';
            	color[1]='green';
            	color[2]='blue';
        		$.post("<%=request.getContextPath() %>/querysscore.do",{
        			wscorename : $("#sscore").val(),
        			data:"test"
        		
        		},
        		function(data,status){
        			var result = data; 
        			$("#1").empty();
        			for ( var i = 0; i < result.length; i++) {
                 score1.push(result[i].wsscore);
                 score.push(result[i].wsscore);
                 count1=count1+1;
                 //分析饼状图
                 if(result[i].wsscore>=90) count2=count2+1;
                 else if(result[i].wsscore>=80&&result[i].wsscore<90) count3=count3+1;
                 else if(result[i].wsscore>=70&&result[i].wsscore<80) count4=count4+1;
                 else if(result[i].wsscore>=60&&result[i].wsscore<70) count5=count5+1;
                 else count6=count6+1;
        			} 	
//         			chart.series[0].setData(score);  
//         			alert((Math.round((count5/count1*10000)/100).toFixed(2)+'%'));
        			for ( var i = 0; i <count1; i++) {
        		                 count.push(i+1);
        		      } 		
        			
//折线图
                  
                    var myGraph = new RGraph.Line('myCanvas',score);
         //           alert(score);
                    //设置背景颜色
//        	          myGraph.Set('chart.backdrop',white); 
          		  myGraph.Set('chart.background.grid', false);
          		    //指定标签文字的绘制空间
          		    myGraph.Set('chart.gutter', 60); 
          		  myGraph.Set('chart.colors', ['white']);
          		  myGraph.Set('chart.linewidth', 5);
          	        //指定在折线连接点处绘制说明销售数量的文字
         		     myGraph.Set('chart.labels.above', true); 
          	         myGraph.Set('chart.ylabels', true);
//           	       myGraph.Set('chart.labels', true);
          	     
//           	       myGraph.Set('chart.key',score);
          	       //指定X轴文字
                    myGraph.Set('chart.labels',count);
          	       //指定Y轴标题
                   myGraph.Set('chart.title.yaxis','分数'); 
               //  指定折线图标题
                  myGraph.Set('chart.title',$("#sscore").val()+"分数折线图分析"); 
          	        
          	    myGraph.Set('labels',score);
          		    //绘制折线图   
          		    myGraph.Draw();
          		    //注册控件
          		    RGraph.Register(myGraph);
          		    //书写鼠标在折线图上移动时的函数
          		    myGraph.canvas.onmousemove = function (e)
          		    {
          		        //注册事件
          		        RGraph.FixEventObject(e);

          		        var canvas  = e.target;//获得绘制折线图的canvas元素
          		        var context = canvas.getContext('2d');//获得绘制折线图的canvas元素的图形上下文对象
          		        var obj     = e.target.__object__;//获得事件对象
          		      
          		        // 使用getPoint方法来得到取得光标焦点的连接点
          		        var point = obj.getPoint(e);
          		        
          		      
          		        if (point) //如果存在取得光标焦点的连接点
          		        {            
          		            canvas.style.cursor = 'pointer';//改变鼠标指针为手指形状
          		            
          		            //如果工具条提示已经被显示
          		            if (RGraph.Registry.Get('chart.tooltip')
          		            && RGraph.Registry.Get('chart.tooltip').__index__ == point[3]) {
          		                return;
          		            }

          		            //重绘折线图
          		            RGraph.Redraw();

          		            //显示工具条提示
          		            RGraph.Tooltip(canvas, obj.Get('labels')[point[3]], e.pageX, e.pageY, 
          		            point[3]);

          		            //突出显示连接点
          		            context.fillStyle = 'blue';//使用蓝色填充
          		            context.beginPath();//开始创建路径
          		            context.moveTo(point[1], point[2]);//绘制起点移动到连接点上
          		            context.arc(point[1], point[2], 4, 0, 6.26, 0);//创建圆形路径
          		            context.fill();//填充圆圈
          		            
          		            return;
          		        }        
          		        canvas.style.cursor = 'default';//恢复默认鼠标指针
          		    }
          		    window.onclick = function ()
          		    {
          		        RGraph.Redraw();
          		    }
          		    
					//          	     myGraph1 = new RGraph.Bar('myCanvas1',[1200,1300,1400,1500,3000,1900,2000,2100,
					//                  2500]);
					
					myGraph1 = new RGraph.Bar('myCanvas1',score1);
					
					
					myGraph1.Set('chart.key',score);
					//指定统计图标题
					myGraph1.Set('chart.title',$("#sscore").val());
					//指定X轴标题
					//myGraph1.Set('chart.title.xaxis','销售月份');
					//指定Y轴标题
					myGraph1.Set('chart.title.yaxis','分数');
					//指定X轴的坐标轴文字
					myGraph1.Set('chart.labels',count);
					//指定Y轴的坐标轴文字
					//   myGraph1.Set('chart.ylabels.specific',['3000','2500','2000','1500','1000','500']);
					myGraph1.Set('chart.ylabels', true);
					//
					
					//指定在坐标轴顶部绘制说明销售数量的文字
					myGraph1.Set('chart.labels.above', true);
					//不显示背景网格
					myGraph1.Set('chart.background.grid', false);
					//指定网格自动与坐标轴单位对齐    
					myGraph1.Set('chart.background.grid.autofit', true);
					myGraph1.Set('chart.background.grid.autofit.align', true);
					//指定标签文字所使用的空间尺寸
					myGraph1.Set('chart.gutter',65);
					//绘制柱状图
					myGraph1.Draw(); 
					//注册控件
					RGraph.Register(myGraph1);
					
					var i=0;//填充时使用颜色的颜色序号
					myGraph1.canvas.onclick = function (e)
					{
					RGraph.Redraw();//重绘统计图
					
					var canvas  = e.target;//获取被点击的canvas元素
					var context = canvas.getContext('2d');//获取该canvas元素的图形上下文对象
					var obj     = canvas.__object__;//获取统计图对象
					var coords  = obj.getBar(e);//获取被点击的柱子信息
					
					if (coords) {
					var top    = coords[1];//获取被点击柱子的X轴上的坐标起点
					var left   = coords[2];//获取被点击柱子的Y轴上的坐标起点
					var width  = coords[3];//获取被点击柱子的宽度
					var height = coords[4];//获取被点击柱子的高度
					
					context.beginPath();//开始创建路径
					context.strokeStyle = 'black';//指定柱子的边框颜色
					context.fillStyle =color[i%3];//指定柱子的填充颜色
					i+=1;//指定下次使用颜色的颜色编号
					context.strokeRect(top, left, width, height);//绘制柱子边框
					context.fillRect(top, left, width, height);//填充柱子
					}
					}

    //绘制饼图  
    //绘制饼图，获取饼图数据
    var pie=new RGraph.Pie('myCanvas2',[count2,count3,count4,count5,count6]);
  
//     alert(score);
     //制定饼图图例
     pie.Set('chart.key', ['90分以上', '80分~90分', '70分~80分', '60分~70分', '60分以下']);
     //绘制饼图标题
     pie.Set('chart.title', $("#sscore").val()+"分数饼状图分析");
    //绘制饼图标签文字
//     pie.Set('chart.labels', ['90分以上', '80分~90分', '70分~80分', '60分~70分', '60分以下']);
      //设置图例背景色为白色
    pie.Set('chart.key.background', 'white'); 
    //指定饼图分隔线宽
    pie.Set('chart.linewidth', 5);
    //制定饼图图例
     pie.Set('chart.key', ['90分以上', '80分~90分', '70分~80分', '60分~70分', '60分以下']);
    //制定饼图图例的位置
     pie.Set('chart.key.position', 'graph');
    //指定饼图分隔线颜色
    pie.Set('chart.strokestyle','white');
    //指定工具条提示信息的出现效果为淡入效果
    pie.Set('chart.tooltips.effect', 'fade');
    //指定当鼠标指针在饼块上移动时出现工具条提示信息
    pie.Set('chart.tooltips.event', 'onmousemove');
    //指定工具条提示信息的文字;
//     alert((Math.round((count3/count1*10000)/100).toFixed(2)+'%'));
    pie.Set('chart.tooltips', ['90分以上'+Math.round((count2/count1*10000)/100).toFixed(2)+'%', '80分~90分'+Math.round((count3/count1*10000)/100).toFixed(2)+'%', '70分~80分'+Math.round((count4/count1*10000)/100).toFixed(2)+'%', '60分~70分'+Math.round((count5/count1*10000)/100).toFixed(2)+'%', '60分以下'+Math.round((count6/count1*10000)/100).toFixed(2)+'%']);
    //指定工具条提示信息具有3d效果
    pie.Set('chart.highlight.style', '3d');  
    //绘制饼图
    pie.Draw();
    
        		},"json");
        	});
                }
            </script>
</div>
 
<div class="container col-sm-offset-3 col-sm-4" >
<div style="width:400px;height:300px;">
           <canvas id="myCanvas" width="400"  height="300" style="cursor: default;margin-left:-50px;margin-top:-30px;">
                     [您的浏览器不支持canvas元素]
           </canvas>
</div>
</div>

<div class="container col-sm-offset-3 col-sm-4" >
<div style="width:400px;height:300px;">
 <canvas id="myCanvas1" width="400"  height="300" style="cursor: default;margin-left:-50px;margin-top:-30px;">
                     [您的浏览器不支持canvas元素]
           </canvas>
</div>
</div>

<div class="container col-sm-offset-3 col-sm-4" style="margin-top:20px;margin-bottom:20px;">
<div style="width:400px;height:300px;">
<canvas id="myCanvas2" width="400" height="300">
     [您的浏览器不支持canvas元素]
</canvas>
</div>
</div>

</div>


</div>

<!-- footer -->
<div class="row">
    <div class="col-sm-12">
        <div class="widget-container boxed" style="margin-top:-55px;">
        <h3 ><center>  Copyright&nbsp;©2016 Sunny Corporation, All Rights Reserved</center></h3>
        </div>
    </div>
    
</div>
</body>
<!-- 	css导入 -->
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<!-- js导入 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/rightContent.js"></script>
</html>