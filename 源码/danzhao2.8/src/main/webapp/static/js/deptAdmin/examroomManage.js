
$(function() {
	// 获取专业显示在CheckBox上
	selectProfByDeptIdInCheckbox($("#profidsDiv"),$("#deptid").val());
	
	selectProfByDeptIdInCheckbox($("#updateProfidsDiv"),$("#deptid").val());
	
	//查询所有考场
//	var examroomTabs = $("#examroomTabs");
	selectErDtosByDeptPaging(1);
	
	// 添加考场
	$("#insertExamroomForm").checkForm();
	$("#insertExamroomForm").submit(function(){
//		alert($("#insertExamroomForm input[name='profids']").val());
		saveExamroom($("#insertExamroomForm"),"examroom/insertOneEr");
	});
	
	// 修改考场
	$("#updateExamroomForm").checkForm();
	$("#updateExamroomForm").submit(function(){
		saveExamroom($("#updateExamroomForm"),"examroom/updateOneEr");
	});
	
});

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
					if(erDtos[i].ertype == 0){
						ertypeText = "候考考场";
					}else if(erDtos[i].ertype == 1){
						ertypeText = "测试考场";
					}
					//专业
					var profNames = "";
					var proflists = erDtos[i].proflistNames;
					for (var j = 0; j < proflists.length;j++) {
						profNames += proflists[j];
						if(j < proflists.length-1){
							profNames += " | ";
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
							'<td>'+profNames+'</td>'+
							'<td>'+username+'</td>'+
							"<td class='center'>"+
							"<a href='javascript:void(0);' onclick='goUpdateExamroom("+erDtos[i].erid+")'>修改</a> | " +
							"<a href='javascript:void(0)' onclick=\"deleteOne('" + erDtos[i].erid + "','examroom')\">删除</a>" +
							"</td>"+
							'</tr>');
				}
            }
    });
	
}

