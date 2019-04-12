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
	<script type="text/javascript" src="static/js/headerAndMenu.js"></script>
	<title></title>

  </head>
  
 <body class="withvernav">
     <div class="header">
         <div class="header_left">
             <img src="static/images/logo_no.png" alt="logo">
             <!--<h1>单独招生考试综合管理系统</h1>-->
             <br clear="all">
         </div>
         <div class="header_rigth">
             <span>
                 <font id="sessionUserName">${sessionScope.user.username}</font>
                 &nbsp;&nbsp;<font id="sessionUserRole" roleid="${sessionScope.user.userrole}">${sessionScope.user.rolename}</font>
				 &nbsp;&nbsp;<a href="user/outLogin">[退出]</a>
             </span>
         </div>         
     </div>
     <div class="side_nav">
     <input type="hidden" id='menu_1_selected' value='${sessionScope.menuSelected[0]}' />
     <input type="hidden" id='menu_2_selected' value='${sessionScope.menuSelected[1]}' />
            <ul id="menu_ul">
                <li title="院部管理">
                    <a class="oneMenu">
                        <img src="static/images/admin.png" width="12px" height="12px" alt="admin">
                        <span class="text">院部信息管理</span>
                    </a>
                    <span class="arrow"></span>
                    <ul id="admin">
                        <li title="院部信息管理">
                            <a href="user/UserSkip?page=deptInfoMGT&menuSelected[0]=0&menuSelected[1]=0">院部信息管理</a>
                        </li>
                        <li title="院部专业信息管理">
                            <a href="user/UserSkip?page=professionalInfoMGT&menuSelected[0]=0&menuSelected[1]=1">院部专业信息管理</a>
                        </li>
                        <li title="院部信息管理">
                            <a href="user/UserSkip?page=deptAdminInfoMGT&menuSelected[0]=0&menuSelected[1]=2">院部管理员信息管理</a>
                        </li>
                    </ul>
                </li>
                <li title="设置">
                    <a class="oneMenu">
                        <img src="static/images/site.png" width="12px" height="12px" alt="site">
                        <span class="text">设置</span>
                    </a>
                    <span class="arrow"></span>
                    <ul id="site">
                        <li title="账号信息设置">
                            <a href="user/UserSkip?page=accountInfoSite&menuSelected[0]=1&menuSelected[1]=0">账号信息设置</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <a class="togglemenu"></a>
        </div>
 </body>
</html>
