$(function(){
	$("#workpublish").click(function(){
		$(".workgroup").removeClass("hide");
		$(".taskgroup").addClass("hide");
	});
	
	$("#taskpublish").click(function(){
		$(".workgroup").addClass("hide");
		$(".taskgroup").removeClass("hide");
	});
})