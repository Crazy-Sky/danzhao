$(function() {
//	alert($("#erid").val());
	//获取考生
	$.ajax({
		 async: false,
         type: "post",
         url:"examiner/selectExamingStuByEr",
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType: "json",
		 data:{
			 erid : $("#erid").val()
		 },
         success: function (message) {
			$("#showStuInfoTab").empty();
			$("#stuid").val(message.stuid);
			$("#showStuInfoTab").append("<td>姓名：</td>" +
						"<td>"+message.stuname+"</td>" +
						"<td>性別：</td>" +
						"<td>"+message.stusex+"</td>" +
						"<td>专业：</td>" +
						"<td>"+message.profname+"</td>" +
						"<td>考生号：</td>" +
						"<td>"+message.stunumber+"</td>" +
						"<td>准考证号：</td>" +
						"<td>"+message.examnumber+"</td>");
		}
	});
	
	//获取等级权重提示信息
	getLevelRightRemarksByDept($("#deptid").val(), $(".remarks"));
	
	// 获取考题
	getExat1ByStu($("#stuid").val());
	getExat2ByStu($("#stuid").val());
	
	//获取此学生 考官的评分情况
	$.ajax({
		 async: false,
         type: "post",
         url:"grade/selectGradesByStu",
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType: "json",
		 data:{
			 stuid : $("#stuid").val()
		 },
         success: function (message) {
			$("#examinerScores").empty();
			for (var i = 0; i < message.length; i++) {
				var str = getTestRightsByDept($("#deptid").val(), message[i]);
//				alert(str);
				// 显示考官评分信息
				$("#examinerScores").append("<div class='examinerGrades'>" +
						"<p><span>考官姓名："+message[i].examinername+"</span><span>角色："+message[i].rolename+"</span></p>" +
						str +
						"</div");
			}
			//显示各个考官的评分情况
			for (var i = 0; i < message.length; i++) {
				for (var j = 0; j < message[i].result1_level.length; j++) {
					var result1_testright = message[i].result1_testright;
					var result1_level = message[i].result1_level;
//					alert($("#examinerScores input[type='radio'][name='"+result1_testright[j]+"'][levelrightid='"+result1_level[j]+"']").val());
					$("#examinerScores input[type='radio'][name='"+result1_testright[j]+"'][levelrightid='"+result1_level[j]+"'][examinerid='"+message[i].examinerid+"']").attr("checked",'checked'); 
				}
			}
			
		}
	});

	$("#submit").click(function() {
		$.ajax({
			 async: false,
	         type: "post",
	         url:"countScore/passGrade",
	         dataType: "json",
			 data:{
				 "userid" : $("#userid").val(),
			 },
	         success: function (message) {
				alert("已通过审核");
				reload();
			}, error: function(error) {
				alert("操作失败！");
			}
		});
	});
	
});

//----------------------------------

// 获取职业素质测试题
function getExat1ByStu(stuid) {
	$.ajax({
		 async: false,
         type: "post",
         url:"examiner/selectExat1ByStu",
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType: "json",
		 data:{
			 stuid : stuid
		 },
         success: function (message){
			$("#exat1_Content").html("题目：</br>"+message.exatcontent);
			$("#exat1_Answer").html("答案：</br>"+message.exatanswer);
		}
	});
}

//获取技能测试题
function getExat2ByStu(stuid) {
	$.ajax({
		 async: false,
         type: "post",
         url:"examiner/selectExat2ByStu",
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType: "json",
		 data:{
			 stuid : stuid
		 },
         success: function (message) {
			$("#exat2_Content").html("题目：</br>"+message.exatcontent);
			$("#exat2_Answer").html("答案：</br>"+message.exatanswer);
		}
	});
}

//获取等级权重提示
function getLevelRightRemarksByDept(deptid, div) {
	$.ajax({
		 async: false,
         type: "post",
         url:"examiner/selectLevelRightsByDept",
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType: "json",
		 data:{
			 deptid : deptid
		 },
         success: function (message) {
			div.empty();
			
			var str = "";
			for (var i = 0; i < message.length; i++) {
				var remark = message[i].remark;
				if(remark == "" || remark == null){
					remark = "无";
				}
				str += "<font>"+message[i].levelname+"：</font><font>"+remark+"</font>&nbsp;&nbsp;&nbsp;&nbsp;";
//				div.append("<h3><font>"+message[i].levelname+"：</font><font>"+remark+"</font></h3>");
			}
			div.append("<h3>评定等级说明："+str+"</h3>");
			
		}
	});
}

//获取等级权重
function getLevelRightsByDept(deptid,testRightId,result_level) {
	var str = "";
	$.ajax({
		 async: false,
         type: "post",
         url:"examiner/selectLevelRightsByDept",
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType: "json",
		 data:{
			 deptid : deptid
		 },
         success: function (message) {
			for (var i = 0; i < message.length; i++) {
				for (var j = 0; j < result_level.length; j++) {
					if(message[i].levelrightid == result_level[j]){
						
					}
				}
				str += "<label>"+message[i].levelname+"<input type='radio' value='"+message[i].levelrightid+"' examinerid='"+examinerid+"' levelrightid='"+message[i].levelrightid+"' name='"+testRightId+"' /></label>&nbsp;&nbsp;&nbsp;";
			}
		}
	});
//	alert(str);
	return str;
}

//获取评分权重 并显示
function getTestRightsByDept(deptid, examinergarde) {
	var str = "";
	$.ajax({
		 async: false,
         type: "post",
         url:"examiner/selectTestRightsByDept",
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType: "json",
		 data:{
			 deptid : deptid
		 },
         success: function (message) {
			
			var gradeTitle = "<table class='grade'>" +
								"<thead>" +
									"<tr><th>评价项目</th>" +
									"<th>考核等级</th></tr>" +
								"</thead>" +
							"</table>" ;
			var table1 = "";
			var table2 = "";
			var num1 = 1, num2 = 1;
			for (var i = 0; i < message[1].length; i++) {
//				var level = getLevelRightsByDept($("#deptid").val(),message[1][i].rightid, examinergarde);
				if(message[1][i].rightparentid == message[0][0].rightid){
					var result1_level = examinergarde.result1_level;
					var result1_testright = examinergarde.result1_testright;
					for (var j = 0; j < result1_level.length; j++) {
						if(message[1][i].rightid == result1_testright[j]){
							level = result1_level[j];
						}
					}
					table1 += "<tr>" +
							"<td>"+num1+"、"+message[1][i].rightname+"("+message[1][i].rightvalue+")" +
							"</td><td class='checkScore_1'>" +
							""+level+"</td></tr>";
				}else if(message[1][i].rightparentid == message[0][1].rightid){
					var result2_level = examinergarde.result2_level;
					var result2_testright = examinergarde.result2_testright;
					for (var j = 0; j < result2_level.length; j++) {
						if(message[1][i].rightid == result2_testright[j]){
							level = result2_level[j];
						}
					}
					table2 += "<tr>" +
							"<td>"+num2+"、"+message[1][i].rightname+"("+message[1][i].rightvalue+")" +
							"</td><td class='checkScore_2'>" +
							""+level+"</td></tr>";
				}
			}
			
			str += "<div class='form_group'>" +
						"<h1 align='center' style='margin-top: 20px; margin-bottom: 20px;'>"+message[0][0].rightname+"("+message[0][0].rightvalue+"分)"+"</h1>" +
						gradeTitle +
						"<table examiner='"+examinergarde.examinerid+"' class='grade testRight1_table'>" +
						table1 +
						"</table>" +
						"<h1 align='center' style='margin-top: 20px; margin-bottom: 20px;' id='testRight1'>"+message[0][1].rightname+"("+message[0][0].rightvalue+"分)"+"</h1>"+
						gradeTitle +
						"<table examiner='"+examinergarde.examinerid+"' class='grade testRight2_table'>" +
						table2 +
						"</table>" +
					"</div>";
//			alert(str);
		}
	});
	return str;
}