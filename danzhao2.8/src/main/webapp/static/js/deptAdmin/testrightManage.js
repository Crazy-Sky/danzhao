$(function() {
	
	var rightparentid = $("#rightparentid").val();
	
	if(rightparentid == null || rightparentid == 0 || rightparentid == ""){
		$(".return").hide();
	}else{
		$(".return").show();
	}
	
	//获取权重 
	getTestRights($("#deptid").val(), rightparentid);
	
	//权重添加
	$("#insertTestRightForm").checkForm();
	$("#insertTestRightForm").submit(function() {
		if(isok){
			saveTestRight($(this));
		}
	});
	
	//权重修改 
	$("#updateTestRightForm").checkForm();
	$("#updateTestRightForm").submit(function() {
		if(isok){
			saveTestRight($(this));
		}
	});
	
});

//-----------------------------------------

//保存权重
function saveTestRight(testrightForm) {
	$.ajax({
         	async: false,
            type: "post",
            url:"testright/saveOne",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:testrightForm.serialize(),
            dataType: "json",
            success: function (message) {
//				alert(message);
				if(message == -1){
					alert("权重名已存在！");
				}else{
					window.location.reload();
				}
            }
    });
}

function getTestRights(deptid,rightparentid) {
	$.ajax({
		type : "post",
		url : "testright/selectTestrightByDeptAndParent",
		async : false,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		data:{
			deptid : deptid,
			rightparentid : rightparentid,
		},
		success : function(message) {
			$("#testrightTabs").empty();
			/*$("#insertRightparents").empty();
			$("#updateRightparents").empty();
			$("#insertRightparents").append("<option value='0'>无</option>");
			$("#updateRightparents").append("<option value='0'>无</option>");*/
			var sum = 0;
			for (var i = 0; i < message.length; i++) {
				var num = i+1;
				/*$("#insertRightparents").append("<option value='"+message[i].rightid+"' >"+message[i].rightname+"</option>");
				$("#updateRightparents").append("<option value='"+message[i].rightid+"' >"+message[i].rightname+"</option>");*/
				var rightparentname;
				if(message[i].rightparentid == null){
					rightparentname = "无";
				}else{
					rightparentname = message[i].rightparentname;
				}
				sum += message[i].rightvalue;
				$("#testrightTabs").append("<tr>" +
						"<td>"+num+"</td>" +
						"<td>"+message[i].rightname+"</td>" +
						"<td>"+message[i].rightvalue+"</td>" +
						"<td>"+rightparentname+"</td>" +
						"<td class='center'>" +
								"<a href='testright/enterTestright?page=deptAdmin/testrightManage&rightparentid="+message[i].rightid+"' onclick='goUpdatetestright("+message[i].rightid+")'>进入</a>"+
								"&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;" +
								"<a href='javascript:void(0);' onclick='goUpdatetestright("+message[i].rightid+")'>修改</a>"+
								"&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;" +
								"<a href='javascript:void(0)' onclick=\"deleteOne('" + message[i].rightid + "','testright')\">删除</a>" +
						"</td></tr>");
			}
			if(sum == 100){
				$(".error").hide();
			}else{
				$(".error").show();
			}
		}
	});
}


//修改界面
function goUpdatetestright(rightid) {
	$.ajax({
            async: false,
            type: "post",
            url:"testright/selectOne",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				rightid : rightid
			},
            success: function (message) {
				$("#updateTestRightForm input[name='rightid']").val(message.rightid);
				$("#updateTestRightForm input[name='rightname']").val(message.rightname);
				$("#updateTestRightForm input[name='rightvalue']").val(message.rightvalue);
			}
	});
	showModal();
} 