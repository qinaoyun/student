<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生注册</title>
   <meta charset="utf-8">
    <meta name="keywords" content="jQuery,easyform,form validation,javascript,js,jq,jquery,表单验证,插件">
    <meta name="description" content="jQuery.Easyform表单验证插件">

    <title>jQuery.Easyform Demo</title>

    <meta name="description" content="">
    <meta http-equiv="cleartype" content="on">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/module/css/platform-1.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/module/js/easyform/easyform.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/module/css/tab.css">

    <script src="<%=request.getContextPath()%>/module/js/jquery-2.1.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/module/js/easyform/easyform.js"></script>
</head>
<body>
<form id="form2" action="register.do" method="post">
	<div class="page">

    <div class="header">

        <a class="link title-ani"  data-letters="register"><img src="<%=request.getContextPath()%>/images/candy.jpg" width="40" height="40"/> iwork*注册</a>
        <br>

      

    </div>

    <div class="form-div">
        <form id="reg-form" action="" method="post">

            <table>
                <tr>
                    <td>用户名</td>
                    <td><input name="sname" type="text" id="uid"
                               data-easyform="length:4 16;char-normal;real-time;ajax:ajax_demo(1);"
                               data-message="用户名必须为4—16位的英文字母或数字"
                               data-easytip="position:top;class:easy-blue;" data-message-ajax="用户名已存在!">
                    </td>
                </tr>
                
                <tr>
                    <td width="60">性别</td>
                    <td style="text-align: left;width:500px;height:62px;padding-left:32px;">
                        <input name="ssex" type="radio" id="sex-1" value="1" class="css-checkbox"
                               data-message="请选择一个性别" data-easytip="class:easy-blue;"><label class="radio-label" for="sex-1">男</label>
                        <input name="ssex" type="radio" id="sex-2" value="0" class="css-checkbox">
                        <label class="radio-label" for="sex-2">女</label>
                    </td>
                </tr>
                <tr>
                    <td>学号</td>
                    <td><input name="sno" type="text" id="nickname" data-easyform="length:2 16;real-time"
                               data-easytip="class:easy-blue;"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input name="spasswd" type="password" id="psw1" data-easyform="length:6 16;"
                               data-message="密码必须为6—16位"
                               data-easytip="class:easy-blue;"></td>
                </tr>
                <tr>
                    <td>确认密码</td>
                    <td><input name="spasswd" type="password" id="psw2" data-easyform="length:6 16;equal:#psw1;"
                               data-message="两次密码输入要一致" data-easytip="class:easy-blue;"></td>
                </tr>
                <tr>
                    <td>个性签名</td>
                    <td><textarea id="sdesc" name="sdesc" style="width:500px;height:62px;" data-easyform="null;"></textarea></td>
                </tr>
                <tr>
                    <td>学院</td>
                    <td><select name="scollege" id="scollege">
                    <c:forEach var="college"  items="${obj}">
                                   <option value="${college.ID}" id="scollegeid">${college.collogeinfo}</option>
<!--                                     <input type="hidden" id="scollegeid" value="" />  -->
                     </c:forEach>
                    </select>
</td>
                </tr>
                 <tr>
                    <td>班级</td>
                    <td><select name="sclass"id="sclass">
                    	<%-- 	<c:forEach var="class"  items="${obj1}"> --%>
                                   <%-- <option  value="${class.classinfo}">${class.classinfo}</option> --%>
                                  <!--  <option value="软件工程2班">软件工程2班</option> -->
<!--                                    <option value="">软件工程3班</option> -->
<!--                                    <option value="">软件工程4班</option> -->
                            <%--        </c:forEach> --%>
                               </select></td>
                </tr>
              <!--   <tr>
                    <td width="60">身份</td>
                    <td style="text-align: left;width:500px;height:62px;padding-left:32px;">
                        <input name="status" type="radio" id="ide-1" value="0" class="css-checkbox">
                               data-message="请选择一个身份" data-easytip="class:easy-blue;">
                         <label class="radio-label" for="ide-1">学生</label>
                        <input name="status" type="radio" id="ide-2" value="1" class="css-checkbox">
                        <label class="radio-label" for="ide-2">学委</label>
                        <input name="status" type="radio" id="ide-3" value="2" class="css-checkbox">
                      <label class="radio-label" for="ide-3">班长</label> 
                      <input name="status" type="radio" id="ide-4" value="3" class="css-checkbox"> 
                       <label class="radio-label" for="ide-4">老师</label> 
                    </td>
                </tr> -->
                <tr>
                    <td>邮箱</td>
                    <td><input name="semail" type="text" id="email" data-easyform="email;real-time;"
                               data-message="Email格式要正确"
                               data-easytip="class:easy-blue;"></td>
                </tr>
                <tr>
                    <td>联系方式</td>
                    <td><input name="scontact" type="text" id="nickname" data-easyform="length:11;real-time"
                               data-easytip="class:easy-blue;"></td>
                </tr>
				
                
                <!-- <tr>
                    <td>爱好</td>
                    <td style="text-align: left;width:300px;height:62px;padding-left:32px;">
                        <input name="hobby[]" type="checkbox" id="hobby-1" value="1" class="css-checkbox"
                               data-easyform="null;">
                        <label class="checkbox-label" for="hobby-1">电影</label>
                        <input name="hobby[]" type="checkbox" id="hobby-2" value="2" class="css-checkbox"><label
                            class="checkbox-label" for="hobby-2">读书</label>
                        <input name="hobby[]" type="checkbox" id="hobby-3" value="3" class="css-checkbox"><label
                            class="checkbox-label" for="hobby-3">旅行</label>
                        <input name="hobby[]" type="checkbox" id="hobby-4" value="4" class="css-checkbox"><label
                            class="checkbox-label" for="hobby-4">游戏</label>
                    </td>
                </tr> -->
             <!--    <tr>
                    <td>email</td>
                    <td><input name="email" type="text" id="email" data-easyform="email;real-time;easytip:false;"
                               data-message="Email格式要正确"
                               data-easytip="class:easy-blue;"></td>
                </tr>
                <tr>
                    <td>昵称</td>
                    <td><input name="nickname" type="text" id="nickname" data-easyform="length:2 16;"
                               data-easytip="class:easy-blue;position:bottom;"></td>
                </tr> -->
            </table>
           <!-- 根据学院查询班级 --> 
            <script type="text/javascript">
            $("#scollege").blur(function(){
        		$.post("<%=request.getContextPath() %>/queryclass.do",{
        			collegeid : $("#scollege").val(),
        			data:"test"	
        		},
        		function(data,status){
        			var result = data; 
        			$("#sclass").empty();
        			for ( var i = 0; i < result.length; i++) {
/*         				alert(result[0].classinfo); */
        				
        				$("#sclass").append("<option value='"+result[i].classinfo+"'>"+result[i].classinfo+"</option>");  //添加一项option
        			} 		
        		},"json");
        	});
            </script>

            <div class="buttons" style="margin-top: 50px;">
                <center><input value="注 册" type="submit" ></center>
                <!-- <input value="我有账号，我要登录" type="button" style="margin-right:45px; margin-top:20px;"> -->
            </div>

            <br class="clear">
        </form>
    </div>

    <!--简介-->
    

<script>

    $(document).ready(function ()
    {
        var v = $('#reg-form').easyform();

        $('#demo-form').easyform();

        v.is_submit = false;

        v.error = function (ef, i, r)
        {
            //console.log("Error事件：" + i.id + "对象的值不符合" + r + "规则");
        };

        v.success = function (ef)
        {
            //console.log("成功");
        };

        v.complete = function (ef)
        {
            console.log("完成");
        };

        $('#tip-test1').easytip();
        $('#tip-test2').easytip();
        $('#tip-test3').easytip();
        $('#tip-test4').easytip();


    });

    function ajax_demo(p)
    {
        $("#uid").trigger("easyform-ajax", true);
    }


</script>
		</form>
</body>
</html>