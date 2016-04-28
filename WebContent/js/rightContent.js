//个人信息的修改
	
	//个人信息界面修改键
	$("#personInfoModify").click(function(){
		var $contactTarget = $(".field_text :input[name='scontact']").parent().parent().next();
		var $textArea = $(".field_text textarea");
		var $textAreaTarget = $textArea.parent().parent().next();
		
		$(".field_text :input").each(function(index,element){
//			alert(index);
			if(index==5){
				var $target = $(this);
				$target.removeAttr("disabled");
			}
		});
		$("#radio_v1").removeAttr("disabled");
		$("#radio_v2").removeAttr("disabled");
		
		$textArea.removeAttr("disabled");
		$("#submit1").removeAttr("disabled");
		$contactTarget.html('请输入联系方式');
		$textAreaTarget.html('请输入个人签名');
	});
	
	//个人信息界面恢复键
	$("#personInfoRecover").click(function(){
		var $contactTarget = $(".field_text :input[name='scontact']").parent().parent().next();
		var $textArea = $(".field_text textarea");
		var $textAreaTarget = $textArea.parent().parent().next();
		
		$(".field_text :input").each(function(index,element){
			if(index==5){
				var $target = $(this);
				$target.attr("disabled","disabled");
			}
		});
		$("#radio_v1").attr("disabled","disabled");
		$("#radio_v2").attr("disabled","disabled");
		
		$textArea.attr("disabled","disabled");
		$("#submit1").attr("disabled","disabled");
		$contactTarget.html('');
		$textAreaTarget.html('');
	});
	
	//个人信息界面联系方式
	$(".field_text :input[name='scontact']").bind('input propertychange',function(){
		var contact = $(this).val().trim();
		var $target = $(this).parent().parent().next();
		var length = contact.length;
		
		if(length <= 0){
			$target.html('联系方式不能为空');
			$("#submit1").attr("disabled","disabled");
		}else if(length < 11){
			$target.html('联系方式太短');
			$("#submit1").attr("disabled","disabled");
		}else{
			$target.html('ok');
			$("#submit1").removeAttr("disabled");
		}
	});
	
	//个人信息界面提交信息
	$("#submit1").click(function(){
		var scontact = $(".field_text :input[name='scontact']").val().trim();
		var sdesc = $(".field_text textarea").val().trim();
		var ssex = $(".field_radio input:radio:checked").val();
		
		//对于信息的过滤，有待完善
		if(scontact === ""){
			alert('信息不能为空');
		}else{
			$.post("../personInfoModify.do",{
				scontact:scontact,
				sdesc:sdesc,
				ssex:ssex
			},function(data,status){
				if("success" === status.trim()){
					if(data.trim() === "yes"){
						alert('修改成功');
						location.reload(true);
					}else{
						alert('修改失败');
					}
				}else{
					alert('连接服务器失败，请检查网络连接');
				}
			});
		}
	});


	
	
//密码的修改
	
	//修改密码界面输入原有密码
	$(".field_text :input[name='oldPassword']").bind('input propertychange',function(){
		var oldPassword = $(this).val().trim();
		var $target = $(this).parent().parent().next();
		
		if(oldPassword === ""){
			$target.html('请输入密码');
		}else{
			$target.html('');
		}
	});
	
	//修改密码界面新密码的初次输入
	$(".field_text :input[name='newPassword']").bind('input propertychange',function(){
//		alert('newPassword');
		var newPassword = $(this).val().trim();
		var newPasswordAgain = $(".field_text :input[name='newPasswordAgain']").val().trim();
		var $target = $(this).parent().parent().next();
		var $targetAgain = $(".field_text :input[name='newPasswordAgain']").parent().parent().next();
		
		var length = newPassword.length;
		if(length <= 0){
			$target.html('密码不能为空');
			$("#submit2").attr("disabled","disabled");
		}else if(length < 6){
			$target.html('密码位数不能少于6位');
			$("#submit2").attr("disabled","disabled");
		}else if(length <= 12){
			$target.html('密码等级：1');
		}else if(length <= 18){
			$target.html('密码等级：2');
		}else if(length > 18){
			$target.html('密码等级：3');
		}
		
	});
	
	//修改密码界面新密码的确认输入
	$(".field_text :input[name='newPasswordAgain']").bind('input propertychange',function(){
//		alert('newPasswordAgain');
		var newPassword = $(".field_text :input[name='newPassword']").val().trim();
		var newPasswordAgain = $(this).val().trim();
		var $target = $(".field_text :input[name='newPassword']").parent().parent().next();
		var $targetAgain = $(this).parent().parent().next();
		
		if(newPassword !== newPasswordAgain){
			$targetAgain.html('两次密码不一致');
			$("#submit2").attr("disabled","disabled");
		}else{
			if(newPasswordAgain.length < 6){
				$targetAgain.html('密码位数不能少于6位');
				$("#submit2").attr("disabled","disabled");
			}else{
				$targetAgain.html('ok');
				$("#submit2").removeAttr("disabled");
			}
		}
		
	});
	
	//修改密码界面提交密码
//	$("#submit2").attr("disabled","disabled");
	$("#submit2").click(function(){
		var oldPassword = $(".field_text :input[name='oldPassword']").val().trim();
		var newPassword = $(".field_text :input[name='newPassword']").val().trim();
		$.post("../passwordModify.do",{
			oldPassword:oldPassword,
			newPassword:newPassword
		},function(data,status){
			if("success" === status.trim()){
				if(data.trim() === "success"){
					alert('修改成功');
					location.reload(true);
				}else{
					alert('密码错误');
				}
			}else{
				alert('连接服务器失败，请检查网络连接');
			}
		});
	});
	

//function getPasswordStatus(){
//	var newPassword = $(".passwordModify :input[name='newPassword']").val().trim();
//	var newPasswordAgain = $(".passwordModify :input[name='newPasswordAgain']").val().trim();
//	
//	if(newPassword !== "" && newPasswordAgain !== "" && newPassword === newPasswordAgain){
//		return true;
//	}else{
//		return false;
//	}
//}
