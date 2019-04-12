$(function() {
	getAllDeptInfoInselect($("#deptSelect"));
	$("#hd_dept").val($("#deptSelect option:selected").html());
	getAllTrueExamroomInselect($("#deptSelect option:selected").val(),$("#examroomSelect"));
	$("#hd_examroom").val($("#examroomSelect option:selected").html());
	$("#deptSelect").change(function() {
		getAllTrueExamroomInselect($(this).val(),$("#examroomSelect"));
		$("#hd_dept").val($("#deptSelect option:selected").html());
		showExamroomType();
	});
	showExamroomType();
	
	$("#examroomSelect").change(function() {
		$("#hd_examroom").val($("#examroomSelect option:selected").html());
		showExamroomType();
	});
});

//--------
function showExamroomType() {
	if($("#examroomSelect option:selected").attr('ertype') == 0){
		$("#ertype").html("侯考场");
		$("#hd_ertype").val("侯考场");
	}else if($("#examroomSelect option:selected").attr('ertype') == 1){
		$("#ertype").html("考场");
		$("#hd_ertype").val("考场");
	}else{
		$("#ertype").html("");
		$("#hd_ertype").val("");
	}
}
/*function createWord() {
	$.ajax({
		async : false,
		type : 'post',
		url : 'word/exportDoorSticker',
		dataType : 'msword',
		data:{
			"title" : $("#title").val(),
			"dept" : $("#deptSelect option:selected").val(),
			"examroom" : $("#examroomSelect option:selected").val(),
			"ertype" : $("#ertype").html(),
		},
		success : function(message) {
			
		}
	});
}*/