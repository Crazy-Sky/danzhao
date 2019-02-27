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
	<script type="text/javascript" src="static/js/deptAdmin/levelrightManage.js"></script>

  </head>
  
  <body>
    <div class="centercontent">
    	<div class="pageheader">
    		<h1 class="pagetitle">评定等级权重设置界面</h1>
	    	<span class="pagedesc">设置评定等级权重</span>
	    </div>
	    <div class="contentwrapper">
	    	<input type="hidden" id="deptid" value="${sessionScope.user.deptid }">
	    	<div class="form_group">
	    		<form id="insertLevelForm" onsubmit="return false">
	    			<input type="hidden" name="action" value="insert">
	    			<input type="hidden" name="deptid" value="${sessionScope.user.deptid }">
		    	   <input type="text" name="levelname" check="required" placeholder="权重名称">
		    	   <input type="text" name="levelvalue" check="required" placeholder="权重对应权值">
		    	   <input type="text" name="remark" check="required" placeholder="备注">
	        	   <input type="submit" value="添加权重">
	        	</form>
	        </div>
	        <div class="showNull">
	           <h2>未找到数据~</h2>
	        </div>
	        <table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
				<thead>
					<tr>
						<th class="head1">编号</th>
						<th class="head1">权重名称</th>
						<th class="head1">权重对应权值</th>
						<th class="head1">备注</th>
						<th class="head1">操作</th>
					</tr>
				</thead>
				<tbody id="levelTabs">
					<tr>
						<td>1</td>
						<td>A</td>
						<td>100</td>
						<td>满分</td>
						<td class="center">
							<a href="javascript:void(0);" onclick="showModal()" >修改</a> | 
							<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a>
						</td>
			        </tr>
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
							<form id="updateLevelForm" onsubmit="return false;">
								<input type="hidden" name="action" value="update">
								<input type="hidden" name="levelrightid">
								<input type="hidden" name="deptid" value="${sessionScope.user.deptid }">
								<div class="form_group">
				                    <label>权重名称:</label>
				                    <input type="text" name="levelname" check="required" class="form_control">
				                </div>
				                <div class="form_group">
				                    <label>权重对应权值:</label>
				                    <input type="text" name="levelvalue" check="required" class="form_control">
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
    </div>
  </body>
</html>
