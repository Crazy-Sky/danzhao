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
	<script type="text/javascript" src="static/js/deptAdmin/testrightManage.js"></script>

  </head>
  
  <body>
    <div class="centercontent">
    	<div class="pageheader">
	    	<h1 class="pagetitle">综合素质测试权重设置界面</h1>
	    	<span class="pagedesc">设置综合素质测试权重</span>
	    </div>
	    <br>
	    <div class="return" style="text-align: left; margin-left: 30px;"><a href="javascript:history.back(-1)"><h2 style="color: #1296DB">返回上一页</h2></a> </div>
	    <div class="error" style="text-align: right; margin-right: 50px; color: red;"><h2>当前权重值不合格！(权重总和应为100分)</h2> </div>
	    <div class="contentwrapper">
	    	<input type="hidden" id="deptid" value="${sessionScope.user.deptid }">
	    	<div class="form_group">
	    		<form id="insertTestRightForm" onsubmit="return false">
	    		   <input type="hidden" name="deptid" value="${sessionScope.user.deptid }">
                   <input type="hidden" name="action" value="insert">
                   <input type="hidden" name="rightparentid" id="rightparentid" value="${sessionScope.rightparentid }">
		    	   <input type="text" name="rightname" check="required chinese" placeholder="权重名称">
		    	   <input type="text" name="rightvalue" check="required num" placeholder="权重值">
	        	   <input type="submit" value="添加权重">
	        	</form>
	        </div>
	        <table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
				<thead>
					<tr>
						<th class="head1">编号</th>
						<th class="head1">权重名称</th>
						<th class="head1">权重值</th>
						<th class="head1">父权重</th>
						<th class="head1">操作</th>
					</tr>
				</thead>
				<tbody id="testrightTabs">
					<!-- <tr>
						<td>1</td>
						<td>面试</td>
						<td>60</td>
						<td></td>
						<td class="center">
						    <a href="javascript:void(0);" onclick="showModal()" >进入</a> | 
							<a href="javascript:void(0);" onclick="showModal()" >修改</a> | 
							<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a>
						</td>
			        </tr> -->
			    </tbody>    
			</table>        
		</div>
	    <!-- 显示分页信息 -->
        <!-- <div class="row">
			分页文字信息
			<div class="col-6">
				当前<span class="pageNum">1</span>页,总<span class="pages">1</span>页,总<span class="total">1</span>条记录
			</div>
			分页条信息
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
		</div> -->
	
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
						<form id="updateTestRightForm" onsubmit="return false">
							<input type="hidden" name="rightid">
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="deptid" value="${sessionScope.user.deptid }">
							<div class="form_group">
			                    <label>权重名称:</label>
			                    <input type="text" name="rightname" check="required" class="form_control">
			                </div>
			                <div class="form_group">
			                    <label>权重对应权值:</label>
			                    <input type="text" name="rightvalue" check="required" class="form_control">
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
