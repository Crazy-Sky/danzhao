$(function() {
	
	//获取所有院部信息
	var deptAdmin_insert_depts = $("#deptAdmin_insert_depts");
	getAllDeptInfoInselect(deptAdmin_insert_depts);
	var modifyDeptAdmin_dept = $("#modifyDeptAdmin_dept");
	getAllDeptInfoInselect(modifyDeptAdmin_dept);
	
	
	//获取所有院部管理员信息
	var deptAdminInfoBodys = $("#deptAdminInfoBody");
	$.ajax({
            async: false,
            type: "post",
            url:"user/selectUserByRole",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:{
				userrole:2
			},
            dataType: "json",
            success: function (message) {
				deptAdminInfoBodys.empty();
				for(var i=0;i<message.length;i++){  
					var num = i+1;
					deptAdminInfoBodys.append('<tr>'+
							'<td><input type="hidden" name="userid" value="'+message[i].userid+'">'+num+'</td>'+
							'<td>'+message[i].username+'</td>'+
							'<td>'+message[i].userphone+'</td>'+
							'<td>'+message[i].deptname+'</td>'+
							"<td class='center'>"+
							"<a href='javascript:void(0);' onclick='goUpdateDeptAdmin("+message[i].userid+")'>修改</a> | " +
							"<a href='javascript:void(0)' onclick=\"deleteOne('" + message[i].userid + "','user')\">删除</a>" +
							"</td>"+
							'</tr>');
				}
            },
            error: function () {
				alert("获取所有管理员失败！");
            }
    });
	
	// 添加系部管理员
	$("#deptAdminForm").checkForm();
	$("#deptAdminForm").submit(function(){
		saveDeptAdmin($("#deptAdminForm"),"user/insertOneUser");
	});
	
	//修改系部管理员
	$("#modifyDeptAdminForm").checkForm();
	$("#modifyDeptAdminForm").submit(function(){
		saveDeptAdmin($("#modifyDeptAdminForm"),"user/updateOneUser");
	});
	
	
});

//-----------------------------------------

//保存
function saveDeptAdmin(deptAdminForm,url) {
	if(isok){
		$.ajax({
            async: false,
            type: "post",
            url:url,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:deptAdminForm.serialize(),
            dataType: "json",
            success: function (message) {
				if(message == -1){
					alert("手机号已存在！");
				}else if(message == -2){
					alert("邮箱号已存在！");
				}else if(message == -3){
					alert("该院部已存在管理员！");
				}else{
					window.location.reload();
				}
            },
            error: function () {
				alert("保存院部管理员失败！");
            }
        });
	}
}

//去修改
function goUpdateDeptAdmin(userid) {
	$.ajax({
            async: false,
            type: "post",
            url:"user/selectOneUser",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				userid : userid
			},
            success: function (userDto) {
				$("#modifyDeptAdminForm input[name='userid']").val(userDto.userid);
				$("#modifyDeptAdminForm input[name='username']").val(userDto.username);
				$("#modifyDeptAdminForm input[name='userphone']").val(userDto.userphone);
				$("#modifyDeptAdminForm select[name='deptid']").val(userDto.deptid);
			},
            error: function () {
				alert("获取系部管理员信息失败！");
            }
	});
	showModal();
}
