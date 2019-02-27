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
	<script type="text/javascript" src="static/js/superAdmin/deptAdmin.js"></script>
  </head>
  
  <body>
  <div class="centercontent">
		<div class="pageheader">
		    <h1 class="pagetitle">系部管理员信息管理界面</h1>
			<span class="pagedesc">管理系部管理员信息</span>   
		</div> 
		<div class="contentwrapper">
		    <div class="form_group">
		    	<form id="deptAdminForm" onsubmit="return false;">
			        <input type="text" name="username" placeholder="姓名" check="required chinese">
			    	<input type="text" name="userphone" placeholder="联系电话" check="required phone" maxlength="11">
			    	<input type="text" name="useremail" placeholder="邮箱" check="required email">
			    	<input type="hidden" name="userrole" value="2" >
			    	<select id="deptAdmin_insert_depts" name="deptid"></select>
			    	<input type="submit" value="添加管理员">
		    	</form>
		    </div>
			<table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
				<thead>
					<tr>
						<th class="head1">编号</th>
						<th class="head1">管理员姓名</th>
						<th class="head1">联系电话</th>
						<th class="head1">所属系部名称</th>
						<th class="head1">操作</th>
					</tr>
				</thead>
				<tbody id="deptAdminInfoBody">
					<!-- <tr>
						<td>1</td>
						<td>刘德华</td>
						<td>15526232955</td>
						<td>信息工程学院</td>
						<td class="center">
							<a href="#">修改</a> | 
							<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a>
						</td>
			        </tr> -->
			    </tbody>    
			</table>
		</div>
		<!-- 弹窗 -->
		<div class="mark"></div>
		<div class="modal" onselectstart='return false;'>
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		            	<h1>信息修改</h1>
		                <a href="javascript:void(0);" class="close" onclick="hiddenModel()" >×</a>
		            </div>
		            <div class="modal-main">
						<div class="modal-body">
							<!-- 修改界面 -->
							<form id="modifyDeptAdminForm" onsubmit="return false;">
						   		<input type="hidden" name="userid">
						   		<input type="hidden" name="userrole" value="2"> <!-- 系部管理员 2 -->
						   		<div class="form_group">
			                       <label for="username">管理员姓名:</label>
			                       <input type="text" name="username" check="required chinese" class="form_control">
			                    </div>
			                    <div class="form_group">
			                        <label for="username">联系电话:</label>
			                        <input type="text" name="userphone" check="required phone" class="form_control" maxlength="11">
			                     </div>
			                     <div class="form_group">
			                        <label for="username">所属系部:</label>
			                        <select id="modifyDeptAdmin_dept" name="deptid" class="form_control"></select>
			                      </div>
			                      <div class="form_group">
			                        
			                        <input type="submit" value="修改" class="form_control">
			                      </div>
						   		<!--  
						   		<table style="height: 100px;">
						   			<tr>
						   				<td>管理员姓名:</td>
						   				<td><input type="text" name="username" check="required chinese"></td>
						   			</tr>
						   			<tr>
						   				<td>联系电话:</td>
						   				<td><input type="text" name="userphone" check="required phone"></td>
						   			</tr>
						   			<tr>
						   				<td>所属系部:</td>
						   				<td><select id="modifyDeptAdmin_dept" name="deptid"></select> </td>
						   			</tr>
						   			<tr>
						   				<td colspan="2" style="text-align: center;">
						   					<input type="submit" value="修改">
						   				</td>
						   			</tr>
						   		</table>
						   		-->
						   	</form>
			            </div>
		           	 </div>
		       	 </div>		        
		 	</div>
		</div>
		
	</div>
</body>
</html>
