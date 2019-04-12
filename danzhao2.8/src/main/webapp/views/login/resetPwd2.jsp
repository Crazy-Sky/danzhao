<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="static/css/public.css">
    <link rel="stylesheet" href="static/css/default_form.css">
    <link rel="stylesheet" href="static/css/user.css">
    <link rel="stylesheet" href="static/css/login.css">
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="static/js/user.js"></script>
	<script type="text/javascript" src="static/js/resetPwd.js"></script>
	<script type="text/javascript" src="static/js/validity.js" ></script>

  </head>
  
  <body>
		<div style="width: 100%; width: 100%; height: 59px;">
			<h1 style="font-family: '华文行楷'; margin-left: 42%; float:left; line-height: 59px; color: #387BEE" align="center">1.身份验证</h1>
			<h1 style="font-family: '华文行楷'; float:left; line-height: 59px; color: #387BEE"" align="center">→2.设置密码</h1>
		</div>
		<br>
		
		<div>
			<div style="margin-top: 40px;" align="center">
				<form id="resetPwdForm2" onsubmit="return false;">
					<input type="hidden" name="useremail" value="${sessionScope.email }">
				    <table align="center" class="resetTable">
				    	<tr>
				    		<td style="width: 40%">新密码：</td>
				    		<td style="width: 60%"><input type="password" name="userpwd"></td>
				    	</tr>
				    	<tr>
				    		<td>确认密码：</td>
				    		<td><input type="password" name="reuserpwd"></td>
				    	</tr>
				    	<tr>
				    		<td colspan="2">
				    			<center>
				    				<input type="submit" value="确认">
				    			</center>
				    		</td>
				    	</tr>
               
                    </table>
                    <a href="user/goUserLogin" style="font-size: 18px">返回登陆界面</a>
				</form>
			</div>
		</div>
	</body>
</html>
