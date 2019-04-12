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
	<script type="text/javascript" src="static/js/chiefExaminerAdmin/exam.js"></script>

  </head>
  
  <body>
  	<div class="centercontent">
		<div class="pageheader">
	    	<h1 class="pagetitle">考试管理界面   &nbsp; 当前考场：${sessionScope.user.ername}</h1>
	    	<span class="pagedesc">考生操作</span>
        </div>
        <input type="hidden" id="erid" value="${sessionScope.user.erid }">
        <input type="hidden" id="deptid" value="${sessionScope.user.deptid }">
        <div class="contentwrapper">
        <div class="form_group_2">
        	<input type="button" id="callingStu_bt" value="呼叫" style="width: 100%"/>
        </div>
        <div class="form_group_2">
        	<input type="button" value="刷新" onclick="reload()" style="width: 100%"/>
        </div>
        <div class="form_group_1">
        	<div style="float: left;">
        		<h3 style="line-height: 40px;">考试剩余人数：<span id="stuCount">200</span></h3>
        	</div>
        	<div style="float: right;line-height: 40px;">
        		<label>按场次查询</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		   	<select id="testtime">
       		   	   <option value="1">上午</option>
       		   	   <option value="2">下午</option>
       		   	   <option value="3">晚上</option>
       		   	</select>
        	   	<input type="button" id="selectStuByTestTimeBt" value="确定">
	        </div>
	    </div>
        <table cellpadding="0" cellspacing="0" border="0" id="table2" class="stdtable stdtablecb">
			<thead>
				<tr>
					<th class="head1">编号</th>
					<th class="head1">考生号</th>
					<th class="head1">姓名</th>
					<th class="head1">性别</th>
					<th class="head1">专业</th>
					<th class="head1">操作</th>
				</tr>
			</thead>
			<tbody id="stuTabs"></tbody>
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
	  </div>
	</body>
</html>
