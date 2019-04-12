$(function() {
	
	//获取所有院部
	var insert_deptInfos = $("#insert_deptInfo");
	getAllDeptInfoInselect(insert_deptInfos);
	
	var select_deptInfos = $("#select_deptInfo");
	getAllDeptInfoInselect(select_deptInfos);
	
	var modifyProf_dept = $("#modifyProf_dept");
	getAllDeptInfoInselect(modifyProf_dept);
	
	
	//获取所有专业信息
	var profInfoBodys = $("#profInfoBody");
	$.ajax({
            async: false,
            type: "post",
            url:"prof/selectAllProf",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (message) {
				profInfoBodys.empty();
				for(var i=0;i<message.length;i++){
					var num = i+1;
					profInfoBodys.append('<tr>'+
							'<td><input type="hidden" name="userid" value="'+message[i].profid+'">'+num+'</td>'+
							'<td>'+message[i].profname+'</td>'+
							'<td>'+message[i].profnumber+'</td>'+
							'<td>'+message[i].deptname+'</td>'+
							"<td class='center'>"+
							"<a href='javascript:void(0);' onclick='goUpdateProfClass("+message[i].profid+")'>修改</a> | " +
							"<a href='javascript:void(0);' onclick=\"deleteOne('" + message[i].profid + "','prof')\" >删除</a>" +
							"</td>"+
							'</tr>');
				}
            },
            error: function () {
				alert("获取所有专业信息失败！");
            }
    });
	
	// 添加专业
	$("#profInsertForm").checkForm();
	$("#profInsertForm").submit(function(){
		saveProfClass($("#profInsertForm"),"prof/insertOneProf");
	});
	
	//修改专业
	$("#modifyProfForm").checkForm();
	$("#modifyProfForm").submit(function(){
		saveProfClass($(this),"prof/updateOneProf");
	});
	
	//按系部查询专业
	$("#select_deptInfoBt").click(function(){
		$.ajax({
            async: false,
            type: "post",
            url:"prof/selectByDept",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:{
				deptId:$("#select_deptInfo").val()
			},
            dataType: "json",
            success: function (message) {
				profInfoBodys.empty();
				for(var i=0;i<message.length;i++){
					var num = i+1;
					profInfoBodys.append('<tr>'+
							'<td><input type="hidden" name="userid" value="'+message[i].profid+'">'+num+'</td>'+
							'<td>'+message[i].profname+'</td>'+
							'<td>'+message[i].profnumber+'</td>'+
							'<td>'+message[i].deptname+'</td>'+
							"<td class='center'>"+
							"<a href='javascript:void(0);' onclick='goUpdateProfClass("+message[i].profid+")'>修改</a> | " +
							"<a href='javascript:void(0);' onclick=\"deleteOne('" + message[i].profid + "','prof')\" >删除</a>"+
							"</td>"+
							'</tr>');
				}
            }
        });
	});
	
});


//---------------------------------------------------------------------

//保存
function saveProfClass(profForm,url) {
	if(isok){
		$.ajax({
            async: false,
            type: "post",
            url:url,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:profForm.serialize(),
            dataType: "json",
            success: function (message) {
//	 			alert(message);
				if(message == -1){
					alert("专业名称已存在！");
				}else{
					window.location.reload();
				}
            },
            error: function () {
				alert("添加专业信息失败！");
            }
        });
	}
}

//去修改
function goUpdateProfClass(profid) {
	$.ajax({
            async: false,
            type: "post",
            url:"prof/selectOneProf",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				profid : profid
			},
            success: function (massage) {
	 			var profDto = massage;
				$("#modifyProfForm input[name='profid']").val(profDto.profid);
				$("#modifyProfForm input[name='profname']").val(profDto.profname);
				$("#modifyProfForm input[name='profnumber']").val(profDto.profnumber);
				$("#modifyProf_dept").val(profDto.deptid);
			},
            error: function () {
				alert("获取专业信息失败！");
            }
	});
	showModal();
}