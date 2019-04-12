
$(function() {
	// 获取专业显示在CheckBox上
//	selectProfByDeptIdInCheckbox($("#profidsDiv"),$("#deptid").val());
	
//	selectProfByDeptIdInCheckbox($("#updateProfidsDiv"),$("#deptid").val());
	
	// 获取测试考场显示在CheckBox上
	selectErsByDeptAndTypeInInCheckbox($("#testRoomIdsDiv"),$("#deptid").val(),1);
	selectErsByDeptAndTypeInInCheckbox($("#updatetestRoomIdsDiv"),$("#deptid").val(),1);
	
	$("#insertExamroom").change(function() {
		var status = $(this).val();
		if(status == 0){ //侯考场
			$(".insertTestRoom").show();
		}else{
			$(".insertTestRoom").hide();
		}
	});
	
	$("#updateExamroom").change(function() {
		var status = $(this).val();
		if(status == 0){ //侯考场
			$(".updateTestRoom").show();
		}else{
			$(".updateTestRoom").hide();
		}
	});
	
	//查询所有考场
//	var examroomTabs = $("#examroomTabs");
	selectErDtosByDeptPaging(1);
	
	// 添加考场
	$("#insertExamroomForm").checkForm();
	$("#insertExamroomForm").submit(function(){
		saveExamroom($("#insertExamroomForm"),"examroom/insertOneEr");
	});
	
	// 修改考场
	$("#updateExamroomForm").checkForm();
	$("#updateExamroomForm").submit(function(){
		
		saveExamroom($("#updateExamroomForm"),"examroom/updateOneEr");
	});
	
	
	
});

// 

//------------------------------------------------
function selectErDtosByDeptPaging(nowPage) {
	if(nowPage == -1){
		alert("没有上一页了~");
		return false;
	}
	if(nowPage == 0){
		alert("这已经是最后一页了~");
		return false;
	}
	$.ajax({
            async: false,
            type: "post",
            url:"examroom/selectErDtosByDeptPaging",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				deptid : $("#deptid").val(),
				nowPage : nowPage,
			},
            success: function (message) {
	
				//显示分页信息
				showPage(message,"selectErDtosByDeptPaging");
				
				//显示数据
				var erDtos = message.list;
	
				$("#examroomTabs").empty();
				for(var i=0;i<erDtos.length;i++){  
					//类型
					var ertypeText = "";
					// 操作
					var operationUrl = "";
					var operationName = "";
					if(erDtos[i].ertype == 0){
						ertypeText = "候考考场";
						operationUrl = "student/exportWaitErStusInExcel?erid="+erDtos[i].erid;
						operationName = "导出考生信息表";
					}else if(erDtos[i].ertype == 1){
						ertypeText = "测试考场";
						operationUrl = "student/exportStuSignatureExcel?erid="+erDtos[i].erid;
						operationName = "导出考生签名表";
					}
					//测试考场
					var testRoomNames = "";
					var testRoomNameLists = erDtos[i].testRoomListsNames;
					if(testRoomNameLists.length == 0){
						testRoomNames = "暂无";
					}else{
						for (var j = 0; j < testRoomNameLists.length;j++) {
							testRoomNames += testRoomNameLists[j];
							if(j < testRoomNameLists.length-1){
								testRoomNames += " | ";
							}
						}
					}
					
					//编号
					var num = i+1;
					//考官
					var username = "";
					if(erDtos[i].username != null){
						username = erDtos[i].username;
					}
					
					$("#examroomTabs").append('<tr>'+
							'<td>'+num+'</td>'+
							'<td>'+erDtos[i].ername+'</td>'+
							'<td>'+ertypeText+'</td>'+
							'<td>'+testRoomNames+'</td>'+
							'<td>'+username+'</td>'+
							"<td class='center'>"+
							"<a href='"+operationUrl+"'>"+operationName+"</a> | " +
							"<a href='javascript:void(0);' onclick='goUpdateExamroom("+erDtos[i].erid+")'>修改</a> | " +
							"<a href='javascript:void(0)' onclick=\"deleteOne('" + erDtos[i].erid + "','examroom')\">删除</a>" +
							"</td>"+
							'</tr>');
				}
            }
    });
	
}

