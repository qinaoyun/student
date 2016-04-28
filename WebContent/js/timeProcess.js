$(function(){
	
	//实现页面得动画效果
	function animate(){
		var op = 1;
		
//		$(".timeline-date:gt(1) ul li").hide();
		$(".timeline").eq(0).animate({
			height:'800px'
		},3000);

		$(".timeline-date:first ul li dl.right").css({"background-color":"#fff","opacity":"0.5"});
		// $(".timeline-date ul li").toggle(function(){$(this).slideUp()},function(){$(this).slideDown()});
		$(".timeline-date ul li ").click(function(){
			$(this).slideUp();
		});
		$(".timeline-date ul h2").click(function(){
				if(op == 0){
				$(this).siblings().slideDown();
				op=1;
			}else{
				$(this).siblings().slideUp();
				op=0;
			}
		});

	}
	
	animate();
	
	$("#work_his").click(function(){
		$(".work_history").removeClass("hidden");
		$(".task_history").addClass("hidden");
		$(".worknotice_history").addClass("hidden");
		$(".tasknotice_history").addClass("hidden");
	});
	$("#task_his").click(function(){
		$(".work_history").addClass("hidden");
		$(".task_history").removeClass("hidden");
		$(".worknotice_history").addClass("hidden");
		$(".tasknotice_history").addClass("hidden");
	});
	$("#worknotice_his").click(function(){
		$(".work_history").addClass("hidden");
		$(".task_history").addClass("hidden");
		$(".worknotice_history").removeClass("hidden");
		$(".tasknotice_history").addClass("hidden");
	});
	$("#tasknotice_his").click(function(){
		$(".work_history").addClass("hidden");
		$(".task_history").addClass("hidden");
		$(".worknotice_history").addClass("hidden");
		$(".tasknotice_history").removeClass("hidden");
	});
})