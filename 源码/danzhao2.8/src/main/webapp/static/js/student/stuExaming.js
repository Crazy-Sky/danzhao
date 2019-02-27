$(function() {
	showExat($("#exatid").val(),$("#exat1"));
	
	showExat($("#exatid2").val(),$("#exat2"));
});

//--------------------

function showExat(exatid, exat_div){
	$.ajax({
		async: false,
		type : "post",
		url : "stu/showStuExat",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json",
		data:{
			exatid : exatid,
		},
		success : function(message) {
//			alert(message.exatcontent);
			exat_div.empty();
			exat_div.html(message.exatcontent);
		}
	});
}