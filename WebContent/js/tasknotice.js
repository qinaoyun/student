//用于在分组发布的时候自动显示小组限制人数
function getLimitNum(){
	var total = $("#peopleNum").val();
	var groupnum = $("#groupNum").val();
	var goup = 0;
	
	total = Number(total);
	groupnum = Number(groupnum);
	
//	alert(total+"......."+groupnum);
	
	if(total%groupnum==0){
		goup = total/groupnum;
	}
	else{
		goup = Math.floor(total/groupnum)+1;
	}
	
	$("#group").val(goup);
	
}
