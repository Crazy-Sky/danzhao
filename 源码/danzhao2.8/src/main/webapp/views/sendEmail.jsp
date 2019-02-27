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
  	<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
  </head>
  
  <body>
    <form id="sendEmail" onsubmit="return false;">
    	收件人：<input type="text" name="recipientaccount" ><br>
  		邮箱主题：<input type="text" name="emailsubject"><br>
  		邮箱内容：<input type="text" name="emailcontent"><br>
  		<input type="submit" >
    </form>
    </body>
	<script type="text/javascript">
		$(function() {
			$("#sendEmail").submit(function() {
				$.ajax({
					type:"post",
					async: false,
					url : "user/sendEmail",
					contentType : "application/x-www-form-urlencoded; charset=utf-8",
	            	dataType: "json",
					data : $("#sendEmail").serialize(),
					success : function(message) {
						window.location.reload();
					}
				})
			});
		});
	</script>
</html>
