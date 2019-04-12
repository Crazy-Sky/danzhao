$(function() {
	
	//获取所有角色信息
	var AccountInfo_roles = $("#AccountInfo_role");
	getAllRoleInselect(AccountInfo_roles);
	
	//获取所有院部信息
	var AccountInfo_depts = $("#AccountInfo_dept");
	getAllDeptInfoInselect(AccountInfo_depts);
	
	
	
	//获取用户信息
//	alert($("#accountInfoForm_userid").val());
	$.ajax({
            async: false,
            type: "post",
            url:"user/selectOneUser",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:{
				userid : $("#accountInfoForm_userid").val()
			},
            dataType: "json",
            success: function (message) {
				$("#AccountInfoForm input[name='username']").val(message.username);
				$("#AccountInfoForm input[name='userpwd']").val(message.userpwd);
				$("#AccountInfoForm input[name='userphone']").val(message.userphone);
				$("#AccountInfoForm input[name='useremail']").val(message.useremail);
				$("#AccountInfo_role").find("option[value='"+message.userrole+"']").attr("selected",true);
				$("#AccountInfo_role").attr("disabled",true);
				if(message.deptname == null || message.deptname == ""){
					$("#AccountInfo_dept").empty();
					$("#AccountInfo_dept").append('<option value="">无</option>');
				}else{
					$("#AccountInfo_dept").val(message.deptid);
				}
				$("#AccountInfo_dept").attr("disabled",true);
            },
            error: function () {
				alert("获取用户信息失败！");
            }
    });
	
	// 修改用户信息
	$("#AccountInfoForm").checkForm();
	$("#AccountInfoForm").submit(function(){
		$("#AccountInfo_role").attr("disabled",false);
		$("#AccountInfo_dept").attr("disabled",false);
		if(isok){
			$.ajax({
	            async: false,
	            type: "post",
	            url:"user/updateSelf",
	            contentType : "application/x-www-form-urlencoded; charset=utf-8",
				data:$("#AccountInfoForm").serialize(),
	            dataType: "json",
	            success: function (message) {
					window.location.href="user/refreshUser?userid="+$("#accountInfoForm_userid").val();
					window.location.reload();
	            },
	            error: function () {
					alert("修改用户信息失败！");
	            }
	        });
		}
        
	});
})