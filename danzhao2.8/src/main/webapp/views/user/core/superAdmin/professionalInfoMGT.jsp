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
	<script type="text/javascript" src="static/js/Main.js"></script>
	<script type="text/javascript" src="static/js/superAdmin/profClass.js"></script>
	
  </head>
  
  <body>
  <div class="centercontent">
		<div class="pageheader">
            <h1 class="pagetitle">系部专业信息管理界面</h1>
            <span class="pagedesc">管理系部专业信息</span>   
    	</div> 
    	<div class="contentwrapper">
	        <div class="form_group">
		        <form id="profInsertForm" onsubmit="return false;">
					<input type="text" name="profnumber" placeholder="专业代码" check="required num" >
		        	<input type="text" name="profname" placeholder="专业名称" check="required">
		        	<select id="insert_deptInfo" name="deptid"></select>
		        	<input type="submit" value="添加专业">
		         </form>
        	</div>
        	<div class="form_group">
		       	<select id="select_deptInfo"></select>
           		<input id="select_deptInfoBt" type="button" value="查询">
           	</div>
			<table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
				<thead>
					<tr>
						<th class="head1">编号</th>
						<th class="head1">专业名称</th>
						<th class="head1">专业代码</th>
						<th class="head1">所属系部名称</th>
						<th class="head1">操作</th>
					</tr>
				</thead>
				<tbody id="profInfoBody">
					<!-- <tr>
						<td>1</td>
						<td>软件技术</td>
						<td>6201</td>
						<td>信息工程学院</td>
						<td class="center">
							<a href="#">修改</a> | 
							<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a>
						</td>
			        </tr> -->
			    </tbody>    
			</table>        
       </div>
       
       
       <!-- 修改界面 -->
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
							<form id="modifyProfForm" onsubmit="return false;">
				        		<input type="hidden" name="profid">
				        		<div class="form_group">
			                       <label>专业名称:</label>
				        		   <input type="text" name="profname" check="required chinese" class="form_control">
			                    </div>
			                    <div class="form_group">
			                        <label>专业代码:</label>
				        			<input type="text" name="profnumber" check="required num" class="form_control">
			                    </div>
			                    <div class="form_group">
			                        <label>所属系部:</label>
				        			<select id="modifyProf_dept" name="deptid" class="form_control"></select>
			                    </div>
			                    <div class="form_group">
			                        <input type="submit" value="修改" class="form_control">
			                    </div>
				        		<!--  <table style="height: 100px;">
				        			<tr>
				        				<td>专业名称:</td>
				        				<td><input type="text" name="profname" check="required chinese"></td>
				        			</tr>
				        			<tr>
				        				<td>专业代码:</td>
				        				<td><input type="text" name="profnumber" check="required num" ></td>
				        			</tr>
				        			<tr>
				        				<td>所属系部:</td>
				        				<td><select id="modifyProf_dept" name="deptid"></select></td>
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
