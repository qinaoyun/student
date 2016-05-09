<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ include file="./header.jsp" %>
<head>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.common.core.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.line.js"></script>
<script src="<%=request.getContextPath()%>/js/RGraph/RGraph.common.tooltips.js"></script>
<script type="text/javascript">
$(function() {
	$("#diagram1").hide();
	$('#showmore').click(function(){
		$("#diagram1").show();
		$('#showmore').hide();
	})
});
</script>
<script type="text/javascript">
$(document).ready(function(){ 
if($("#diagram a").length==0)
{   $("#worknotice").html("暂时还没有作业发布");
    $("#worknotice").css("font-size",40);
}
if($("#diagramm a").length==0)
{   $("#diagramm a").html("暂时还没有作业发布");
    $("#worknotice").css("font-size",40);
   
}
});
</script>
<script>
function window_onload(){
// 	$(".ga_bk_l :odd").removeClass().addClass("ga_bk_l  right"); 
// 	<div class="panel-body">
    var score=new Array();  
		$.post("<%=request.getContextPath() %>/queryscore.do",{
		},
		function(data,status){
			var result = data; 			
			for ( var i = 0; i < result.length; i++) {
/*         				alert(result[0].classinfo); */
         score.push(result[i].wsscore);             
			} 	
// 	    alert(score);
        if(score.length>0)
        {
		var myGraph = new RGraph.Line('myCanvas',score);
		  myGraph.Set('chart.background.grid', false);
		    //指定标签文字的绘制空间
		    myGraph.Set('chart.gutter', 60); 
	        //指定在折线连接点处绘制说明销售数量的文字
//		      myGraph.Set('chart.labels.above', true); 
	        //改变折线图的颜色
	        myGraph.Set('chart.colors', ['white']);
	        //加粗折线
	        //改变折线图的粗细
	        myGraph.Set('chart.linewidth', 5);
	        //不显示Y轴
	         myGraph.Set('chart.ylabels', false);
	         //不显示坐标轴
	         myGraph.Set('chart.noaxes', true);
	         
	     //  指定折线图标题
        myGraph.Set('chart.title','成绩分析，点击进入详情'); 
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
        }
        else{
        	$("#stuscore").html("暂时还没有分数哦");
        } 
        
		},"json");
		
}

</script>

<script type="text/javascript">
$(document).ready(function(){ 
if($("#diagram a").length==0)
{   $("#worknotice").html("暂时还没有作业发布");
    $("#worknotice").css("font-size",40);
}
if($("#diagramm a").length==0)
{   $("#diagramm a").html("暂时还没有作业发布");
    $("#worknotice").css("font-size",40);
  
}
});
</script>
</head>
<body onload="window_onload()">
<div class="container container-wide">
	<div class="content " role="main">
 		<div class="row"> 

<div class="col-sm-9">
    <div class="col-sm-4" style="padding-left:0px;">
        <!-- Widget Trade -->
        <div class="widget-container widget-trade boxed">
            <div class="widget-title"id="stuscore">
                <a href="<%=request.getContextPath()%>/querywsname.do">
                <canvas id="myCanvas" width="300"  height="200" style="cursor: default; margin-left: -75px; margin-top: -30px;">
                     [您的浏览器不支持canvas元素]
           		</canvas></a>
            </div>
        </div>
        <!--/ Widget Trade -->
        <script>
				function workupload(){	
		
					var date = new Date();
					var str=$("#uploaddate").html();
					
//                          str=str.substring(4,str.length());
                     /* 去除字符串中的汉字 */
                     var reg=/[\u4E00-\u9FA5]/g;
		              var result=str.replace(reg,'');
                     /*  将string类型转化成date*/
                     var dt = new Date(result.replace(/-/g,"/"));
                     var time=dt.getTime()-date.getTime();
                                   
					$(".inner_messa").css({"width":"100%","height":"80px","box-shadow":"0px 0px 5px pink","background":"#fff","margin-top":"10px","border-radius":"10px"});
					$(".inner_messa p").css({"margin-left":"10px"});
					if(time<0){
					$(".messa").css({"box-shadow":"0px 0px 10px red,0px -10px 5px #444444"});
					     }
					else if(time>=0&&time<=86400000)
					{
						$(".messa").css("box-shadow","10px -10px 10px -5px #36e232");
					}
					else if(time>86400000&&time<=172800000)
						{
							$(".messa").css("box-shadow","10px -10px 10px -5px #36e232");
						}
					else 
					   {											
					         $(".messa").css("box-shadow","-10px -10px 10px -5px #47e4e2");
					  }

				}
			</script>
			    
			    
			    <c:forEach items="${obj}" var="list" begin="0" end="3" step="1" >
			    <div class="inner_messa" >
			    
			        <!-- place your content here -->
			       <div class="messa">
<%-- 			       <c:forEach items="${wnoticelist}" var="list" varStatus="id"> --%>
			       <p class="text-success"><h4>${list.wname}</h4></p>
<%-- 			       </c:forEach> --%>
			       <p class="text-primary"id="uploaddate">上交日期${list.wuploaddate}</p>
	              <script> workupload()</script> 
			       </div>
			    </div>
			</c:forEach>
<!-- 			  <div class="inner_messa" > -->
<!-- 			        place your content here -->
<%-- 			        <p class="text-success"><strong><h4>${wnoticelist[1].wname}</h4></p> --%>
<%-- 			       <p class="text-primary">上交日期${wnoticelist[1].wuploaddate}</p> --%>
<!-- 			    </div> -->
			    
<!-- 			    <div class="inner_messa"> -->
<!-- 			        place your content here -->
<%-- 			       <p class="text-success"><strong><h4>${wnoticelist[2].wname}</h4></p> --%>
<%-- 			      <p class="text-primary">上交日期${wnoticelist[2].wuploaddate}</p> --%>
<!-- 			    </div> -->
			    
<!-- 			    <div class="inner_messa" > -->
<!-- 			        place your content here -->
<%-- 			       <p class="text-success"><strong><h4>${wnoticelist[3].wname}</h4></p> --%>
<%-- 			      <p class="text-primary">上交日期${wnoticelist[3].wuploaddate}</p> --%>
<!-- 			    </div> -->
	      

        <!-- Widget Audio Player -->
    </div>

    <div class="col-sm-8" style="padding-right:0px;">
        <!-- Widget Stats -->
        <div class="tabs_framed styled widget-stats">
            <ul class="tabs clearfix">
                <li class="active"><a href="#diagram" data-toggle="tab" id="workpublish">作业发布</a></li>
                <li><a href="#month" data-toggle="tab" id="taskpublish">分组安排&nbsp;<sup class="note">3</sup></a></li>
            </ul>
			
<!-- 			作业发布的具体内容 -->
			<div class="workgroup"id="worknotice">
              
				<div class="tab-pane in active" id="diagram">							
							   <c:if test="${listsize>=7}">
					<p>
	                <c:forEach items="${obj}" var="list" begin="0" end="5" varStatus="id">	
							<div class="panel panel-default" style="margin-top:-17px;">
                            	<div class="panel-heading" style="height:50px">
                            	<script>
	$(function(){
		$(".panel-heading").css("background","#ffffff");
		 var $hei = $(".panel-heading").width()/8*7;
		 var $left_menu = $hei;
		 var $hei_menu = $(".panel-heading").width()/3*2;
		 var splay=false;
		 $hei_menu = $hei_menu.toString();
		 $hei_menu += "px";
		 $hei = $hei.toString();
	
		 $hei += "px";
		$(".glyphicon-cog").css({"margin-left":$hei});
		$(".glyphicon-cog").bind("click",function(event){
// 			alert($(this).parent().find('.user-menu ul').attr('class'));
			$(this).parent().find('.user-menu ul').show().animate({"margin-left":$hei_menu},300);
			splay = true;
			event.stopPropagation();
		});
		
		$("body").bind("click",function(event){
			if(splay){
				$(".user-menu ul").hide().animate({"margin-left":"0px"});
				splay = false;
			}
		});
		
		$(".closemenu").click(function(){
		
			$(this).parent().parent().parent().hide().animate({"margin-left":"0px"});
		});
	})
</script>
  		<h6 class="panel-title">
     		<a data-toggle="collapse"  data-parent="#accordion" href="#collapse${id.count }"><strong>${list.wname}</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp上交日期：${list.wuploaddate}</a>                             
				<span class="glyphicon glyphicon-cog" ></span>
				<script>
				$(function(){
					$(".user-menu .clearfix.boxed").css("width","140px");
					var $but = $(".glyphicon-cog").height();
// 					$left_menu = $hei-400;
// 					$left_menu =$left_menu.toString();
// 					$left_menu +="px"
					$(".glyphicon-cog").css({"margin-top":-$but});
					$(".user-menu ul").css({"margin-left":"0px","margin-top":-$but,"margin-bottom":"-10px"}).hide();
					$(".user-menu ul li").css({"float":"left","border-left":"1px solid #F8F3F0","padding":"5px","padding-left":"5px","width":"33.33%","text-align":"center"});
				})
				</script>
				<div class="user-menu">
				<c:choose>
							<c:when test="${frontnumber.status=='普通学生'}"> 

							</c:when>
							<c:otherwise>  
							 <ul class="clearfix boxed" >
				        <li>
				            <a href="<%=request.getContextPath()%>/workmodify.do?worknoticeid=${list.ID}">
				                <span class="glyphicon glyphicon-pencil" title="修改"></span>
				            </a>
				       
				        </li>
				        <li>
				            <a href="<%=request.getContextPath()%>/worknoticedelete.do?worknoticeid=${list.ID}">
				                <span class="glyphicon glyphicon-trash" title="删除"></span>
				            </a>
				        </li>
				        
				        <li>
				            <a href="#">
				                <span class="glyphicon glyphicon-share-alt closemenu" title="关闭"></span>
<!-- 				                </i> -->
				            </a>
				       
				        </li>
				    </ul>
                            </c:otherwise>
				</c:choose>
				   
				</div>
                             	 	</p>
                            	</div>
                            	<input type="hidden" value="${id.count}" id="tasktagg"> 
                            	<div id="collapse${id.count }" class="panel-collapse collapse">
                            	<div class="panel-body">
                               			<a href="<%=request.getContextPath()%>/workcontrol.do?worknoticeid=${list.ID}">${list.wcoursedesc}</a>
                              		    
                              		</div>
                            	</div>
                            		<c:choose>
							<c:when test="${frontnumber.status=='普通学生'}"> 
                             
							</c:when>
							<c:otherwise>  
                            	<ul class="stats-data clearfix" >
			                        <li><a href="#"><span>已交人数</span><strong>${sumworklist[id.index]}</strong></a></li>
			                        <li class="red"><a href="#"><span>未交人数</span><strong>${list.wtotalnum-sumworklist[id.index]}</strong></a></li>
			                        <li class="yellow"><a href="#"><span>总人数</span><strong>${list.wtotalnum}</strong></a></li>
							   </ul>
							  </c:otherwise>
				           </c:choose>
				           
                          	</div>                         
                    </c:forEach>
                    </c:if>
                    <c:if test="${listsize<=6}">
					<p>
	                <c:forEach items="${obj}" var="list" varStatus="id">	
							<div class="panel panel-default" style="margin-top:-17px;">
                            	<div class="panel-heading" style="height:50px">
                            	<script>
	$(function(){
		$(".panel-heading").css("background","#ffffff");
		 var $hei = $(".panel-heading").width()/8*7;
		 var $left_menu = $hei;
		 var $hei_menu = $(".panel-heading").width()/3*2;
		 var splay=false;
		 $hei_menu = $hei_menu.toString();
		 $hei_menu += "px";
		 $hei = $hei.toString();
	
		 $hei += "px";
		$(".glyphicon-cog").css({"margin-left":$hei});
		$(".glyphicon-cog").bind("click",function(event){
// 			alert($(this).parent().find('.user-menu ul').attr('class'));
			$(this).parent().find('.user-menu ul').show().animate({"margin-left":$hei_menu},300);
			splay = true;
			event.stopPropagation();
		});
		
		$("body").bind("click",function(event){
			if(splay){
				$(".user-menu ul").hide().animate({"margin-left":"0px"});
				splay = false;
			}
		});
		
		$(".closemenu").click(function(){
		
			$(this).parent().parent().parent().hide().animate({"margin-left":"0px"});
		});
	})
</script>
  		<h6 class="panel-title">
     		<a data-toggle="collapse"  data-parent="#accordion" href="#collapse${id.count }"><strong>${list.wname}</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp上交日期：${list.wuploaddate}</a>                             
				<span class="glyphicon glyphicon-cog" ></span>
				<script>
				$(function(){
					$(".user-menu .clearfix.boxed").css("width","140px");
					var $but = $(".glyphicon-cog").height();
// 					$left_menu = $hei-400;
// 					$left_menu =$left_menu.toString();
// 					$left_menu +="px"
					$(".glyphicon-cog").css({"margin-top":-$but});
					$(".user-menu ul").css({"margin-left":"0px","margin-top":-$but,"margin-bottom":"-10px"}).hide();
					$(".user-menu ul li").css({"float":"left","border-left":"1px solid #F8F3F0","padding":"5px","padding-left":"5px","width":"33.33%","text-align":"center"});
				})
				</script>
				<div class="user-menu">
				<c:choose>
							<c:when test="${frontnumber.status=='普通学生'}"> 

							</c:when>
							<c:otherwise>  
							 <ul class="clearfix boxed" >
				        <li>
				            <a href="<%=request.getContextPath()%>/workmodify.do?worknoticeid=${list.ID}">
				                <span class="glyphicon glyphicon-pencil" title="修改"></span>
				            </a>
				       
				        </li>
				        <li>
				            <a href="<%=request.getContextPath()%>/worknoticedelete.do?worknoticeid=${list.ID}">
				                <span class="glyphicon glyphicon-trash" title="删除"></span>
				            </a>
				        </li>
				        
				        <li>
				            <a href="#">
				                <span class="glyphicon glyphicon-share-alt closemenu" title="关闭"></span>
<!-- 				                </i> -->
				            </a>
				       
				        </li>
				    </ul>
                            </c:otherwise>
				</c:choose>
				   
				</div>
                             	 	</p>
                            	</div>
                            	
                            	<div id="collapse${id.count }" class="panel-collapse collapse">
                              		<div class="panel-body">
                               			<a href="<%=request.getContextPath()%>/workcontrol.do?worknoticeid=${list.ID}">${list.wcoursedesc}</a>
                              		    
                              		</div>
                            	</div>
                            		<c:choose>
							<c:when test="${frontnumber.status=='普通学生'}"> 
                             
							</c:when>
							<c:otherwise>  
                            	<ul class="stats-data clearfix" >
			                        <li><a href="#"><span>已交人数</span><strong>${sumworklist[id.index]}</strong></a></li>
			                        <li class="red"><a href="#"><span>未交人数</span><strong>${list.wtotalnum-sumworklist[id.index]}</strong></a></li>
			                        <li class="yellow"><a href="#"><span>总人数</span><strong>${list.wtotalnum}</strong></a></li>
							   </ul>
							  </c:otherwise>
				           </c:choose>
				           
                          	</div>
                          
                    </c:forEach>
                    </c:if>
				</div>
				<button class="btn" type="button"id="showmore">显示更多</button>
				<div class="tab-pane in active" id="diagram1">
					<p>
	                <c:forEach items="${obj}" var="list" begin="6" varStatus="id">	
							<div class="panel panel-default" style="margin-top:-17px;">
                            	<div class="panel-heading" style="height:50px">
                            	<script>
	$(function(){
		$(".panel-heading").css("background","#ffffff");
		 var $hei = $(".panel-heading").width()/8*7;
		 var $left_menu = $hei;
		 var $hei_menu = $(".panel-heading").width()/3*2;
		 var splay=false;
		 $hei_menu = $hei_menu.toString();
		 $hei_menu += "px";
		 $hei = $hei.toString();
	
		 $hei += "px";
		$(".glyphicon-cog").css({"margin-left":$hei});
		$(".glyphicon-cog").bind("click",function(event){
// 			alert($(this).parent().find('.user-menu ul').attr('class'));
			$(this).parent().find('.user-menu ul').show().animate({"margin-left":$hei_menu},300);
			splay = true;
			event.stopPropagation();
		});
		
		$("body").bind("click",function(event){
			if(splay){
				$(".user-menu ul").hide().animate({"margin-left":"0px"});
				splay = false;
			}
		});
		
		$(".closemenu").click(function(){
		
			$(this).parent().parent().parent().hide().animate({"margin-left":"0px"});
		});
	})
</script>
  		<h6 class="panel-title">
     		<a data-toggle="collapse"  data-parent="#accordion" href="#collapse${id.count+6}"><strong>${list.wname}</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp上交日期：${list.wuploaddate}</a>                             
				<span class="glyphicon glyphicon-cog" ></span>
				<script>
				$(function(){
					$(".user-menu .clearfix.boxed").css("width","140px");
					var $but = $(".glyphicon-cog").height();
// 					$left_menu = $hei-400;
// 					$left_menu =$left_menu.toString();
// 					$left_menu +="px"
					$(".glyphicon-cog").css({"margin-top":-$but});
					$(".user-menu ul").css({"margin-left":"0px","margin-top":-$but,"margin-bottom":"-10px"}).hide();
					$(".user-menu ul li").css({"float":"left","border-left":"1px solid #F8F3F0","padding":"5px","padding-left":"5px","width":"33.33%","text-align":"center"});
				})
				</script>
				<div class="user-menu">
				<c:choose>
							<c:when test="${frontnumber.status=='普通学生'}"> 

							</c:when>
							<c:otherwise>  
							 <ul class="clearfix boxed" >
				        <li>
				            <a href="<%=request.getContextPath()%>/workmodify.do?worknoticeid=${list.ID}">
				                <span class="glyphicon glyphicon-pencil" title="修改"></span>
				            </a>
				       
				        </li>
				        <li>
				            <a href="<%=request.getContextPath()%>/worknoticedelete.do?worknoticeid=${list.ID}">
				                <span class="glyphicon glyphicon-trash" title="删除"></span>
				            </a>
				        </li>
				        
				        <li>
				            <a href="#">
				                <span class="glyphicon glyphicon-share-alt closemenu" title="关闭"></span>
<!-- 				                </i> -->
				            </a>
				       
				        </li>
				    </ul>
                            </c:otherwise>
				</c:choose>
				   
				</div>
                             	 	</p>
                            	</div>
                            	
                            	<div id="collapse${id.count+6}" class="panel-collapse collapse">
                              		<div class="panel-body">
                               			<a href="<%=request.getContextPath()%>/workcontrol.do?worknoticeid=${list.ID}">${list.wcoursedesc}</a>
                              		    
                              		</div>
                            	</div>
                            		<c:choose>
							<c:when test="${frontnumber.status=='普通学生'}"> 
                             
							</c:when>
							<c:otherwise>  
                            	<ul class="stats-data clearfix" >
			                        <li><a href="#"><span>已交人数</span><strong>${sumworklist[id.index]}</strong></a></li>
			                        <li class="red"><a href="#"><span>未交人数</span><strong>${list.wtotalnum-sumworklist[id.index]}</strong></a></li>
			                        <li class="yellow"><a href="#"><span>总人数</span><strong>${list.wtotalnum}</strong></a></li>
							   </ul>
							  </c:otherwise>
				           </c:choose>
				           
                          	</div>                         
                    </c:forEach>
				</div>
            </div>
<!--             分组任务的具体内容 -->
            <div class="taskgroup hide"id="diagramm">
				<c:forEach items="${tasklist}" var="task" varStatus="id">
					
			            <div class="tab-content boxed clearfix">
			                <div class="tab-pane fade in active">
			                    <h6>${task.tname}  
			                    </h6>
			             
			                   <div class="take-a-look" style="font-size: 20px;margin-top:-50px;margin-left:80%;">
<%-- 			                   <form action="<%=request.getContextPath() %>/taskdetailed.do" method="post" style="position: relative; margin-left: -200px;font-size:10px;"> --%>
<%-- 			                	<input type="hidden" value="${id.index}" name="tasktag"> --%>
<!-- 			                	<span class="btn btn-small"><input type="submit" value="查看详情" ></span> -->
<!-- 			                	</form> -->
								<a href="<%=request.getContextPath() %>/taskdetailed.do?tasktag=${task.ID}">
										<span class="btn btn-small" style="position: relative; margin-left: -200px;margin-top:-52px;font-size:10px;"><input type="submit" value="查看详情" ></span>
									</a>
			                	<c:if test="${frontnumber.status == '学委' || frontnumber.status == '班长'}" >
			                		<a href="<%=request.getContextPath() %>/tasknoticeModify.do?tasktag=${task.ID}">
										<span class="btn btn-small" style="position: relative; margin-left: -90px;margin-top:-52px;font-size:10px;"><input type="submit" value="修改" ></span>
									</a>
									<a href="<%=request.getContextPath() %>/tasknoticeDelete.do?tasktag=${task.ID}">
										<span class="btn btn-small" style="position: relative; margin-left: -8px;margin-top:-52px;font-size:10px;"><input type="submit" value="删除"></span>
									</a>
								</c:if>
			                	
			                </div>
			            
			                    <div id="donutchart" class="donutchart" style="margin-left:0px;width:80%;">${task.tcoursedesc}</div>
			                     <ul class="stats-data clearfix">
			                        <li><a href="#"><span>已分组人数</span><strong>${sumtasklist[id.index]}</strong></a></li>
			                        <li class="red"><a href="#"><span>未分组人数</span><strong>${task.ttotalnum-sumlist[id.index]}</strong></a></li>
			                        <li class="yellow"><a href="#"><span>总人数</span><strong>${task.ttotalnum}</strong></a></li>
			                    </ul>
			             
			                </div>
			            </div>
			    	
		        </c:forEach>
            </div>
           
        </div>
  
     
    </div>
    </div>

<%@ include file="./middle.jsp" %>

</div>

</div>

<!-- footer -->
<%@include file="./footer.jsp" %>