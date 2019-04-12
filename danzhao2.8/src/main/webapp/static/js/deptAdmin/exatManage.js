$(function() {
	var nowPage = $("#exat_nowPage").val();
	if(nowPage == 0 || nowPage == null || nowPage == ""){
		nowPage = 1;
	}
	
	//根据系部获取考题基本信息
	selectExatPaging(nowPage);
	
	$("#selectExatBt").click(function() {
		selectExatPaging(1);
	});
});
// ------------------------------------------------
function selectExatPaging(nowPage) {
	if(nowPage == -1){
		alert("没有上一页了~");
		return false;
	}
	if(nowPage == 0){
		alert("这已经是最后一页了~");
		return false;
	}
	var exatTabs = $("#exatTabs");
	$.ajax({
            async: false,
            type: "post",
            url:"exat/selectExatPaging",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
			data:{
				exattype : $("#exatType").val(),
				deptid : $("#deptid").val(),
				nowPage : nowPage,
			},
            success: function (message) {
	
				//显示分页信息
				showPage(message,"selectExatPaging");
				
				//显示数据
				var exatDtos = message.list;	
	
				$("#exatTabs").empty();
				for(var i=0;i<exatDtos.length;i++){
					var num = i+1;
					var exattype = exatDtos[i].exattype;
					var typename;
					if(exattype == 1){
						typename = "职业素质测试题";
					}else if(exattype == 2){
						typename = "技能测试题";
					}
					$("#exatTabs").append('<tr>'+
							'<td>'+num+'</td>'+
							'<td>'+typename+'</td>'+
							'<td>'+exatDtos[i].exatsimplecontent+'</td>'+
							"<td class='center'>"+
							"<a href='exat/showExat?exatOprt=update&exatid="+exatDtos[i].exatid+"'>修改</a> | " +
							"<a href='javascript:void(0)' onclick=\"deleteOne('" + exatDtos[i].exatid + "','exat')\">删除</a>" +
							"</td>"+
							'</tr>');
				}
            }
    });
}