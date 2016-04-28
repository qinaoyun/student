$(function(){
	$(".submit").click(function(){
		var groupNum = $(this).prev().val();
		var tasktag = $(this).prev().prev().val();
		var url = $(this).prev().prev().prev().val();
		
		$.post(url,{
			tasktag:tasktag,
			groupNum:groupNum
		},function(data,status){
//			alert(data);
			switch(data){
				case "1":
					alert("这一组人数已满");
					break;
				case "2":
					alert("你已经分过组了");
					break;
				case "3":
					alert("添加成功");
					window.location.reload();
					break;
				default:
					alert("添加失败");
					break;
			}
		},"text");
	})
})