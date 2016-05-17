/// <reference path="jquery-1.8.3-vsdoc.js" />

var _menus = {
    "menus": [
     
    {
        "menuid": "2", "icon": "icon-sys", "menuname": "权限管理",
        "menus": [
        { "menuid": "21", "menuname": "任课老师", "icon": "icon-nav", "url": "admin/teacherlist.jsp" },
        { "menuid": "22", "menuname": "班级干部", "icon": "icon-nav", "url": "admin/committeelist.jsp" },
        { "menuid": "24", "menuname": "普通学生", "icon": "icon-nav", "url": "admin/stulist.jsp" }
        ] 
    },
    {
        "menuid": "8", "icon": "icon-sys", "menuname": "页面内容",
        "menus": [
        { "menuid": "40", "menuname": "作业发布", "icon": "icon-nav", "url": "admin/worklist.jsp" },
        { "menuid": "41", "menuname": "已交作业", "icon": "icon-nav", "url": "admin/choicework.jsp" },
        { "menuid": "42", "menuname": "任务发布", "icon": "icon-nav", "url": "admin/tasklist.jsp" },
        { "menuid": "43", "menuname": "已交任务", "icon": "icon-nav", "url": "admin/choicetask.jsp" },
        { "menuid": "44", "menuname": "学院管理", "icon": "icon-nav", "url": "admin/collegelist.jsp" },
        { "menuid": "45", "menuname": "班级管理", "icon": "icon-nav", "url": "admin/classlist.jsp" },
        { "menuid": "46", "menuname": "课程管理", "icon": "icon-nav", "url": "admin/courselist.jsp" },
        { "menuid": "47", "menuname": "班级文件管理", "icon": "icon-nav", "url": "admin/classfilelist.jsp" },
//        { "menuid": "44", "menuname": "", "icon": "icon-nav", "url": "admin/base.jsp" },
//        { "menuid": "45", "menuname": "创业联盟", "icon": "icon-nav", "url": "admin/league.jsp" },
//        { "menuid": "46", "menuname": "创业导师", "icon": "icon-nav", "url": "admin/teacher.jsp" },
//        { "menuid": "47", "menuname": "企业列表", "icon": "icon-nav", "url": "admin/enterprise.jsp" },
//        { "menuid": "48", "menuname": "企业申报列表", "icon": "icon-nav", "url": "admin/companyapply.jsp" },
//        { "menuid": "491", "menuname": "申报列表", "icon": "icon-nav", "url": "admin/createapply.jsp" }, 
        ] 
    }
    ]
};

$(function () {
    InitLeftMenu();
});

