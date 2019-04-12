$(function() {
	// 获取学生详细信息
	var stuid = $("#stuinfo_stuid").val();
//	alert(stuid);
	showOneStuAllInfoDto(stuid);
	
	$("#updateStuInfoForm").checkForm();
	$("#updateStuInfoForm").submit(function(){
		if(isok){
			$.ajax({
	            async: false,
	            type: "post",
	            url : "student/updateOne",
	            contentType : "application/x-www-form-urlencoded; charset=utf-8",
				data:$("#updateStuInfoForm").serialize(),
	            dataType: "json",
	            success: function (message) {
					window.location.reload();
	            },
	            error: function () {
					alert("保存考生失败！");
	            }
	        });
		}
	});
	
});

function showOneStuAllInfoDto(stuid) {
	$.ajax({
		async : false,
		type : "post",
		url : "student/selectOneStuAllInfoDto",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json",
		data:{
			stuid:stuid,
		},
		success: function (stuDto) {
			
			$("#updateStuInfoForm input[name='stuid']").val(stuDto.stuid);
			$("#updateStuInfoForm input[name='stunumber']").val(stuDto.stunumber);
			$("#updateStuInfoForm input[name='stuname']").val(stuDto.stuname);
			
			if(stuDto.stusex == "男"){
				$("#updateStuInfoForm input[name='stusex']").eq(0).attr("checked","checked");
			}else if(stuDto.stusex == "女"){
				$("#updateStuInfoForm input[name='stusex']").eq(1).attr("checked","checked");
			}
			$("#updateStuInfoForm input[name='stutel1']").val(stuDto.stutel1);
			$("#updateStuInfoForm input[name='stutel2']").val(stuDto.stutel2);
			$("#updateStuInfoForm input[name='stutel3']").val(stuDto.stutel3);
			$("#updateStuInfoForm input[name='ktype']").val(stuDto.ktype);
			$("#updateStuInfoForm input[name='zgtype']").val(stuDto.zgtype);
			$("#updateStuInfoForm input[name='schoolname']").val(stuDto.schoolname);
			$("#updateStuInfoForm input[name='deptid']").val(stuDto.deptid);
			$("#updateStuInfoForm input[name='deptname']").val(stuDto.deptname);
			//根据系部获取专业
			getProfByDeptInselect(stuDto.deptid,$("#updateStuInfoForm select[name='profid']"));
			$("#updateStuInfoForm select[name='profid']").val(stuDto.profid);
			$("#updateStuInfoForm input[name='examnumber']").val(stuDto.examnumber);
			$("#updateStuInfoForm input[name='idcard']").val(stuDto.idcard);
			//获取测试考场
			getErsByDeptAndTypeInselect(stuDto.deptid,1,$("#updateStuInfoForm select[name='erid']"));
			$("#updateStuInfoForm select[name='erid']").val(stuDto.erid);
			$("#updateStuInfoForm select[name='stustatus']").val(stuDto.stustatus);
			//获取评分情况
			showGrades(stuDto.stuid);
			$("#updateStuInfoForm input[name='exatSimpleContent']").val(stuDto.exatsimplecontent);
			$("#updateStuInfoForm input[name='exatSimpleContent2']").val(stuDto.exatsimplecontent2);
			$("#updateStuInfoForm input[name='totalscore']").val(stuDto.totalscore);
		}
	});
}


function showGrades(stuid) {
	
	$.ajax({
		async : false,
		type : "post",
		url : "grade/selectGradesByStu",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json",
		data:{
			stuid:stuid,
		},
		success: function (message) {
			
			for (var i = 0; i < message.length; i++) {
				var num = i+1;
				var score = message[i].score;
//				alert(score);
				$("#user"+num+"Name").val(message[i].examinername);
				$("#user"+num+"score").val(score);
			}
		}
	});
}