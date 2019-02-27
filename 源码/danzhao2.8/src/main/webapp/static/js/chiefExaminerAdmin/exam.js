$(function() {
	
	//getStuInfoDtoByErId 获取此考场中所有正在候考的学生
	getStuInfoDtoByShowStuDtoPaging(1);
	
	//根据考生时间查询
	$("#selectStuByTestTimeBt").click(function() {
		getStuInfoDtoByShowStuDtoPaging(1);
	});
	
	$("#callingStu_bt").click(function() {
//		alert($(".stuid").eq(0).val());
		callingStu($(".stuid").eq(0).val());
	});
	
	
});
//-----------------------------------
function getStuInfoDtoByShowStuDtoPaging(nowPage) {
	if(nowPage == -1){
		alert("没有上一页了~");
		return false;
	}
	if(nowPage == 0){
		alert("这已经是最后一页了~");
		return false;
	}
//	alert($("#erid").val()+"--"+$("#testtime").val());
	$.ajax({
            async: false,
            type: "post",
            url:"chiefExaminer/getStuInfoDtoByShowStuDtoPaging",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				erid : $("#erid").val(),
				beginState : 0,
				endState : 3,
				testtime : $("#testtime").val(),
				nowPage : nowPage
			},
            success: function (message) {
				//显示分页信息
				showPage(message,"getStuInfoDtoByShowStuDtoPaging");
				
				
				//显示数据
				var stus = message.list;
				$("#stuTabs").empty();
				$("#stuCount").html(stus.length);
				var stustatus=0;
				var n=0;
				for(var i=0;i<stus.length;i++){
					var num = i+1;
					$("#stuTabs").append('<tr >'+
							'<td><input type="hidden" name="stuid" class="stuid" value="'+stus[i].stuid+'">'+num+'</td>'+
							'<td>'+stus[i].stunumber+'</td>'+
							'<td>'+stus[i].stuname+'</td>'+
							'<td>'+stus[i].stusex+'</td>'+
							'<td>'+stus[i].profname+'</td>'+
							"<td class='center'>"+
							"<input type='button' class='callingStu_bt"+stus[i].stuid+"' onclick='callingStu("+stus[i].stuid+")' value='呼叫'>" +
							"<input type='button' class='beginExam_bt"+stus[i].stuid+"' onclick='beginExam("+stus[i].stuid+")' value='开始考试'>"+
							"<input type='button' class='endExam_bt"+stus[i].stuid+"' onclick='endExam("+stus[i].stuid+")' value='结束考试'>"+
							"<input type='button' class='gradeExam_bt"+stus[i].stuid+"' onclick='gradeExam("+stus[i].stuid+")' value='评分结束'>"+
							"<input type='button' class='missExam_bt"+stus[i].stuid+"' onclick='missExam("+stus[i].stuid+")' value='缺考'>"+
							"</td>"+
							'</tr>');
					//考生特效,根据返回的状态判断，先判断是否有人在呼叫
					if(stus[i].stustatus==1){//有在呼叫了
						stustatus=1;
						n=i;
					}	
					if(stus[i].stustatus==2){//有在考试了
						stustatus=2;
						n=i;
					}
					if(stus[i].stustatus==3){//结束考试了进行评分
						stustatus=3;
						n=i;
					}
					//当有呼叫时
                    if(stustatus==1){
                    	var toph="#callingStu_bt";
			 			$('#callingStu_bt').attr('disabled',true);//顶上呼叫不可以
			 			$(toph).css("background","#ddd");
                    	for(var j=0;j<n;j++){
                    		//其他元素多不可以操作
				 			var h=".callingStu_bt"+stus[j].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var ks=".beginExam_bt"+stus[j].stuid;
				 			$('tr td').find(ks).attr('disabled',true);//考试不可以
				 			$(ks).css("background","#ddd");
				 			
				 			var jks=".endExam_bt"+stus[j].stuid;
				 			$('tr td').find(jks).attr('disabled',true);//结束考试不可以
				 			$(jks).css("background","#ddd");
				 			
				 			var pf=".gradeExam_bt"+stus[j].stuid;
				 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
				 			$(pf).css("background","#ddd");
				 			
				 		    var qk=".missExam_bt"+stus[j].stuid;
				 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
				 			$(qk).css("background","#ddd");
                    	}
				 		if(i==n){   //当前元素呼叫的
				 			var h=".callingStu_bt"+stus[i].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var k=".endExam_bt"+stus[i].stuid;
				 			$('tr td').find(k).attr('disabled',true);//结束考试不可以
				 			$(k).css("background","#ddd");	
				 			
				 			var pf=".gradeExam_bt"+stus[i].stuid;
				 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
				 			$(pf).css("background","#ddd");
				 			
				 		}
				 		else{
				 			//其他元素多不可以操作
				 			var h=".callingStu_bt"+stus[i].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var ks=".beginExam_bt"+stus[i].stuid;
				 			$('tr td').find(ks).attr('disabled',true);//考试不可以
				 			$(ks).css("background","#ddd");
				 			
				 			var jks=".endExam_bt"+stus[i].stuid;
				 			$('tr td').find(jks).attr('disabled',true);//结束考试不可以
				 			$(jks).css("background","#ddd");
				 			
				 			var pf=".gradeExam_bt"+stus[i].stuid;
				 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
				 			$(pf).css("background","#ddd");
				 			
				 		    var qk=".missExam_bt"+stus[i].stuid;
				 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
				 			$(qk).css("background","#ddd");
				 			
				 			
				 		}
				 	}
					//当有评分中时
                    else if(stustatus==3){
                    	var toph="#callingStu_bt";
			 			$('#callingStu_bt').attr('disabled',true);//顶上呼叫不可以
			 			$(toph).css("background","#ddd");
                    	for(var j=0;j<n;j++){
                    		//其他元素多不可以操作
				 			var h=".callingStu_bt"+stus[j].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var ks=".beginExam_bt"+stus[j].stuid;
				 			$('tr td').find(ks).attr('disabled',true);//考试不可以
				 			$(ks).css("background","#ddd");
				 			
				 			var jks=".endExam_bt"+stus[j].stuid;
				 			$('tr td').find(jks).attr('disabled',true);//结束考试不可以
				 			$(jks).css("background","#ddd");
				 			
				 			var pf=".gradeExam_bt"+stus[j].stuid;
				 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
				 			$(pf).css("background","#ddd");
				 			
				 		    var qk=".missExam_bt"+stus[j].stuid;
				 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
				 			$(qk).css("background","#ddd");
                    	}
				 		if(i==n){   //当前元素在考试
				 			var h=".callingStu_bt"+stus[i].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var ks=".beginExam_bt"+stus[i].stuid;
				 			$('tr td').find(ks).attr('disabled',true);//考试不可以
				 			$(ks).css("background","#ddd");
				 			
				 			var jks=".endExam_bt"+stus[i].stuid;
				 			$('tr td').find(jks).attr('disabled',true);//结束考试不可以
				 			$(jks).css("background","#ddd");
				 			
				 		    var qk=".missExam_bt"+stus[i].stuid;
				 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
				 			$(qk).css("background","#ddd");
				 			
				 		}
				 		else{
				 			//其他元素多不可以操作
				 			var h=".callingStu_bt"+stus[i].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var ks=".beginExam_bt"+stus[i].stuid;
				 			$('tr td').find(ks).attr('disabled',true);//考试不可以
				 			$(ks).css("background","#ddd");
				 			
				 			var jks=".endExam_bt"+stus[i].stuid;
				 			$('tr td').find(jks).attr('disabled',true);//结束考试不可以
				 			$(jks).css("background","#ddd");
				 			
				 			var pf=".gradeExam_bt"+stus[i].stuid;
				 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
				 			$(pf).css("background","#ddd");
				 			
				 		    var qk=".missExam_bt"+stus[i].stuid;
				 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
				 			$(qk).css("background","#ddd");
				 		}
				 	}
                  //当有考试时
                    else if(stustatus==2){
                    	var toph="#callingStu_bt";
			 			$('#callingStu_bt').attr('disabled',true);//顶上呼叫不可以
			 			$(toph).css("background","#ddd");
                    	for(var j=0;j<n;j++){
                    		//其他元素多不可以操作
				 			var h=".callingStu_bt"+stus[j].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var ks=".beginExam_bt"+stus[j].stuid;
				 			$('tr td').find(ks).attr('disabled',true);//考试不可以
				 			$(ks).css("background","#ddd");
				 			
				 			var jks=".endExam_bt"+stus[j].stuid;
				 			$('tr td').find(jks).attr('disabled',true);//结束考试不可以
				 			$(jks).css("background","#ddd");
				 			
				 			var pf=".gradeExam_bt"+stus[j].stuid;
				 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
				 			$(pf).css("background","#ddd");
				 			
				 		    var qk=".missExam_bt"+stus[j].stuid;
				 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
				 			$(qk).css("background","#ddd");
                    	}
				 		if(i==n){   //当前元素在考试
				 			var h=".callingStu_bt"+stus[i].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var ks=".beginExam_bt"+stus[i].stuid;
				 			$('tr td').find(ks).attr('disabled',true);//考试不可以
				 			$(ks).css("background","#ddd");
				 			
				 			var pf=".gradeExam_bt"+stus[i].stuid;
				 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
				 			$(pf).css("background","#ddd");
				 			
				 			var qk=".missExam_bt"+stus[i].stuid;
				 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
				 			$(qk).css("background","#ddd");
				 			
				 		}
				 		else{
				 			//其他元素多不可以操作
				 			var h=".callingStu_bt"+stus[i].stuid;
				 			$('tr td').find(h).attr('disabled',true);//呼叫不可以
				 			$(h).css("background","#ddd");
				 			
				 			var ks=".beginExam_bt"+stus[i].stuid;
				 			$('tr td').find(ks).attr('disabled',true);//考试不可以
				 			$(ks).css("background","#ddd");
				 			
				 			var jks=".endExam_bt"+stus[i].stuid;
				 			$('tr td').find(jks).attr('disabled',true);//结束考试不可以
				 			$(jks).css("background","#ddd");
				 			
				 			var pf=".gradeExam_bt"+stus[i].stuid;
				 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
				 			$(pf).css("background","#ddd");
				 			
				 		    var qk=".missExam_bt"+stus[i].stuid;
				 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
				 			$(qk).css("background","#ddd");
				 		}
				 	}
                    //正常开始
                    else{
                    	var ks=".beginExam_bt"+stus[i].stuid;
			 			$('tr td').find(ks).attr('disabled',true);//考试不可以
			 			$(ks).css("background","#ddd");
			 			
			 			var jks=".endExam_bt"+stus[i].stuid;
			 			$('tr td').find(jks).attr('disabled',true);//结束考试不可以
			 			$(jks).css("background","#ddd");
			 			
			 			var pf=".gradeExam_bt"+stus[i].stuid;
			 			$('tr td').find(pf).attr('disabled',true);//评分中不可以
			 			$(pf).css("background","#ddd");
			 			
			 		    var qk=".missExam_bt"+stus[i].stuid;
			 		    $('tr td').find(qk).attr('disabled',true);//缺考不可以
			 			$(qk).css("background","#ddd");
				 	}
                    
					
				}
				
			},
            error: function () {
				alert("获取考生失败！");
            }
	});
}

//呼叫考生
function callingStu(stuid) {
	// 前台js
	//提交
	updateStuState(stuid, 1,$("#deptid").val());
	getStuInfoDtoByShowStuDtoPaging(1);
}

//开始考试
function beginExam(stuid) {
	// 前台js
	//提交
	updateStuState(stuid, 2,$("#deptid").val());
	getStuInfoDtoByShowStuDtoPaging(1);
}

//结束考试
function endExam(stuid) {
	// 前台js
	//提交
	updateStuState(stuid, 3,$("#deptid").val());
	reload();
}
//结束评分
function gradeExam(stuid) {
	updateStuState(stuid, 5,$("#deptid").val());
	reload();
}

//缺考
function missExam(stuid) { 
	// 前台js
	//提交
	updateStuState(stuid, 4,$("#deptid").val());
	reload();
}

// 操作考生
function updateStuState(stuid, state,deptid) {
	if(stuid == null || stuid == "" || state == null || state == ""){
		return false;
	}
	
	$.ajax({
		async : false,
		type : "post",
		url : "chiefExaminer/updateStuState",
		data : {
			"stuid" : stuid,
			"state" : state,
			"deptid" : deptid,
			"erid" : $("#erid").val(),
		},
		success : function(message) {
//			alert(message+"--"+state);
			if(message == -1 && state == 5){
				alert("还有考官未评分，不能结束评分！");
			}else if(message == -2 && state == 5){
				alert("统分员未通过审核，不能结束评分！");
			}
		},error:function(message) {
			alert("操作失败！");
		}
	});
	
}

