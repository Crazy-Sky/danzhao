$(function(){
	var selector=$("#userrole");  
	$.ajax({
        	async: false,
            type: "post",
            url:"role/selectAllRole",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (message) {
//				alert(message.length);
				selector.empty();
				for(var i=0;i<message.length;i++){  
					 selector.append('<option value="'+message[i].roleid+'">'+message[i].rolename+'</option>');  
				}
            },
            error: function () {
				alert("获取角色信息失败！");
            }
    });
	
	$("#loginForm_user").checkForm();
	$("#loginForm_user").submit(function(){
	    if(validate()){
	        $.ajax({
	            async: false,
	            type: "post",
	            url:"user/UserLogin",
	            contentType : "application/x-www-form-urlencoded; charset=utf-8",
				data:$("#loginForm_user").serialize(),
	            dataType: "json",
	            success: function (message) {
//					alert(message);
					if(message == 1){
						window.location.href="user/UserSkip";
					}else if(message == -1){
						alert("找不到账号！");
					}else if(message == 0){
						alert("密码错误！");
					}
	            },
	            error: function () {
	            }
	        });
	    }
	});
	
});

function validate(){
    var oValue = document.getElementById('input_code').value.toUpperCase();
    if(oValue != code){
    	showMsg(document.getElementById('input_code'),"验证码错误！请重新输入",false);
	    oValue = ' ';
	    createCode();
    }else{
        return true;
    }
    return false;
}