<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
body {
  background: #141414;
  width: 100%;
  height: 100%;
}

.loading {
  text-transform: uppercase;
  font-family: 'Cabin Condensed', sans-serif;
  font-weight: bold;
  font-size: 100pt;
  text-align: center;
  height: 120px;
  line-height: 110px;
  vertical-align: bottom;
  position: absolute;
  left: 0;
  right: 0;
  top: 100px;
  bottom: 0;
  display: block;
}

.loading-2 {
  top: 300px;
  width: 473px;
  height: 97px;
  font-size: 0;
  background: rgba(255, 255, 255, 0.06);
  margin: 0 auto;
}

.ff {
  position: absolute;
  font-size: 12pt;
  top: -20px;
  color: white;
  line-height: 12pt;
}

.loading-2-text {
  background-image: url(<%=request.getContextPath()%>/images/cZc1otp.png);
  width: 473px;
  height: 97px;
  display: inline-block;
}

@keyframes wave-animation {
  0% {
    background-position: 0 bottom;
  }

  100% {
    background-position: 200px bottom;
  }
}
@keyframes loading-animation {
  0% {
    background-size: 200px 0px;
  }

  100% {
    background-size: 200px 200px;
  }
}
.wave {
  background-image: url(<%=request.getContextPath()%>/images/uFpLbYt.png);
  -moz-background-clip: text;
  -o-background-clip: text;
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
  text-shadow: 0px 0px rgba(255, 255, 255, 0.06);
  animation: wave-animation 1s infinite linear, loading-animation 10s infinite linear alternate;
  background-size: 200px 100px;
  background-repeat: repeat-x;
  opacity: 1;
}

.wave-2 {
  -moz-background-clip: initial;
  -o-background-clip: initial;
  -webkit-background-clip: initial;
  background-clip: initial;
  display: inline-block;
}

</style>

<script src="<%=request.getContextPath()%>/js/prefixfree.min.js"></script>

<script type="text/javascript">


var t;
t=5;
function shua()
{
t=t-1;
// document.getElementById("hints").innerHTML=t;
if (t==0)
{
	document.location.href="<%=request.getContextPath()%>/querymain.do";
}
}
</script>

</head>
<body onload="window.setInterval(shua,10);">
  
  <link href='http://fonts.googleapis.com/css?family=Cabin+Condensed:700' rel='stylesheet' type='text/css'>
<div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
<div class="loading wave">
  Loading
</div>

<!-- For Firefox -->
<div class="loading loading-2 wave wave-2">
  <div class="ff">For browsers that don't support background-clip:text:</div>
  <div class="loading-2-text"></div>
</div>

</body>
</html>