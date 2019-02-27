$(function() {

	//根据系部获取专业
	getProfByDeptInselect($("#deptid").val(),$("#insertStuInfoForm select[name='profid']"));
	
	//获取测试考场
	getErsByDeptAndTypeInselect($("#deptid").val(),1,$("#insertStuInfoForm select[name='erid']"));
	
	$("#insertStuInfoForm").checkForm();
	$("#insertStuInfoForm").submit(function(){
		if(isok){
			$.ajax({
	            async: false,
	            type: "post",
	            url : "student/insertOne",
	            contentType : "application/x-www-form-urlencoded; charset=utf-8",
				data:$("#insertStuInfoForm").serialize(),
	            dataType: "json",
	            success: function (message) {
					alert("添加成功！");
					window.location.reload();
	            },
	            error: function () {
					alert("添加考生失败！");
	            }
	        });
		}
	});
	
});
