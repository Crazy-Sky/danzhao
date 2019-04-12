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
	<script type="text/javascript" src="static/js/deptAdmin/exatManage.js"></script>
  </head>
  
  <body>
  	<div class="centercontent">
  		<div class="pageheader">
	        <h1 class="pagetitle">考试试题管理界面</h1>
	        <span class="pagedesc">管理考试试题</span>
	   	</div>
	   	<div class="contentwrapper">
	       <div class="form_group">
	       <input type="hidden" id="deptid" value="${sessionScope.user.deptid }" >
	       <input type="hidden" id="exat_nowPage" value="${sessionScope.exat_nowPage }" >
   		    <select id="exatType" >
   		    	<option value="0">全部</option>
   		    	<option value="1">职业素质测试题</option>
   		    	<option value="2">技能测试题</option>
   		    </select>
   		    <input type="button" id="selectExatBt" value="查询">
	       </div>
	       <table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
			<thead>
				<tr>
					<th class="head1">编号</th>
					<th class="head1">类别</th>
					<th class="head1">简略信息</th>
					<th class="head1">操作</th>
				</tr>
			</thead>
			<tbody id="exatTabs">
				<!-- <tr>
					<td>1</td>
					<td>职业技能题</td>
					<td>这是一道选择题</td>
					<td class="center">
						<a href="#">详细</a>  |
						<a href="#" onclick="return confirm('你确实要删除吗？')">删除</a> |
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
