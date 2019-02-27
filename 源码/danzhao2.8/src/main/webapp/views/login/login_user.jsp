<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="static/css/login.css"/>
    <link rel="stylesheet" href="static/css/default_form.css">
	<link rel="stylesheet" href="static/css/public.css">
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="static/js/validity.js" ></script>
    <script type="text/javascript" src="static/js/zoom.js" ></script>
    <script type="text/javascript" src="static/js/verification_code.js" ></script>
    <script type="text/javascript" src="static/js/login_user.js" ></script>

  </head>
  
  <body>
    <div class="login">
    	<div class="logo">
    	    <img src="static/images/logo1.png">
    	</div>
        <div class="default_form">
         	<h2>管理员登陆</h2>
         	<form id="loginForm_user" onsubmit="return false;">
         		<div class="form_group">
                    <label for="username">账号:</label>
                    <input type="text" id="userAccount" name="userAccount" check="required email" class="form_control">
                </div>
         		<div class="form_group">
                    <label for="userpwd">密码:</label>
                    <input type="password" id="userpwd" name="userpwd" check="required pwd" class="form_control">
                </div>
         		<div class="form_group">
                    <label for="code">验证码:</label>
         		    <input type="text" id = "input_code" name="code" check="required notChinese" value="" class="form_code"/>  
                    <input type="button" id="code" onclick="createCode()"/> 
         		</div>
                <div class="form_group">
                    <label for="identity">身 &nbsp; 份:</label>
                    <select id="userrole" name="userrole" class="form_select">
                        <!-- <option value="1">超级管理员</option>
                        <option value="2">系部管理员</option>
                        <option value="3">主考官</option>
                        <option value="4">候考室管理员</option>
                        <option value="5">考官</option>
                        <option value="6">统分员</option> -->
                    </select>
                </div>
         		<div class="form_group">
                    <input id="loginForm_submit" type="submit" value="登     入" class="form_button">
                </div>
                <div class="forgotPwdBt_win">
                    <a href="views/login/resetPwd1.jsp">忘记密码？</a>
                </div>
         	</form>
        </div>
    </div>
</body>
</html>
