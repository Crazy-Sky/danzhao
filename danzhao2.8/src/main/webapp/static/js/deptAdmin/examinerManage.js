$(function() {
	//获取考场显示在select上
	//添加
//	alert($("#insertExaminerForm select[name='userrole'] option:selected").val());
	showSelectExamroom($("#insertExaminerForm select[name='userrole'] option:selected").val(),$("#insertExaminer_examrooms"));
	
	$("#insertExaminerForm select[name='userrole']").change(function() {
		showSelectExamroom($(this).val(),$("#insertExaminer_examrooms"));
	});
	//修改select选中事件
	$("#updateExaminerForm select[name='userrole']").change(function() {
		showSelectExamroom($(this).val(),$("#updateExaminer_examrooms"));
	});
	
	//查询所有考官
	getUsersByRolePaging(1);
		
	//按角色查询考官信息
	var examinerTabs = $("#examinerTabs");
	$("#selectExaminerByRoleBt").click(function() {
		getUsersByRolePaging(1);
	});
	
	// 添加考官
	$("#insertExaminerForm").checkForm();
	$("#insertExaminerForm").submit(function(){
		saveExaminer($("#insertExaminerForm"),"user/insertOneUser");
	});
	
	//修改考官
	$("#updateExaminerForm").checkForm();
	$("#updateExaminerForm").submit(function(){
		saveExaminer($("#updateExaminerForm"),"user/updateOneUser");
	});
});

//------------------------------

//在select中显示考场
function showSelectExamroom(role, showSelect) {
	if(role == 4){
		getErsByDeptAndTypeInselect($("#deptid").val(),0,showSelect);
	}else{
		getErsByDeptAndTypeInselect($("#deptid").val(),1,showSelect);
	}
}

//点击修改考官按钮
function goUpdateExaminer(userid) {
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
	
				$("#updateExaminerForm input[name='userid']").val(userDto.userid);
				$("#updateExaminerForm input[name='useremail']").val(userDto.useremail);
				$("#updateExaminerForm input[name='username']").val(userDto.username);
				$("#updateExaminerForm input[name='userphone']").val(userDto.userphone);
				$("#updateExaminerForm select[name='userrole']").val(userDto.userrole);
				showSelectExamroom(userDto.userrole,$("#updateExaminer_examrooms"));
				$("#updateExaminer_examrooms").val(userDto.erid);
			},
            error: function () {
				alert("获取考官信息失败！");
            }
	});
	showModal();
}

//分页查询考官
function getUsersByRolePaging(nowPage) {
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
            url:"user/selectUserDtosByRolePaging",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data: {
				deptid : $("#deptid").val(),
				userrole : $("#userrole").val(),
				nowPage : nowPage,
			},
            success: function (message) {

				//显示分页信息
				showPage(message,"getUsersByRolePaging");
				
				//显示数据
				var users = message.list;
				
				$("#examinerTabs").empty();
				for(var i=0;i<users.length;i++){  
					var num = i+1;
					var erName;
					if(users[i].ername == null){
						erName = "";
					}else{
						erName = users[i].ername;
					}
					$("#examinerTabs").append('<tr>'+
							'<td>'+num+'</td>'+
							'<td>'+users[i].username+'</td>'+
							'<td>'+users[i].userphone+'</td>'+
							'<td>'+erName+'</td>'+
							'<td>'+users[i].rolename+'</td>'+
							"<td class='center'>"+
							"<a href='javascript:void(0);' onclick='goUpdateExaminer("+users[i].userid+")'>修改</a> | " +
							"<a href='javascript:void(0)' onclick=\"deleteOne('" + users[i].userid + "','user')\">删除</a>" +
							"</td>"+
							'</tr>');
				}
            }
    });
}


