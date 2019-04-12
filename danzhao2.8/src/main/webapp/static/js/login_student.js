$(function(){
    $("#loginForm_student").checkForm();
    $("#loginForm_student").submit(function(){
        if(validate() && isok){
            // alert($("#loginForm_student").serialize());
            $.ajax({
                async: false,
                type: "post",
                url:'stu/stuLogin',
                contentType : "application/x-www-form-urlencoded; charset=utf-8",
                data:$("#loginForm_student").serialize(),
                dataType: "json",
                success: function (message) {
//    				alert(message);
			    	if(message == 1){
						window.location.href="views/student/studentExaming.jsp";
					}else if(message == -1){
						alert("找不到账号！");
					}else if(message == -2){
						alert("密码错误！");
					}else if(message == -3){
						alert("拒绝登陆！");
					}
                }
            });
        }
    });
});

function validate(){
    var oValue = document.getElementById('input_code').value.toUpperCase();
    if(oValue ==0){
        alert('请输入验证码');
    }else if(oValue != code){
        alert('验证码不正确，请重新输入');
        oValue = ' ';
        createCode();
    }else{
        return true;
    }
    return false;
}