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
	<script type="text/javascript" src="static/js/superAdmin/deptInfo.js"></script>

  </head>
  
  <body>
  <div class="centercontent">
		<div class="pageheader">
            <h1 class="pagetitle">系部信息管理界面</h1>
            <span class="pagedesc">管理系部信息</span>   
    	</div> 
    	<div class="contentwrapper">
    		<div class="form_group">
    			<form id="insertDeptForm" onsubmit="return false;">
    				<input type="text" name="deptname" placeholder="系部名称" check="required chinese" >
		        	<input type="text" name="profclass" placeholder="对应大类" check="required chinese" >
		        	<input type="submit" value="添加系部">
		        	<font id="deptError" color="red"></font>
    			</form>
	        	
	        </div>
			<table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
				<thead>
					<tr>
						<th class="head1">编号</th>
						<th class="head1">所属系部名称</th>
						<th class="head1">对应大类</th>
						<th class="head1">操作</th>
					</tr>
				</thead>
				<tbody id="deptInfoBody">
					<tr>
						<td>1</td>
						<td>信息工程学院</td>
						<td>信息工程类</td>
						<td class="center">
							<a href="#">修改</a>
							<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a>
						</td>
			        </tr>
			    </tbody>    
			</table>        
    	</div>
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
						<form id="updateDeptInfoForm" onsubmit="return false;">
							<input type="hidden" name="deptid">
							<div class="form_group">
			                    <label for="username">所属系部名称:</label>
			                    <input type="text" name="deptname" check="required" class="form_control">
			                </div>
			                <div class="form_group">
			                    <label for="username">对应大类:</label>
			                    <input type="text" name="profclass" check="required" class="form_control">
			                </div>
			                <div class="form_group">
			                    <input type="submit" value="保    存" class="form_button">
			                </div>
		                </form>
		            </div>
	            </div>
	        </div>		        
	    </div>
	</div>
    
</body>
</html>
