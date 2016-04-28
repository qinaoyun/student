<%@ page contentType="text/html; charset=UTF-8" %>
<html >
<head >
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生作业系统</title>
    <script src="js/adminjs/jquery-1.8.3.js"></script>
    <script src="easyui/jquery.easyui.min.js"></script>
    <link href="easyui/themes/default/easyui.css" rel="stylesheet" />
    <link href="easyui/themes/icon.css" rel="stylesheet" />
    <script src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link href="css/admincss/mainFrame.css" rel="stylesheet" />
    <link href="css/admincss/tabs.css" rel="stylesheet" />
    <script src="js/adminjs/common.js"></script>
    <script src="js/adminjs/menu.js"></script>
    <script src="js/adminjs/main.js"></script>
    <script src="js/adminjs/mainFrame.js"></script>
    <style>
        a { text-decoration:none;
        }
        .easyui-accordion1 li {
            border-bottom:#cccccc 1px dashed; line-height:28px;
        }
        .auto-style1 {
            font-size: xx-large;
            text-transform: capitalize;
            font-weight: bold;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body class="easyui-layout" scroll="no">
    <noscript>
        <div style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
            <img src="Admin/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
        </div>
    </noscript>
    <form id="form1" >
        <div data-options="region:'north',border:false" id="north">
            <span class="topright">
                欢迎<span class="lgUser">您,${user.sname}&nbsp; </span><a href="#" id="editpass">修改密码</a> <a href="./logout.do" id="loginOut">安全退出</a></span>
            <span class="topleft">学生作业系统</span>
        </div>
        <div id="west" data-options="region:'west',split:true,title:'导航菜单'">
            <div class="easyui-accordion1" fit="true" border="false">
                <!--  导航内容 -->

            </div>
        </div>

        <div data-options="region:'south',border:false" id="south">
            <div class="footer">版权所有：仰光web开发社（CopyRight 2016） </div>
        </div>
        <div data-options="region:'center'" id="mainPanle">
            <div id="tabs" class="easyui-tabs" fit="true" border="false">
                <div title="作业中心" style="padding: 20px; overflow: hidden;" id="home">
                  
                        <div style="margin:10px 0;"></div>
                    <div style="font-size:14px; color:#444444; line-height:32px;" class="auto-style2"><span class="auto-style1">欢迎大家，使用学生作业管理系统！</span><br /> 
                     
                    
                    </div>
                
                </div>
            </div>

        </div>
        <!-- <div id="mm" class="easyui-menu" style="width: 150px;">
            <div id="mm-tabclose">关闭</div>
            <div id="mm-tabcloseall">全部关闭</div>
            <div id="mm-tabcloseother">除此之外全部关闭</div>
            <div class="menu-sep"></div>
            <div id="mm-tabcloseright">当前页右侧全部关闭</div>
            <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
            <div class="menu-sep"></div>
            <div id="mm-exit">退出</div>
        </div> -->
    </form>
</body>
</html>
