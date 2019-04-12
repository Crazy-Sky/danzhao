$(function() {
	var deptInfoBody = $("#deptInfoBody");
	//获取所有院部信息
	$.ajax({
            async: false,
            type: "post",
            url:"dept/selectAllDept",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (message) {
				deptInfoBody.empty();
				for(var i=0;i<message.length;i++){
					var num = i+1;
					deptInfoBody.append('<tr>'+
							'<td><input type="hidden" name="userid" value="'+message[i].deptid+'">'+num+'</td>'+
							'<td>'+message[i].deptname+'</td>'+
							'<td>'+message[i].profclass+'</td>'+
							"<td class='center'>"+
							"<a href='javascript:void(0);' onclick='goUpdateDeptInfo("+message[i].deptid+")'>修改</a> | " +
							"<a href='javascript:void(0)' onclick=\"deleteOne('" + message[i].deptid + "','dept')\">删除</a>" +
							"</td>"+
							'</tr>');
				}
            },
            error: function () {
				alert("异步传输失败！");
            }
    });
	
	// 添加系部
	$("#insertDeptForm").checkForm();
	$("#insertDeptForm").submit(function(){
		saveDeptInfo($("#insertDeptForm"),"dept/insertOneDept");
	});
	//修改系部 
	$("#updateDeptInfoForm").checkForm();
	$("#updateDeptInfoForm").submit(function(){
		saveDeptInfo($("#updateDeptInfoForm"),"dept/updateOneDept");
	});
	
	
});

//-----------------------------------------

//保存
function saveDeptInfo(deptForm,url) {
	if(isok){
		$.ajax({
            async: false,
            type: "post",
            url:url,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:deptForm.serialize(),
            dataType: "json",
            success: function (message) {
				if(message == 0){
					alert("不能为空");
				}else if(message == -1){
					alert("院部名称已存在！");
				}else if(message == -2){
					alert("专业大类已存在！");
				}else{
					window.location.reload();
				}
            },
            error: function () {
				alert("保存系部失败！");
            }
        });
	}
}

//去修改
function goUpdateDeptInfo(deptid) {
	$.ajax({
            async: false,
            type: "post",
            url:"dept/selectOneDept",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				deptid : deptid
			},
            success: function (massage) {
				$("#updateDeptInfoForm input[name='deptid']").val(massage.deptid);
				$("#updateDeptInfoForm input[name='deptname']").val(massage.deptname);
				$("#updateDeptInfoForm input[name='profclass']").val(massage.profclass);
			},
            error: function () {
				alert("获取系部信息失败！");
            }
	});
	showModal();
}