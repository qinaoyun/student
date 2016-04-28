//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
}

//本地时钟
function clockon() {
    var now = new Date();
    var year = now.getFullYear(); //getFullYear getYear
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec + " " + week;

    $("#bgclock").html(time);

    var timer = setTimeout("clockon()", 200);
}


//yxy
//检查列表中的某一项是否被选中
function ShowWait() {
    showCover();
    document.getElementById('doing').className = "tddisp";
    if (doing.className == "") {
        doing.className = "tddisp";
    }
    else {

        doing.className = "";
    }

}

function showwait() {
    showCover();
    document.getElementById('doing').className = "tddisp";
    if (doing.className == "") {
        doing.className = "tddisp";
    }
    else {

        doing.className = "";
    }

}
function CheckSelect() {
    var a = 0
    for (var i = 0; i < document.forms["form1"].elements.length; i++) {
        if (document.forms["form1"].elements[i].checked == true)
        { a = a + 1 }
    }

    if (a > 0) {
        if (a > 1) {
            alert('此操作只能选择一条记录')
            return false;
        }
        else {
            ShowWait()
        }
    }
    else {
        alert('请点击每行记录前的选择框选择一条记录！');
        return false;
    }
}

//删除一项或多项
function DelCheck() {
    var a = 0
    for (var i = 0; i < document.forms["form1"].elements.length; i++) {
        if (document.forms["form1"].elements[i].checked == true)
        { a = a + 1 }
    }

    if (a > 0) {

    }
    else {
        alert('请至少选中一条记录，如果你想选择一条或者多条，请点击每条记录前的选择框即可');
        return false;
    }

    if (window.confirm("你确认删除选中记录？")) {
        ShowWait()

        return true;
    }
    else {
        return false;
    }
}

//一项或多项批量转换
function BatchCheck() {
    var a = 0
    for (var i = 0; i < document.forms["form1"].elements.length; i++) {
        if (document.forms["form1"].elements[i].checked == true)
        { a = a + 1 }
    }

    if (a > 0) {

    }
    else {
        alert('请至少选中一条记录，如果你想选择一条或者多条，请点击每条记录前的选择框即可');
        return false;
    }

    if (window.confirm("你确认批量处理选中记录？")) {
        ShowWait()

        return true;
    }
    else {
        return false;
    }
}
//删除一项或多项角色信息
function DelRoleCheck() {
    var a = 0
    for (var i = 0; i < document.forms["form1"].elements.length; i++) {
        if (document.forms["form1"].elements[i].checked == true)
        { a = a + 1 }
    }

    if (a > 0) {

    }
    else {
        alert('请至少选中一条记录，如果你想选择一条或者多条，请点击每条记录前的选择框即可');
        return false;
    }

    if (window.confirm("你确认删除选中角色？删除该角色后，该角色关联的用户信息会保留，但是其对应的角色会置空，请到用户管理模块重新修改！")) {
        ShowWait()

        return true;
    }
    else {
        return false;
    }
}

//选择所有条记录
function CheckAll() {
    for (var i = 0; i < document.forms["form1"].elements.length; i++) {

        document.forms["form1"].elements[i].checked = true;
    }
}

//将所有记录反选
function FanAll() {
    for (var i = 0; i < document.forms["form1"].elements.length; i++) {
        if (document.forms["form1"].elements[i].checked == true)
            document.forms["form1"].elements[i].checked = false;
        else
            document.forms["form1"].elements[i].checked = true;
    }
}

function ShowCover() {
    //遮罩宽
    var sw = document.body.scrollWidth;
    //遮罩高
    var sh = document.body.scrollHeight;
    if (document.getElementById('AlexCoverV1_0')) {
        DispalySelect(0);
        document.getElementById('AlexCoverV1_0').style.display = 'block';
    }
    else {
        DispalySelect(0);
        var div = document.createElement("div");
        div.id = "AlexCoverV1_0";
        div.style.position = "absolute";
        div.style.top = "0px";
        div.style.left = "0px";
        div.style.height = sh + "px";
        div.style.width = sw + "px";
        div.style.background = "#ffffff";
        div.style.filter = "alpha(opacity=20)";
        document.body.appendChild(div);
    }
}
function showCover() {
    //遮罩宽
    var sw = document.body.scrollWidth;
    //遮罩高
    var sh = document.body.scrollHeight;
    if (document.getElementById('AlexCoverV1_0')) {
        DispalySelect(0);
        document.getElementById('AlexCoverV1_0').style.display = 'block';
    }
    else {
        DispalySelect(0);
        var div = document.createElement("div");
        div.id = "AlexCoverV1_0";
        div.style.position = "absolute";
        div.style.top = "0px";
        div.style.left = "0px";
        div.style.height = sh + "px";
        div.style.width = sw + "px";
        div.style.background = "#ffffff";
        div.style.filter = "alpha(opacity=20)";
        document.body.appendChild(div);
    }
}

//显示和隐藏select控件
function DispalySelect(val) {
    var dispalyType;
    var arrdispalyType = ["hidden", "visible"];
    var arrObjSelect = document.getElementsByTagName("select");
    for (i = 0; i < arrObjSelect.length; i++) {
        arrObjSelect[i].style.visibility = arrdispalyType[val];
    }
}

//关闭弹出窗口
function CloseAlert(alertid) {
    document.getElementById(alertid).outerHTML = '';
    CloseCover();
}
//关闭弹出窗口
function close_Alert(alertid) {
    document.getElementById(alertid).outerHTML = '';
    CloseCover();
}

function CloseCover() {
    if (document.getElementById('AlexCoverV1_0')) {
        document.getElementById('AlexCoverV1_0').style.display = 'none';
        DispalySelect(1);
    }
}
//------------------------华丽的分割线----------------------

function close_alert(alertid) {
    window.parent.mainFrame.document.getElementById(alertid).outerHTML = '';
    Close_Cover();
}
function Close_Cover() {
    if (window.parent.mainFrame.document.getElementById('AlexCoverV1_0')) {
        window.parent.mainFrame.document.getElementById('AlexCoverV1_0').style.display = 'none';
        Dispaly_Select(1);
    }
}
//显示和隐藏select控件
function Dispaly_Select(val) {
    var dispalyType;
    var arrdispalyType = ["hidden", "visible"];
    var arrObjSelect = window.parent.mainFrame.document.getElementsByTagName("select");
    for (i = 0; i < arrObjSelect.length; i++) {
        arrObjSelect[i].style.visibility = arrdispalyType[val];
    }
}

