<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doorSticker.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="static/js/deptAdmin/doorSticker.js"></script>
	<script type="text/javascript" src="static/js/print.js"></script>
  </head>
  
  <body>
	<div class="centercontent">
		<div class="pageheader">
        <h1 class="pagetitle">生成考场门贴界面</h1>
        <span class="pagedesc">生成考场门贴</span>
        </div>
        <div class="contentwrapper" align="center">
        	<form action="word/exportDoorSticker" method="post">
        	<table align="center" class="doorSticker">
        		<!--startprint-->
        		<tr>
        		    <td>标题：</td>
        			<td align="center" >
        				<input type="text" name="title" id="title" value="2018年单独招生综合素质测试" />
        			</td>
        		</tr>
        		<tr>
        			<td>系部：</td>
        			<td>
        				<input type="hidden" name="dept" id="hd_dept">
        				<select id="deptSelect" >
        					<option>信息工程大类</option>
        				</select>
        			</td>
        		</tr>
        		<tr>
        			<td>教室：</td>
        			<td>
        				<!-- <input type="hidden" name="examroom" id="hd_examroom"> -->
        				<select id="examroomSelect" name="examrooms" multiple="multiple">
        					<option>1504</option>
        				</select>
        			</td>
        		</tr>
        		<!--endprint-->
        		<tr>
        			<td colspan="2" align="center">
        				<input type="submit" value="打印" style="margin-left: 30%;margin-top: 20px">
        			</td>
        		</tr>
        	</table>
        	</form>
	     </div>
	</div>
  </body>
</html>
