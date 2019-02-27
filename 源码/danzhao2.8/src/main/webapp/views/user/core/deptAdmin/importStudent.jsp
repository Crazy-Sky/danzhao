<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'importStudent.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="static/js/deptAdmin/importStu.js" ></script>

  </head>
  
  <body>
   	<div class="centercontent">
   		<div class="pageheader">
	    	<h1 class="pagetitle">单招考生信息导入界面</h1>
	    	<span class="pagedesc">导入学生信息</span>
	    </div>
	    <div class="contentwrapper">
	    	<div class="form_group" align="center">
	            <form method="POST"  enctype="multipart/form-data" id="form1" onsubmit="return false;">  
	                上传文件:   
	                <input id="upfile" type="file" name="upfile">&emsp;&emsp;  
	                <a class="form_button" id="btn">导入</a>
	                <a href="student/exportStuToExcel" class="form_button">导出</a>
	                <a href="student/downExcelToStuModel" class="form_button">下载考生模板</a>
	            </form>         
	        </div>      
		</div>
   	</div>
  </body>
</html>
