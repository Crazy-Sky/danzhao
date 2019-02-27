$(function() {
	
	var erid = $("#erid").val();
	var missStuTabs = $("#missStuTabs");
	//获取缺考考生
	getMissStuPaging(1);
	
	$("#selectMissStuByTestTimeBt").click(function() {
		getMissStuPaging(1);
	});
});

//---------------------------------------------------------------

//分页获取缺考考生
function getMissStuPaging(nowPage) {
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
            url:"chiefExaminer/getStuInfoDtoByErIdAndStateAndTestTimePaging",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				erid : $("#erid").val(),
				stustatus : 4,
				testtime : $("#testtime").val(),
				nowPage : nowPage,
			},
            success: function (message) {
				
				//显示分页信息
				showPage(message,"getMissStuPaging");
				
				//显示数据
				var users = message.list;
				
				$("#missStuTabs").empty();
				for(var i=0;i<users.length;i++){
					var num = i+1;
					$("#missStuTabs").append('<tr>'+
							'<td>'+num+'</td>'+
							'<td>'+users[i].stunumber+'</td>'+
							'<td>'+users[i].stuname+'</td>'+
							'<td>'+users[i].stusex+'</td>'+
							'<td>'+users[i].profname+'</td>'+
							"<td class='center'>"+
							"<a href='javascript:void(0);' onclick='restoreWaitStu("+users[i].stuid+")' >恢复候考</a> "+
							"</td>"+
							'</tr>');
				}
			},
            error: function () {
				alert("获取缺考生失败！");
            }
	});
}

//恢复考生
function restoreWaitStu(stuid) {
	if(stuid == 0){
		return false;
	}
	var deptid = $("#deptid").val();
	$.ajax({
            async: false,
            type: "post",
            url:"chiefExaminer/updateStuState",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				stuid : stuid,
				state : 0,
				deptid : deptid,
				erid:$("#erid").val()
			},
			success : function(message) {
				window.location.reload();
			}
	});
	
	
}