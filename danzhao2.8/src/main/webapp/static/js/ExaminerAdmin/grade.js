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
			//根据考生获取其抽取的考题
			getExat1ByStu(message.stuid);
			getExat2ByStu(message.stuid);
		}
	});
	
	//获取等级权重提示信息
	getLevelRightRemarksByDept($("#deptid").val(), $(".remarks"));
	
	//获取评分权重 并显示
	getTestRightsByDept($("#deptid").val());
	
	
	//提交评分
	$("#submit").click(function(){
		var checkScore_1 = [];
		var checkScore_2 = [];
		var str1, str2;
		$(".checkScore_1 input[type='radio']:checked").each(function(){
			str1 = $(this).attr('name')+":"+$(this).val();
//			alert(str1);
			checkScore_1.push(str1);
		});
//		alert(checkScore_1);
		$(".checkScore_2 input[type='radio']:checked").each(function(){
			str2 = $(this).attr('name')+":"+$(this).val();
			checkScore_2.push(str2);
		});
//		alert(checkScore_2);
		$.ajax({
			 async: false,
	         type: "post",
	         url:"examiner/gradingStu",
	         dataType: "json",
			 data:{
				 "sroce1" : checkScore_1.join(),
				 "sroce2" : checkScore_2.join(),
				 "examinerid" : $("#userid").val(),
				 "stuid" : $("#stuid").val(),
			 },
	         success: function (message) {
				alert("评分成功！");
				reload();
			 },
			 error : function(message) {
				alert("评分失败！");
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
         success: function (message) {
			$("#exat1_Content").html(message.exatcontent);
			$("#exat1_Answer").html(message.exatanswer);
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
			$("#exat2_Content").html(message.exatcontent);
			$("#exat2_Answer").html(message.exatanswer);
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
function getLevelRightsByDept(deptid,testRightId) {
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
				str += "<font>"+message[i].levelname+"</font><input type='radio' value='"+message[i].levelrightid+"' name='"+testRightId+"' />&nbsp;&nbsp;&nbsp;";
			}
		}
	});
//	alert(str);
	return str;
}

//获取评分权重 并显示
function getTestRightsByDept(deptid) {
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
			$("#testRight1").html(message[0][0].rightname+"("+message[0][0].rightvalue+"分)");
			$("#testRight2").html(message[0][1].rightname+"("+message[0][0].rightvalue+"分)");
			$("#testRight1_table").empty();
			$("#testRight2_table").empty();
			var num1 = 1, num2 = 1;
			for (var i = 0; i < message[1].length; i++) {
				var level = getLevelRightsByDept($("#deptid").val(),message[1][i].rightid);
				if(message[1][i].rightparentid == message[0][0].rightid){
					$("#testRight1_table").append("<tr>" +
							"<td>"+num1+"、"+message[1][i].rightname+"("+message[1][i].rightvalue+")"+"" +
							"</td><td class='checkScore_1'>" +
							""+level+"</td></tr>");
				}else if(message[1][i].rightparentid == message[0][1].rightid){
					$("#testRight2_table").append("<tr>" +
							"<td>"+num2+"、"+message[1][i].rightname+"("+message[1][i].rightvalue+")"+"" +
							"</td><td class='checkScore_2'>" +
							""+level+"</td></tr>");
				}
			}
		}
	});
}

