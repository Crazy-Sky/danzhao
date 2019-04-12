$(function() {
	
	var nowPage = $("#stu_nowPage").val();
	if(nowPage == 0 || nowPage == null || nowPage == ""){
		nowPage = 1;
	}
	// 获取所有学生粗略信息
	selectStusByDeptAndNameOrProfPaging(nowPage);
	
	//按条件查询学生
	$("#selectStuForm").checkForm();
	$("#selectStuForm").submit(function(){
		if(isok){
			selectStusByDeptAndNameOrProfPaging(1);
		}
			
	});

	
});
//------------------------------------------------------
function selectStusByDeptAndNameOrProfPaging(nowPage) {
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
            url:"student/selectStusByDeptAndNameOrProfPaging",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				deptid : $("#deptid").val(),
				insertAccord : $("#selectStuForm input[name='insertAccord']:checked").val(),
				stuname : $("#selectStuForm input[name='insertAccordValue']").val(),
				profname : $("#selectStuForm input[name='insertAccordValue']").val(),
				nowPage : nowPage,
			},
            success: function (message) {
	
				//显示分页信息
				showPage(message,"selectStusByDeptAndNameOrProfPaging");
				
				//显示数据
				var stus = message.list;
	
				$("#StuInfoTabs").empty();
				for(var i=0;i<stus.length;i++){  
					//编号
					var num = i+1;
					var stustatus="";
					
					if(stus[i].stustatus==5){
						stustatus=stustatus+"测试完成";
					}
                    else{
                    	stustatus=stustatus+"候考";
                    }
					$("#StuInfoTabs").append('<tr>'+
							'<td>'+num+'</td>'+
							'<td>'+stus[i].stuname+'</td>'+
							'<td>'+stus[i].stusex+'</td>'+
							'<td>'+stus[i].examnumber+'</td>'+
							'<td>'+stus[i].stunumber+'</td>'+
							'<td>'+stus[i].profname+'</td>'+
							'<td>'+stustatus+'</td>'+
							"<td class='center'>"+
							"<a href='student/goUpdateView?stuid="+stus[i].stuid+"'>修改</a> | " +
							"<a href='javascript:void(0)' onclick=\"deleteOne('" + stus[i].stuid + "','student')\">删除</a>" +
							"</td>"+
							'</tr>');
				}
            }
    });
}