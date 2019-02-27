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
	<script type="text/javascript" src="static/js/deptAdmin/studentManege.js" ></script>

  </head>
  
  <body>
    <div class="centercontent">
    	<div class="pageheader">
	    	<h1 class="pagetitle">考生信息管理界面</h1>
	    	<span class="pagedesc">管理考生信息</span>
	    	<input type="hidden" id="deptid" value="${sessionScope.user.deptid }" >
	    	<input type="hidden" id="stu_nowPage" value="${sessionScope.stu_nowPage }" >
	    </div>
    	<div class="contentwrapper">
        <div class="form_group">
       		<form id="selectStuForm" onsubmit="return false">
       		   <label>查询</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		   <input type="radio" name="insertAccord" checked="checked" value="stuname">姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		   <input type="radio" name="insertAccord" value="profname">专业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	    	   <input type="text" name="insertAccordValue">
        	   <input type="submit" value="确定">
        	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	   <input type="button" id="createSignatureTableBt" value="生成考生签名表">
        	</form>
        </div>
         <table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
			<thead>
				<tr>
					<th class="head1">编号</th>
					<th class="head1">姓名</th>
					<th class="head1">性别</th>
					<th class="head1">准考证号</th>
					<th class="head1">考生号</th>
					<th class="head1">专业</th>
					<th class="head1">操作</th>
				</tr>
			</thead>
			<tbody id="StuInfoTabs" >
				<!-- <tr>
					<td>1</td>
					<td>李四</td>
					<td>男</td>
					<td>12345</td>
					<td>3444444444444</td>
					<td>软件技术</td>
					<td class="center">
						<a href="javascript:void(0);" onclick="showModal()">修改</a> | 
						<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a>
					</td>
		        </tr> -->
		    </tbody>    
		</table> 
	   </div>
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
  </body>
</html>
