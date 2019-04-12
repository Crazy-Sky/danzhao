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

  </head>
  
  <body>
   	<div class="centercontent">
   		<div class="pageheader">
	    	<h1 class="pagetitle">单招考生成绩导出界面</h1>
	    	<span class="pagedesc">导出学生信息</span>
	    </div>
	    <div class="contentwrapper">
	    	<div class="form_group" align="center">
	            <form method="POST"  action="student/exportStuScoreExcel" >  
	            	<input type="hidden" name="deptid" value="${sessionScope.user.deptid }">
					<select name="kType">
						<option value="">全部</option>
						<option value="理科">理科</option>
						<option value="文科">文科</option>
						<option value="艺术">艺术</option>
					</select>
	                <input type="submit"   value="导出"/>
	            </form>         
	        </div>      
		</div>
   	</div>
  </body>
</html>
