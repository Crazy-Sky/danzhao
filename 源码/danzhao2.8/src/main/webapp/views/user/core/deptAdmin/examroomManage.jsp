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
	<script type="text/javascript" src="static/js/deptAdmin/examroomManage.js" ></script>

  </head>
  
  <body>
    <div class="centercontent">
    	<div class="pageheader">
	    <h1 class="pagetitle">考场信息管理界面</h1>
	    <span class="pagedesc">管理考场信息</span>
    </div>
    <div class="contentwrapper">
    	<form id="insertExamroomForm" onsubmit="return false;">
    		<input type="hidden" id="deptid" name="deptid" value="${sessionScope.user.deptid}" >
	    	<div class="form_group">
		    	<select name="ertype" >
	        		<option value="0" >候考考场</option>
	        		<option value="1" >测试考场</option>
	        	</select>
	        	<input type="text" name="ername" check="required" placeholder="考场名称">
	        </div>
	        <div class="form_group" >
		    	<!--
	            	描述：后台返回专业建立多选
	            -->
	            <label>选择专业:&emsp;</label>
	            <div class="inline" id="profidsDiv">
		            <input type='checkbox' name='profids' value='专业ID'>软件技术&emsp;&emsp;
		            <input type='checkbox' name='profids' value='专业ID'>软件测试&emsp;&emsp;
	            </div>
	            <input type="submit" value="添加考场">
	        </div>
    	</form>
        <table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
			<thead>
				<tr>
					<th class="head1">编号</th>
					<th class="head1">考场名称</th>
					<th class="head1">考场类型</th>
					<th class="head1">考试专业</th>
					<th class="head1">考场负责人</th>
					<th class="head1">操作</th>
				</tr>
			</thead>
			<tbody id="examroomTabs" >
				<!-- <tr>
					<td>1</td>
					<td>1504</td>
					<td>候考考场</td>
					<td>软件测试 | 软件技术</td>
					<td>李四</td>
					<td class="center">
						<a href="javascript:void(0);" onclick="showModal()" >修改</a> | 
						<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a>
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
						<form id="updateExamroomForm" onsubmit="return false;" >
							<input type="hidden" name="erid" >
							<div class="form_group">
			                     <label for="username">考场名称:</label>
			                     <input type="text" name="ername" check="required" class="form_control">
			                 </div>
			                 <div class="form_group">
			                     <label for="username">考场类型:</label>
			                     <select id="updateExamroom" name="ertype"  class="form_control">
								      <option value="0" >候考考场</option>
		        					  <option value="1" >测试考场</option>
								 </select>
			                 </div>
			                 <div class="form_group">
			                     <div class="inline" id="updateProfidsDiv">
								      <input type='checkbox' name='profids' value='专业ID'>软件技术&emsp;&emsp;
								      <input type='checkbox' name='profids' value='专业ID'>软件测试&emsp;&emsp;
							     </div>
			                 </div>
			                 <div class="form_group">
			                     <input type="submit" value="保    存" class="form_control">
			                 </div>
							<!-- <table align="center">
	            				<tr>
								    <td>
			     						<input type="text" name="ername" check="required" placeholder="考场名称">
			     					</td>
			     					<td>
					                    <select id="updateExamroom" name="ertype"  >
								       		<option value="0" >候考考场</option>
		        							<option value="1" >测试考场</option>
								       	</select>
					                </td> 
			     				</tr>
								<tr>
			                    	<td colspan="2">
					                	<div class="inline" id="updateProfidsDiv">
								            <input type='checkbox' name='profids' value='专业ID'>软件技术&emsp;&emsp;
								            <input type='checkbox' name='profids' value='专业ID'>软件测试&emsp;&emsp;
							            </div>
					                </td>
			                	</tr>
				                <tr>
	    							<td colspan="2" align="center">
			                    		<input type="submit" value="保    存" class="form_button">
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
