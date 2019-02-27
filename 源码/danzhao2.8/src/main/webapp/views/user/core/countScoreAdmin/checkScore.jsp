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
	<link rel="stylesheet" href="static/css/checkScore.css">
	<script type="text/javascript" src="static/js/countScore/checkScore.js"></script>

  </head>
  
  <body>
    <div class="centercontent">
    	<div class="pageheader">
			<h1 class="pagetitle">审核评分界面   &nbsp; 当前考场：${sessionScope.user.ername}</h1>
			<span class="pagedesc">审核评分</span>
		</div>
		<div class="contentwrapper">
			<input type="hidden" id="erid" value="${sessionScope.user.erid }">
			<input type="hidden" id="deptid" value="${sessionScope.user.deptid }">
			<input type="hidden" id="userid" value="${sessionScope.user.userid }">
			<input type="hidden" id="stuid">
			<div class="form_group">
				<input type="button" onclick="reload()" value="刷新" />
			</div>
			<div class="form_group">
				<table class="table_notborder">
					<tr id="showStuInfoTab">
						<!-- <td>姓名：</td>
						<td>张三</td>
						<td>性別：</td>
						<td>女</td>
						<td>专业：</td>
						<td>软件技术</td>
						<td>考生号：</td>
						<td>123456754312</td>
						<td>准考证号：</td>
						<td>456789654</td> -->
					</tr>
				</table>
			</div>
			<!-- 评分标准 -->
			<div class="form_group remarks"></div>
			
			<!-- 考题1 -->
			<h3>考题一：</h3>
			<div class="exats">
				<div id="exat1_Content"></div>
				<div id="exat1_Answer"></div>
			</div>
			<!-- 考题2 -->
			</br>
			<h3>考题二：</h3>
			<div class="exats">
				<div id="exat2_Content"></div>
				<div id="exat2_Answer"></div>
			</div>
			
			<!-- 各考官的评分结果 -->
			<div id="examinerScores">
				<!-- <div class="examinerGrades"></div> -->
			</div>
			<p class="pf"><input type="button" id="submit" value="通过审核"></p>
		</div>
    </div>
  </body>
</html>
