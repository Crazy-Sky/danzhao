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
	<script type="text/javascript" src="static/js/deptAdmin/examinerManage.js"></script>

  </head>
  
  <body>
  	<div class="centercontent">
		<div class="pageheader">
	    	<h1 class="pagetitle">考官信息管理界面</h1>
	    	<span class="pagedesc">管理考官信息</span>
	    </div>
	    <div class="contentwrapper">
	    	<div class="form_group">
	    		<form id="insertExaminerForm" onsubmit="return false;">
	    			<input type="hidden" id="deptid" name="deptid" value="${sessionScope.user.deptid}" >
			    	<select name="userrole" >
		        		<option value="3" >主考官</option>
		        		<option value="5" >考官</option>
		        		<option value="4">候考管理员</option>
		        		<option value="6">统分员</option>
		        	</select>
		        	<input type="text" check="required chinese" name="username" placeholder="姓名">
		        	<input type="text" check="required phone" name="userphone" placeholder="联系电话" maxlength="11" >
		        	<input type="text" check="required email" name="useremail" placeholder="邮箱">
		        	<select id="insertExaminer_examrooms" name="erid" >
		        		<option value='' >考场</option>
		        	</select>
		        	<input type="submit" value="添加考官">
	        	</form>
	        </div>
	        <div class="form_group">
		    	<select id="userrole" >
		    		<option value="0">所有</option>
	        		<option value="3">主考官</option>
	        		<option value="5">考官</option>
	        		<option value="4">候考管理员</option>
	        		<option value="6">统分员</option>
	        	</select>
	        	<input type="button" id="selectExaminerByRoleBt" value="查询考官">
	        </div>
	        <table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
				<thead>
					<tr>
						<th class="head1">编号</th>
						<th class="head1">考官姓名</th>
						<th class="head1">联系电话</th>
						<th class="head1">所属考场</th>
						<th class="head1">考官类型</th>
						<th class="head1">操作</th>
					</tr>
				</thead>
				<tbody id="examinerTabs">
					<!-- <tr>
						<td>1</td>
						<td>张三</td>
						<td>12222222</td>
						<td>12222222@qq.com</td>
						<td>主考官</td>
						<td class="center">
							<a href="javascript:void(0);" onclick="showModal()" >修改</a> | 
							<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a> |
							<a href="#" onclick="return confirm('你确实要重置密码吗？')">重置密码</a>
						</td>
			        </tr> -->
			    </tbody>    
			</table>        
	        <!-- 显示分页信息 -->
	        <div class="row">
				<!-- 分页文字信息 -->
				<div class="col-6">
					当前<span class="pageNum">1</span>页,总<span class="pages">1</span>页,总<span class="total">1</span>条记录
				</div>
				<!-- 分页条信息 -->
				<div class="col-6" align="right">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li class="firstPage">
								<a href="javascript:void(0);' onclick='getTypes(0)">首页</a>
							</li>
							<li class="prevPage">
								<a href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="navigatepageNums">
								<li>
									<a href="#">1</a>
								</li>
							</li>
							<li class="nextPage">
								<a href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
							<li class="lastPage">
								<a href="javascript:void(0);' onclick='getTypes(0)">末页</a>
							</li>
						</ul>
					</nav>
				</div>
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
							<form id="updateExaminerForm" onsubmit="return false;">
								<input type="hidden" name="userid">
								<div class="form_group">
			                       <label>用户邮箱:</label>
				        		   <input type="email" name="useremail" check="required email" class="form_control">
			                    </div>
								<div class="form_group">
			                       <label>专业名称:</label>
				        		   <input type="text" name="username" check="required chinesse" class="form_control">
			                    </div>
			                    <div class="form_group">
			                       <label>联系电话:</label>
				        		   <input type="text" name="userphone" check="required phone" class="form_control" maxlength="11">
			                    </div>
			                    <div class="form_group">
			                       <label>角色:</label>
				        		   <select name="userrole" class="form_control">
									       		<option value="3">主考官</option>
								        		<option value="5">考官</option>
								        		<option value="4">候考管理员</option>
								        		<option value="6">统分员</option>
									       	</select>
			                    </div>
			                    <div class="form_group">
			                       <label>考场:</label>
				        		   <select id="updateExaminer_examrooms" name="erid" class="form_control">
								   </select>
			                    </div>
			                    <div class="form_group">
				        		   <input type="submit" value="保    存" class="form_control">
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
