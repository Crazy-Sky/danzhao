$(function() {
	
	//获取考生成绩
	getExatedStuPaging(1);
	
	//按考试时间查询
	$("#selectExatedStuByTestTimeBt").click(function() {
		getExatedStuPaging(1);
	});
	
	$("#createScoreTabBt").click(function() {
		window.location.href="student/exportStuScoreExcel?erid="+$("#erid").val();
	});
	
	
});

//---------------------------------------------------------------

//分页获取已考考生
function getExatedStuPaging(nowPage) {
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
				stustatus : 5,
				testtime : $("#testtime").val(),
				nowPage : nowPage,
			},
            success: function (message) {
				
				//显示分页信息
				showPage(message,"getExatedStuPaging");
				
				//显示数据
				var users = message.list;
				
				$("#exatedStuTabs").empty();
				for(var i=0;i<users.length;i++){
					var num = i+1;
					$("#exatedStuTabs").append('<tr>'+
							'<td>'+num+'</td>'+
							'<td>'+users[i].stunumber+'</td>'+
							'<td>'+users[i].stuname+'</td>'+
							'<td>'+users[i].stusex+'</td>'+
							'<td>'+users[i].profname+'</td>'+
							'<td>'+users[i].totalscore+'</td>'+
							'</tr>');
				}
			}
	});
}
