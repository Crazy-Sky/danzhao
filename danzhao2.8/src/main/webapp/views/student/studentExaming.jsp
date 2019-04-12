<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="static/css/public.css">
	<link rel="stylesheet" href="static/css/default_form.css">
	<link rel="stylesheet" href="static/css/user.css">
	<link rel="stylesheet" href="static/css/student.css">
	<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="static/js/user.js"></script>
	<script type="text/javascript" src="static/js/student/stuExaming.js"></script>

  </head>
   <body>
    <div class="header">
         <div class="header_left">
             <img src="static/images/logo.png" alt="logo">
             <!--<h1>单独招生考试综合管理系统</h1>-->
             <br clear="all">
         </div>
         <div class="header_rigth">
             <span>
             	<input type="hidden" id="stuid" value="${sessionScope.student.stuid }">
                <a href="stu/outLogin">[退出]</a>
             </span>
         </div>         
    </div>
    <div class="pageheader">
	    <h1 class="pagetitle">考生考试界面</h1>
	    <span class="pagedesc">考生考试</span>
	    <input type="hidden" id="exatid" value="${sessionScope.student.exatid }"> 
        <input type="hidden" id="exatid2" value="${sessionScope.student.exatid2 }">
    </div>
    <div>
    	<h1 align="center" style="margin-bottom: 20px; margin-top: 20px;">职业素质测试题</h1>
        <div id="exat1" class="exat"></div>
        <h1 align="center" style="margin-bottom: 20px; margin-top: 20px;">技能测试题</h1>
        <div id="exat2" class="exat"></div>
    </div>
  </body>
</html>
