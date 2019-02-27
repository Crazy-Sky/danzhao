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
	<script type="text/javascript" src="static/js/public/accountInfo.js"></script>
    
  </head>
  
  <body>
  <div class="centercontent">
    <div class="pageheader">
        <h1 class="pagetitle">账号信息设置</h1>
        <span class="pagedesc">查看、修改账号信息</span>
    </div>
    <div class="contentwrapper" align="center">
    	<form id="AccountInfoForm" onsubmit="return false;">
    		<input type="hidden" name="userid" id="accountInfoForm_userid" value="${sessionScope.user.userid}">
	        <table align="center" class="default_table">
	            <tr>
	                <td>用户名称:</td>
	                <td><input type="text" name="username"></td>
	            </tr>
	            <tr>
	                <td>用户密码:</td>
	                <td><input type="password" name="userpwd"></td>
	            </tr>
	            <tr>
	                <td>用户电话:</td>
	                <td><input type="text" readonly="readonly" name="userphone"></td>
	            </tr>
	            <tr>
	                <td>用户邮箱:</td>
	                <td><input type="text" readonly="readonly" name="useremail"></td>
	            </tr>
	            <tr>
	                <td>用户角色:</td>
	                <td>
	                	<select id="AccountInfo_role" name="userrole" ></select>
	                </td>
	            </tr>
	            <tr>
	                <td>所在院部:</td>
	                <td>
	                	<select id="AccountInfo_dept" name="deptid"></select>
	                </td>
	            </tr>
	            <tr>
	                <td></td>
	                <td colspan="2"><input type="submit" value="保存" /></td>
	            </tr>
	        </table>
        </form>
    </div>
   </div>
</body>

</html>
