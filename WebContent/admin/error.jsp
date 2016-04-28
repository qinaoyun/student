<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
var t;
t=5;
function shua()
{
t=t-1;
document.getElementById("hints").innerHTML=t;
if (t==0)
{
document.location.href="../patent/Login.jsp";
}
}
</script>
</head>
<body onload="window.setInterval(shua,1000);">
<h1>Sorry,登录失败！！！！</h1>
<font id="hints">5</font>秒后自动跳转。。。
<input type="button" onclick="location.href='../patent/Login.jsp'" value="重新登陆 "/>
</body>
</html>