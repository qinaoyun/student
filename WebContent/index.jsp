<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/module/js/libs/jquery-1.10.0.js"></script>
<script src="<%=request.getContextPath()%>/jquery-1.9.1/jquery-1.8.3.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>

<script>
function checkit() {
	if (form1.number.value == "") {
		alert("请输入用户名!");
		form1.number.result();
		return false;
	}
	if (form1.password.value == "") {
		alert("密码错误!");
		form1.password.result();
		return false;
	}
	return true;
}
function changeImage() {
	var checkNumberImage = document.getElementById("checkNumberImage");
	checkNumberImage.src = "${pageContext.request.contextPath}/image.jsp?timestamp="
			+ new Date().getTime();

	}
	
$(".reg-slogan").click(function(){
// 	$(this).css({"box-shadow":"inset 0px 0px 30px red"});
alert("ddddddd");
	alert($(this).attr(class));
});
</script>
<script type="text/javascript">  
$(document).ready(function () {  
    if ($.cookie("rmbUser") == "true") {  
    $("#ck_rmbUser").attr("checked", true);  
    $("#txt_username").val($.cookie("username"));  
    $("#txt_password").val($.cookie("password"));  
    }  
});  

//记住用户名密码  
function Save() {  
    if ($("#ck_rmbUser").attr("checked")) {  
        var str_username = $("#txt_username").val();  
        var str_password = $("#txt_password").val();  
        $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie  
        $.cookie("username", str_username, { expires: 7 });  
        $.cookie("password", str_password, { expires: 7 });  
    }  
    else {  
        $.cookie("rmbUser", "false", { expire: -1 });  
        $.cookie("username", "", { expires: -1 });  
        $.cookie("password", "", { expires: -1 });  
    }  
};  
</script>
</head>
<body>
	<form id="form1" action="login.do" method="post">
		<!-- 代码begin -->
		<div class="wrap">
			<div class="banner-show" id="js_ban_content">
				<div class="cell bns-01">
					<div class="con">
						<a href="#" target="_blank" class="banner-link"> <i>作业</i>
						</a>
					</div>
				</div>
				<div class="cell bns-02" style="display: none;">
					<div class="con">
						<a href="#" target="_blank" class="banner-link"> <i>管理</i>
						</a>
					</div>
				</div>
				<div class="cell bns-03" style="display: none;">
					<div class="con">
						<a href="#" target="_blank" class="banner-link"> <i>学生</i>
						</a>
					</div>
				</div>
			</div>
			<div class="banner-control" id="js_ban_button_box">
				<a href="javascript:;" class="left">左</a> <a href="javascript:;"
					class="right">右</a>
			</div>

			<div class="container">
				<div class="register-box">
					<div class="reg-slogan" style="height:60px;width:50%;position:relative;padding:0px;text-align:center;font-size:20px;line-height:60px;color:black;">登录</div>
					<div class="reg-slogan" style="height:60px;width:50%;position:relative;margin-left:50%;margin-top:-60px;text-align:center;font-size:20px;line-height:60px;color:grey;">
					<a href="<%=request.getContextPath()%>/querycollege.do" style="text-decoration:none;">注册</a></div>
					<div class="reg-form" id="js-form-mobile">
						<br> <br>
						<div class="cell">
							<input type="text" name="number" id="txt_username"
								class="text" maxlength="11" placeholder="请输入学号" 
								 />
						</div>
						<div class="cell">
							<input type="password" name="password" id="txt_password"
								class="text" placeholder="请输入密码" />
						</div>
						<!-- !短信验证码 -->
						<div class="cell vcode">
							<input type="text" name="checkNumber" id="js-mobile_vcode_ipt"
								class="text" maxlength="6" placeholder="请输入验证码" />
<%-- 							<img alt="" src="${pageContext.request.contextPath}/image.jsp" id="checkNumberImage" > --%>
							
							
							<img src="${pageContext.request.contextPath}/image.jsp" id="checkNumberImage"
							name="checkNumberImage" height="30" style="cursor: hand" title="点击切换下一张图片"
							onclick="changeImage()" />
						</div>
						<div class="submit">
							<div class="check">
								<span>记住用户名和密码</span>
								<input type="checkbox" id="ck_rmbUser" >
							</div>
							<input type="submit" id="js-mobile_btn" href="javascript:;" class="button btn-green" 
							onclick="Save()" value="登录" style="width:100%;"/>
						</div>
					</div>
				</div>
			</div>
	</div>
			<script>
			$(function(){
				$(".reg-slogan:last").hover(function(){
					$(this).css({"border-bottom":"2px solid rgb(54,148,239)"});
				},function(){
					$(this).css({"border-bottom":"0px"});
				});
			})
			</script>
			<script src="ajaxja.js"></script>
			
			<script type="text/javascript">
                $(function(){
                    
                    var defaultInd = 0;
                    var list = $('#js_ban_content').children();
                    var count = 0;
                    var change = function(newInd, callback){
                        if(count) return;
                        count = 2;
                        $(list[defaultInd]).fadeOut(400, function(){
                            count--;
                            if(count <= 0){
                                if(start.timer) window.clearTimeout(start.timer);
                                callback && callback();
                            }
                        });
                        $(list[newInd]).fadeIn(400, function(){
                            defaultInd = newInd;
                            count--;
                            if(count <= 0){
                                if(start.timer) window.clearTimeout(start.timer);
                                callback && callback();
                            }
                        });
                    }
                    
                    var next = function(callback){
                        var newInd = defaultInd + 1;
                        if(newInd >= list.length){
                            newInd = 0;
                        }
                        change(newInd, callback);
                    }
                    
                    var start = function(){
                        if(start.timer) window.clearTimeout(start.timer);
                        start.timer = window.setTimeout(function(){
                            next(function(){
                                start();
                            });
                        }, 8000);
                    }
                    
                    start();
                    
                    $('#js_ban_button_box').on('click', 'a', function(){
                        var btn = $(this);
                        if(btn.hasClass('right')){
                            //next
                            next(function(){
                                start();
                            });
                        }
                        else{
                            //prev
                            var newInd = defaultInd - 1;
                            if(newInd < 0){
                                newInd = list.length - 1;
                            }
                            change(newInd, function(){
                                start();
                            });
                        }
                        return false;
                    });
                    
                })();
</script>
	</form>
</body>
</html>