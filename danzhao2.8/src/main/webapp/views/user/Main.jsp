<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>单独招生考试综合管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="static/css/public.css">
	<link rel="stylesheet" href="static/css/default_form.css">
	<link rel="stylesheet" href="static/css/user.css">
	<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.form.js" ></script>
	<script type="text/javascript" src="static/js/user.js"></script>
	<script type="text/javascript" src="static/js/Main.js"></script>
	<script type="text/javascript" src="static/js/page.js"></script>
	<script type="text/javascript" src="static/js/validity.js" ></script>

  </head>
  
  <body class="withvernav">
  	<!-- 弹窗 -->
  	<div class='mark'></div>
  	<div class="container">
  		<jsp:include page="HeaderAndMenu.jsp" />
  		<jsp:include page="core/${sessionScope.userCorePage}.jsp" />
  	</div>
  </body>
</html>
