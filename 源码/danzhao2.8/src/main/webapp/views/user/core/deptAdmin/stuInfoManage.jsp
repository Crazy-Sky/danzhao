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
	<link rel="stylesheet" type="text/css" href="static/css/student.css" />
	<script type="text/javascript" src="static/js/deptAdmin/stuInfo.js"></script>
	

  </head>
  
  <body>
    <div class="centercontent">
    	<div class="pageheader">
	    	<h1 class="pagetitle">学生信息界面</h1>
	    	<span class="pagedesc">学生信息</span>
	    </div>
	 <div class="contentwrapper_1">
     	<form id="updateStuInfoForm" onsubmit="return false;">
     	<input type="hidden" name="stuid" id="stuinfo_stuid" value="${sessionScope.stuinfo_stuid }">
     	<div class="col-12">
			<div class="col-4">
			    <div class="col-9">
				   <label class="leb">考生号:</label>	
			     <input type="text" name="stunumber" check="required num" readonly="readonly" >
			    </div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">姓名:</label>	
			    <input type="text" name="stuname" check="required chinese">
			    </div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">性别:</label>	
			    <input type="radio" name="stusex" value="男">男
     				&nbsp;&nbsp;
     				<input type="radio" name="stusex" value="女">女
			    </div>
			</div>
		</div>
		
		<div class="col-12">	
			<div class="col-4">
			   <div class="col-9">
				  <label class="leb">联系电话1:</label>	
			     <input type="text" name="stutel1" check="required phone" maxlength="11">
			  </div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">联系电话2:</label>	
			    <input type="text" name="stutel2" check="phone" maxlength="11">
			   </div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">最新联系电话:</label>	
			    <input type="text" name="stutel3" check="phone" maxlength="11">
			    </div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">科类:</label>	
			    <input type="text" name="ktype" check="chinese">
			   </div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">职高对口科类:</label>	
			    <input type="text" name="zgtype" check="chinese">
			    </div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">学校名称:</label>	
			    <input type="text" name="schoolname" check="chinese">
			    </div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">所属系部:</label>	
			    <input type="hidden" name="deptid" readonly="readonly">
     			<input type="text" name="deptname" readonly="readonly">
     			</div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">所属专业:</label>	
			    <select name="profid">
     				<option>软件技术</option>
     			</select>
     			</div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">考场号:</label>	
			    <select name="erid">
     				<option>1504</option>
     			</select>
     			</div>
			</div>
		</div>
		
		<div class="col-12">	
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">准考证号:</label>	
			    <input type="text" name="examnumber" readonly="readonly" check="required num">
			    </div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">身份证号:</label>	
			    <input type="text" name="idcard" check="idcard" maxlength="18">
			    </div>
			</div>
			<div class="col-4">
			  <div class="col-9">
				<label class="leb">考生状态:</label>	
			    <select name="stuStatus">
     				<option value="0">候考</option>
     				<option value="3">已考</option>
     				<option value="4">缺考</option>
     			</select>
     			</div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="col-4">
			  <div class="col-12">
				<label class="leb">考官一:</label>	
			    <input type="text" id="user1Name" readonly="readonly">
			    </div>
			</div>
			<div class="col-8">
			  <div class="col-12">
				<label class="leb">考官一的评分结果:</label>	
			    <input type="text" id="user1score" readonly="readonly">
			    </div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="col-4">
			  <div class="col-12">
				<label class="leb">考官二:</label>	
			    <input type="text" id="user2Name" readonly="readonly">
			    </div>
			</div>		
			<div class="col-5">
			  <div class="col-12">
				<label class="leb">考官二的评分结果:</label>	
			    <input type="text" id="user2score" readonly="readonly">
			    </div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="col-4">
			  <div class="col-12">
				<label class="leb">考官三:</label>	
			    <input type="text" id="user3Name" readonly="readonly">
			    </div>
			</div>
			<div class="col-5">
			  <div class="col-12">
				<label class="leb">考官三的评分结果:</label>	
			    <input type="text" id="user3score" readonly="readonly">
			    </div>
			</div>
		</div>	
			
		<div class="col-12">	
			<div class="col-12">
			  <div class="col-12">
				<label class="leb">职业素质测试题:</label>	
			    <input type="text" name="exatSimpleContent" readonly="readonly" style="width: 935px;">
			    </div>
			</div>
		</div>	
			
			<div class="col-12">
			   <div class="col-12">
			      <div class="col-12">
				     <label class="leb">技能测试题:</label>	
			         <input type="text" name="exatSimpleContent" readonly="readonly" style="width: 935px;">
			       </div>
			      </div>
			</div>
			
		<div class="col-12">	
			<div class="col-12">
			  <div class="col-12">
				<label class="leb">总成绩:</label>	
			    <input type="text" name="totalscore" readonly="readonly" style="width: 935px;">
			    </div>
			</div>
		</div>
		
		<div class="col-12" align="center">
			<input type="submit" value="修改">
		</div>
			<!--  
			<table class="student_table">
     		<tr>
     			<td>考生号</td>
     			<td><input type="text" name="stunumber" check="required num" readonly="readonly" ></td>
     			<td>姓名</td>
     			<td><input type="text" name="stuname" check="required chinese"></td>
     			<td>性别</td>
     			<td>
     				<input type="radio" name="stusex" value="男">男
     				&nbsp;&nbsp;
     				<input type="radio" name="stusex" value="女">女
     			</td>
     		</tr>
     		<tr>
     			<td>联系电话1</td>
     			<td><input type="text" name="stutel1" check="required phone" maxlength="11"></td>
     			<td>联系电话2</td>
     			<td><input type="text" name="stutel2" check="phone" maxlength="11"></td>
     			<td>最新联系电话</td>
     			<td><input type="text" name="stutel3" check="phone" maxlength="11"></td>
     		</tr>
     		<tr>
     			<td>科类</td>
     			<td><input type="text" name="ktype" check="chinese"></td>
     			<td>职高对口科类</td> 
     			<td><input type="text" name="zgtype" check="chinese"></td>
     			<td>学校名称</td>
     			<td><input type="text" name="schoolname" check="chinese"></td>
     		</tr>
     		<tr>
     			<td>所属系部</td>
     			<td>
     				<input type="hidden" name="deptid" readonly="readonly">
     				<input type="text" name="deptname" readonly="readonly">
     			</td>
     			<td>所属专业</td>
     			<td>
					<select name="profid">
     					<option>软件技术</option>
     				</select>
				</td>
				<td>考场号</td>
     			<td>
     				<select name="erid">
     					<option>1504</option>
     				</select>
     			</td>
     		</tr>
     		<tr>
     			<td>准考证号</td>
     			<td><input type="text" name="examnumber" readonly="readonly" check="required num"></td>
     			<td>身份证号</td>
     			<td><input type="text" name="idcard" check="idcard" maxlength="18"></td>
     			<td>考生状态</td>
     			<td>
     				<select name="stuStatus">
     					<option value="0">候考</option>
     					<option value="3">已考</option>
     					<option value="4">缺考</option>
     				</select>
     			</td>
     		</tr>
     		<tr>
     			<td>考官一</td>
     			<td><input type="text" id="user1Name" readonly="readonly"></td>
     			<td>考官一的评分结果</td>
     			<td><input type="text" id="user1score" readonly="readonly"></td>
     		</tr>
     		<tr>
     			<td>考官二</td>
     			<td><input type="text" id="user2Name" readonly="readonly"></td>
     			<td>考官二的评分结果</td>
     			<td><input type="text" id="user2score" readonly="readonly"></td>
     		</tr>
     		<tr>
     			<td>考官三</td>
     			<td><input type="text" id="user3Name" readonly="readonly"></td>
     			<td>考官三的评分结果</td>
     			<td><input type="text" id="user3score" readonly="readonly"></td>
     		</tr>
     		<tr>
     			<td>职业素质测试题</td>
     			<td colspan="5"><input type="text" name="exatSimpleContent" readonly="readonly" style="width: 935px;"></td>
     		</tr>
     		<tr>
     			<td>技能测试题</td>
     			<td colspan="5"><input type="text" name="exatSimpleContent2" readonly="readonly" style="width: 935px;"></td>
     		</tr>
     		<tr>
     			<td>总成绩</td>
     			<td colspan="5"><input type="text" name="totalscore" readonly="readonly" style="width: 935px;"></td>
     		</tr>
     		
     		<tr>
     			<td colspan="6" ><input type="submit" value="修改"></td>
     		</tr>
     	</table>
     	-->
     	</form>
     </div>
    </div>
  </body>
</html>
