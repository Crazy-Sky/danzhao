$(function() {
	getLevels($("#deptid").val());
	
	//类别添加
	$("#insertLevelForm").checkForm();
	$("#insertLevelForm").submit(function() {
		if(isok){
			saveLevel($(this));
		}
	});
	
	//类别修改 
	$("#updateLevelForm").checkForm();
	$("#updateLevelForm").submit(function() {
		if(isok){
			saveLevel($(this));
		}
	});
	
});

//-----------------------------------------

//保存等级权重
function saveLevel(levelForm) {
	$.ajax({
         	async: false,
            type: "post",
            url:"level/saveOne",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:levelForm.serialize(),
            dataType: "json",
            success: function (message) {
				if(message == -1){
					alert("等级名已存在！");
				}else{
					window.location.reload();
				}
            }
    });
}

function getLevels(deptid) {
	$.ajax({
		type : "post",
		url : "level/selectLevelrightByDept",
		async : false,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		data:{
			deptid : deptid
		},
		success : function(message) {
			$("#levelTabs").empty();
			for (var i = 0; i < message.length; i++) {
				var num = i+1;
				var remark = message[i].remark;
				if(remark == "" || remark == null){
					remark = "无";
				}
				$("#levelTabs").append("<tr>" +
						"<td>"+num+"</td>" +
						"<td>"+message[i].levelname+"</td>" +
						"<td>"+message[i].levelvalue+"</td>" +
						"<td>"+remark+"</td>" +
						"<td class='center'>" +
								'<a href="javascript:void(0);" onclick="goUpdateLevel('+message[i].levelrightid+')">修改</a>'+
								"&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;" +
								"<a href='javascript:void(0)' onclick=\"deleteOne('" + message[i].levelrightid + "','level')\">删除</a>" +
						"</td></tr>");
			}
		}
	});
}


//修改界面
function goUpdateLevel(levelrightid) {
	$.ajax({
            async: false,
            type: "post",
            url:"level/selectOne",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				levelid : levelrightid
			},
            success: function (message) {
				$("#updateLevelForm input[name='levelrightid']").val(message.levelrightid);
				$("#updateLevelForm input[name='levelname']").val(message.levelname);
				$("#updateLevelForm input[name='levelvalue']").val(message.levelvalue);
			}
	});
	showModal();
} 