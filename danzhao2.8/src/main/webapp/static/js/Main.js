function reload() {
	window.location.reload();
}
//获取所有角色信息显示在select上
function getAllRoleInselect(selectInfos){
	$.ajax({
		async : false,
		type : "post",
		url :"role/selectAllRole",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		success : function (message) {
			selectInfos.empty();
			for(var i=0;i<message.length;i++){
				selectInfos.append('<option value="'+message[i].roleid+'">'+message[i].rolename+'</option>');
			}
		},
		error : function () {
			alert("获取角色信息失败！");
		}
	});
}

//获取所有院部信息并显示在select中
function getAllDeptInfoInselect(selectInfos){
	$.ajax({
		async : false,
		type : "post",
		url : "dept/selectAllDept",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json",
		success : function (message) {
			selectInfos.empty();
			for(var i=0;i<message.length;i++){
				selectInfos.append('<option value="'+message[i].deptid+'">'+message[i].deptname+'</option>');
			}
		},
		error: function () {
			alert("所有院部信息获取失败！");
		}
	});
}

//根据系部获取所有考场显示在select上
function getAllTrueExamroomInselect(deptid,selectInfos){
	$.ajax({
		async : false,
		type : "post",
		url :"examroom/selectAllTrueErByDept",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		data:{
			deptid : deptid
		},
		success : function (message) {
			selectInfos.empty();
			if(message.length == 0){
				selectInfos.append('<option>无</option>');
			}else{
				for(var i=0;i<message.length;i++){
					selectInfos.append('<option ertype="'+message[i].ertype+'" value="'+message[i].erid+'">'+message[i].ername+'</option>');
				}
			}
			
		},
		error : function () {
			alert("获取考场信息失败！");
		}
	});
}

//根据系部和考场状态获取考场显示在select上
function getErsByDeptAndTypeInselect(deptid,ertype,selectInfos){
	$.ajax({
		async : false,
		type : "post",
		url :"examroom/selectsByDeptAndType",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		data:{
			deptid : deptid,
			ertype : ertype
		},
		success : function (message) {
			selectInfos.empty();
			if(message.length == 0){
				selectInfos.append('<option">无</option>');
			}else{
				for(var i=0;i<message.length;i++){
					selectInfos.append('<option value="'+message[i].erid+'">'+message[i].ername+'</option>');
				}
			}
			
		}
	});
}
//根据系部和考场状态获取考场显示在多选按钮上
function selectErsByDeptAndTypeInInCheckbox (testRoomLists,deptid,ertype) {
	$.ajax({
        async: false,
        type: "post",
        url :"examroom/selectsByDeptAndType",
        contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data: {
			deptid : deptid,
			ertype : ertype
		},
        dataType: "json",
        success: function (message) {
			testRoomLists.empty();
			if(message.length == 0){
				testRoomLists.append("<label>暂无考场</label>");
			}else{
				for(var i=0;i<message.length;i++){  
					testRoomLists.append("<label>"+message[i].ername+"：<input type='checkbox' name='testRoomList' " +
							"value='"+message[i].erid+"'></label>&emsp;&emsp;");
				}
			}
			
        },
        error: function () {
			alert("获取测试考场失败！");
        }
    });
}

//根据系部获取所有专业显示在select上
function getProfByDeptInselect(deptid,selectInfos){
	$.ajax({
		async : false,
		type : "post",
		url :"prof/selectByDept",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		data:{
			deptId : deptid
		},
		success : function (message) {
			selectInfos.empty();
			for(var i=0;i<message.length;i++){
				selectInfos.append('<option value="'+message[i].profid+'">'+message[i].profname+'</option>');
			}
		},
		error : function () {
			alert("获取专业信息失败！");
		}
	});
}

//按系部查询专业 并将将专业显示在多选按钮上
function selectProfByDeptIdInCheckbox (proflists,deptId) {
	$.ajax({
        async: false,
        type: "post",
        url:"prof/selectByDept",
        contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data: {
			deptId : deptId
		},
        dataType: "json",
        success: function (message) {
			proflists.empty();
			for(var i=0;i<message.length;i++){  
				proflists.append("<label>"+message[i].profname+"：<input type='checkbox' name='profids' " +
						"value='"+message[i].profid+"'></label>&emsp;&emsp;");
			}
        },
        error: function () {
			alert("获取专业失败！");
        }
    });
}

//保存考官
function saveExaminer(examinerFrom,url) {
	if(isok){
		$.ajax({
            async: false,
            type: "post",
            url : url,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:examinerFrom.serialize(),
            dataType: "json",
            success: function (message) {
				if(message == -1){
					alert("手机号已存在！");
				}else if(message == -2){
					alert("邮箱号已存在！");
				}else if(message == -4){
					alert("该考场已存在主考官！");
				}else if(message == -5){
					alert("该考场已存在候考官！");
				}else if(message == -6){
					alert("该考场已存在统分员！");
				}else{
					window.location.reload();
				}
            },
            error: function () {
				alert("保存考官失败！");
            }
        });
	}
}

//保存考场
function saveExamroom (insertExamroomForm,url) {
	if(isok){
		$.ajax({
            async: false,
            type: "post",
            url:url,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:insertExamroomForm.serialize(),
            dataType: "json",
            success: function (message) {
				if(message == -1){
					alert("该考场已存在！");
				}else{
					window.location.reload();
				}
        	},
            error: function () {
				alert("添加考场失败！");
            }
        });
	}
}

//点击修改考场按钮
function goUpdateExamroom(erid) {
	
	$.ajax({
            async: false,
            type: "post",
            url:"examroom/selectOneErDto",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				erid : erid
			},
            success: function (erDto) {
				$("#updateExamroomForm input[name='erid']").val(erDto.erid);
				$("#updateExamroomForm input[name='ername']").val(erDto.ername);
				$("#updateExamroomForm select[name='ertype']").val(erDto.ertype);
				var testRoomLists = erDto.testRoomLists;
//				alert(profs.length);
				for (var i = 0; i < testRoomLists.length; i++) {
					$("#updatetestRoomIdsDiv input[name='testRoomList'][value='"+testRoomLists[i]+"']").attr("checked", true);
				}
				var ertype = erDto.ertype;
				if(ertype == 0){
					$(".updateTestRoom").show();
				}else{
					$(".updateTestRoom").hide();
				}
				
			},
            error: function () {
				alert("获取考官信息失败！");
				return ;
            }
	});
	
	showModal();
}

//弹窗
function showModal(){
	$(".mark", window.parent.document).css('display','block');
	$(".modal").css('display','block');
	$("html,body", window.parent.document).addClass('ovfHiden');
}

function hiddenModel(){
	$(".mark").css('display','none');
	$(".modal").css('display','none');
	//启用滚动条
 	$("html,body").removeClass('ovfHiden');
}

function deleteOne(id,url){
	if(id == "" || id == null || id == 0){
		return false;
	}
	var is = confirm('你确认要删除吗？');
	if(!is){
		return false;
	}
	$.ajax({
		type : "post",
		url : url+"/deleteOne",
		async : false,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		data:{
			id : id,
		},
		success : function(message) {
			if(message != 0){
				window.location.reload();
			}
		}
	});
}
