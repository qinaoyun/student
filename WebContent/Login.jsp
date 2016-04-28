<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>作业管理系统</title>
<!--     <link href="css/admincss/common.css" rel="stylesheet" type="text/css" /> -->
    <link href="css/admincss/login.css" rel="stylesheet" type="text/css" />
    <script>
function checkit(){         
  if(form1.username.value==""){       
          alert("请输入用户名!");
          form1.username.result();
        return false;
         }                
       if(form1.password.value==""){   
          alert("密码错误!");
      form1.password.result();
      return false ;
     }
      return true;         
} 
</script>
</head>
<body>
    <form id="form1" action="adminlogin.do" method="post">
        <div class="login">
            <div class="loginform">
                <div class="username">
                <input type="text" name="sno" placeholder="请输入用户名" />
                </div>
                <div class="password">
                <input type="password" name="spasswd" placeholder="请输入密码" />
                </div>
                <div class="submit">
             
                <input type="image" name="imageField" onclick="return checkit();" src="<%=request.getContextPath()%>/images/admin/bb.png" />
                </div>
            </div>
        </div>

    </form>
</body>
</html>
