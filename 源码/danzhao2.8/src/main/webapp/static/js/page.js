function showPage(message,showFun) {
	$(".pageNum").html(message.pageNum);
	$(".pages").html(message.pages);
	$(".total").html(message.total);
	
	$(".pagination").empty();
	if(message.pages <= 1){
		return;
	}
	//首页
	$(".pagination").append("<li class='firstPage'>" +
			"<a href='javascript:void(0);' onclick='"+showFun+"("+message.firstPage+")'>" +
					"首页</a></li>");
	//上一页
	var prevPage;
	if(message.pageNum == 1){
		prevPage = -1;
	}else{
		prevPage = message.pageNum-1;
	}
	$(".pagination").append("<li class='prevPage'>"+
			"<a href='javascript:void(0);' onclick='"+showFun+"("+prevPage+")' " +
			"aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	
	//中间选择页
	var navigatepageNums = message.navigatepageNums;
	for (var j = 0; j < navigatepageNums.length; j++) {
		var cls ;
		if(navigatepageNums[j] == message.pageNum){
			cls = "navigatepageNums active";
		}else{
			cls = "navigatepageNums"
		}
		$(".pagination").append("<li class='"+cls+"'>" +
		"<a href='javascript:void(0);' onclick='"+showFun+"("+navigatepageNums[j]+")'>" +
		""+navigatepageNums[j]+"</a></li>");
	}
	
	//下一页
	$(".pagination").append("<li class='nextPage'>" +
			"<a href='javascript:void(0);' onclick='"+showFun+"("+message.nextPage+")' " +
			"aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	//末页
	$(".pagination").append("<li class='lastPage'>" +
			"<a href='javascript:void(0);' onclick='"+showFun+"("+message.lastPage+")'>" +
			"末页</a></li>");
}