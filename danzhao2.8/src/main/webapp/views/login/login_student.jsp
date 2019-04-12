<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生登陆</title>
    
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
    <script type="text/javascript" src="static/js/login_student.js" ></script>

  </head>
  
  <body>
    <div class="login">
    	<div class="logo">
    	    <img src="static/images/logo1.png">
    	</div>
        <div class="default_form default_form_student" style="height: 360px; margin-top: 140px">
         	<h2>学生登陆</h2>
         	<form id="loginForm_student" onsubmit="return false;">
         		<div class="form_group">
                    <label for="username">准考证号:</label>
                    <input type="text" name="examnumber" check="required num" class="form_control">
                </div>
         		<div class="form_group">
                    <label for="password">密码:</label>
                    <input type="password" name=stupwd check="required pwd" class="form_control">
                </div>
         		<div class="form_group">
                    <label for="code">验证码:</label>
         		    <input type="text" id = "input_code" name="code" check="required notChinese" value="" class="form_code"/>  
                    <input type="button" id="code" onclick="createCode()"/> 
         		</div>
         		<div class="form_group">
                    <input type="submit" value="登     入" class="form_button">
                </div>
         	</form>
        </div>
    </div>
</body>
</html>
