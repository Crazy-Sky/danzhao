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
	<script type="text/javascript" charset="utf-8" src="static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="static/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="static/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="static/js/deptAdmin/exat.js" ></script>
	<link rel="stylesheet" type="text/css" href="static/css/exat.css" />

  </head>
  
  <body>
  	<div class="centercontent">
		<div class="pageheader">
	    	<h1 class="pagetitle">考题添加界面</h1>
	    	<span class="pagedesc">添加单个考题</span>
	    </div>
	    <div class="contentwrapper">
	    	<div class="form_group">
		    	<input type="hidden" id="deptid" value="${sessionScope.user.deptid }" >
		    	<input type="hidden" id="exatOprt" value="${sessionScope.exatOprt }" >
		    	<input type="hidden" id="exatid" value="${sessionScope.exatid }" >
		    	<div class="type_win">
					<span>类别：</span>
					<select id="insertExat_exatType" name="exattype">
						<option value="1" selected="selected" >职业素质测试题</option>
						<option value="2">技能测试题</option>
					</select>
				</div>
				<div class="left_win">
					<span>题目简略信息：</span><input type="text" style="width: 1088px" id="exatSimpleContent" >
				</div>
		    	<div class="UE_Win">
					<span>题目：</span>
					<div class="title">
						<script type="text/plain" id="exatTitle"></script>
					</div>
					<span>答案：</span>
					<div class="answer">
						<script type="text/plain" id="exatAnswer"></script>
					</div>
				</div>
				<br>
				<div class="saveBt">
					<input type="button" id="saveExatBt"  value="保存" >
				</div>
			</div>
	    </div>
	</div>
  </body>
</html>
