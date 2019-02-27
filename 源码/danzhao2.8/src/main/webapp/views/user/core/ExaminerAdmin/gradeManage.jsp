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
	<script type="text/javascript" src="static/js/ExaminerAdmin/grade.js"></script>

  </head>
  
  <body>
    <div class="centercontent">
    	<div class="pageheader">
			<h1 class="pagetitle">考生评分管理界面   &nbsp; 当前考场：${sessionScope.user.ername}</h1>
			<span class="pagedesc">考生评分管理</span>
		</div>
		<div class="contentwrapper">
			<input type="hidden" id="erid" value="${sessionScope.user.erid }">
			<input type="hidden" id="deptid" value="${sessionScope.user.deptid }">
			<input type="hidden" id="userid" value="${sessionScope.user.userid }">
			<input type="hidden" id="stuid">
			<div class="form_group">
				<input type="button" onclick="reload()" value="刷新" />
			</div>
			<div class="form_group">
				<table class="table_notborder">
					<tr id="showStuInfoTab">
						<!-- <td>姓名：</td>
						<td>张三</td>
						<td>性別：</td>
						<td>女</td>
						<td>专业：</td>
						<td>软件技术</td>
						<td>考生号：</td>
						<td>123456754312</td>
						<td>准考证号：</td>
						<td>456789654</td> -->
					</tr>
				</table>
			</div>
			<div class="form_group remarks"></div>
			<div class="form_group">
				<h1 align="center" style="margin-top: 20px; margin-bottom: 20px;" id="testRight1">面试（40分）</h1>
				<div>
					<h3>题目：</h3>
					<div id="exat1_Content" class="showExat"></div>
					<h3>答案：</h3>
					<div id="exat1_Answer" class="showExat"></div>
				</div>
				<h2 align="center" style="margin-top: 20px; margin-bottom: 20px;">评分</h2>
				<table class="grade">
				      <thead>
					   <tr>
					       <th>评价项目</th>
					       <th>考核等级</th>
					   </tr>
				    </thead>
				</table>
				<table id="testRight1_table" class="grade">
					<tr>
						<td>
							1、心理素质与道德取向（20分）
						</td>
						<td class="checkScore_1">
							<font>A</font><input type="radio" value="A" name="1" />&nbsp;&nbsp;&nbsp;
							<font>B</font><input type="radio" value="B" name="1" />&nbsp;&nbsp;&nbsp;
							<font>C</font><input type="radio" value="C" name="1" />&nbsp;&nbsp;&nbsp;
							<font>D</font><input type="radio" value="D" name="1" />
						</td>
					</tr>
					<tr>
						<td>
							2、气质、兴趣与形象（20分）
						</td>
						<td class="checkScore_1">
							<font>A</font><input type="radio" value="A" name="2" />&nbsp;&nbsp;&nbsp;
							<font>B</font><input type="radio" value="B" name="2" />&nbsp;&nbsp;&nbsp;
							<font>C</font><input type="radio" value="C" name="2" />&nbsp;&nbsp;&nbsp;
							<font>D</font><input type="radio" value="D" name="2" />
						</td>
					</tr>
				</table>
				<h1 align="center" style="margin-top: 20px; margin-bottom: 20px;" id="testRight1">职业技能基础测试（60分）</h1>
				<div>
					<h3>题目：</h3>
					<div id="exat2_Content" class="showExat"></div>
					<h3>答案：</h3>
					<div id="exat2_Answer" class="showExat"></div>
				</div>
				<h2 align="center" style="margin-top: 20px; margin-bottom: 20px;">评分</h2>
				<table class="grade">
				      <thead>
					   <tr>
					       <th>评价项目</th>
					       <th>考核等级</th>
					   </tr>
				    </thead>
				</table>
				<table id="testRight2_table" class="grade">
				    
					<tr>
						<td>
							1、技能操作任务实施（30分）
						</td>
						<td class="checkScore_2">
							<font>A</font><input type="radio" value="A" name="3" />&nbsp;&nbsp;&nbsp;
							<font>B</font><input type="radio" value="B" name="3" />&nbsp;&nbsp;&nbsp;
							<font>C</font><input type="radio" value="C" name="3" />&nbsp;&nbsp;&nbsp;
							<font>D</font><input type="radio" value="D" name="3" />
						</td>
					</tr>
					<tr>
						<td>
							2、职业兴趣与态度（30分）
						</td>
						<td class="checkScore_2">
							<font>A</font><input type="radio" value="A" name="4" />&nbsp;&nbsp;&nbsp;
							<font>B</font><input type="radio" value="B" name="4" />&nbsp;&nbsp;&nbsp;
							<font>C</font><input type="radio" value="C" name="4" />&nbsp;&nbsp;&nbsp;
							<font>D</font><input type="radio" value="D" name="4" />
						</td>
					</tr>
				</table>
				<p class="pf"><input type="button" id="submit" value="提交"></p>
			</div>
		
		</div>
    </div>
  </body>
</html>
