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
	<script type="text/javascript" src="static/js/waitRoomAmin/waitRoom.js"></script>
	
  </head>
  
  <body>
  	<div class="centercontent">
  		<input type="hidden" id="erid" value="${sessionScope.user.erid }">
  		<audio id="myAudio" controls="controls" autoplay="autoplay" hidden="hidden" loop="loop" >
			<source src="wav/${applicationScope.audioFileName }" type="audio/mpeg">
		</audio>
		<div class="pageheader">
			<p class="showMessage"></p>
			<h1 class="pagetitle">排队信息界面   &nbsp; 当前考场：${sessionScope.user.ername}</h1>
			<span class="pagedesc">排队信息</span>
			<div class="andioController">
				<div onclick="bf();"><span id="bfAndStop">播放/暂停</span></div>
				<div onclick="rbf();"><span id="resetBf">重新播放</span></div>
			</div>
			
		</div>
		<div class="contentwrapper">
			
			<table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
				<thead>
					<tr>
						<th class="head1">编号</th>
						<th class="head1">考生号</th>
						<th class="head1">姓名</th>
						<th class="head1">性别</th>
						<th class="head1">专业</th>
						<th class="head1">测试考场</th>
					</tr>
				</thead>
				<tbody id="callingTabs"></tbody>
			</table>
		</div>
  	</div>
  </body>
</html>
