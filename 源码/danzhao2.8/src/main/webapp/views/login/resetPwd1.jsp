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
			<h1 style="font-family: '华文行楷'; float:left; line-height: 59px; color: #999999"" align="center">→2.设置密码</h1>
		</div>
		<br>
		<div>
			<div style="margin-top: 40px;" align="center">
				<form action="reset/resetNext" method="post" id="resetPwdForm1">
				
				    <div class="resetTable">
				       <font style="margin-right: 45px">邮箱：</font>
				       <input type="text" check="required email" name="email">
				    </div>
				    <table align="center" class="resetTable">
				    	<!--  <tr>
				    		<td></td>
				    		<td></td>
				    	</tr>-->
				    	<tr>
				    		<td colspan="2">
				    			<input type="text" name="code" placeholder="验证码">
				    			<input id="getCodeBt"  type="button" value="获取验证码" />
				    			<input id="realCode"  type="hidden" />
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="2">
				    		<center>
				    			<input type="submit" value="验&nbsp;&nbsp;证">
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
