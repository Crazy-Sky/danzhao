$(function() {
	
	//获取验证码
	$("#getCodeBt").click(function() {
		var email = $("#resetPwdForm1 input[name='email']").val();
		if(email == ""){
			alert("邮箱不能为空！");
			return false;
		}
		getEmailCode($(this),email,$("#realCode"));
	});
	
	//下一步
	$("#resetPwdForm1").checkForm();
	$("#resetPwdForm1").submit(function() {
		if(isok){
//			alert(1);
			var Code = $("#resetPwdForm1 input[name='code']").val();
			if($("#realCode").val() !=  Code){
				alert("验证码错误！");
				return false;
			}
			return true;
		}
	});
	
	$("#resetPwdForm2").checkForm();
	$("#resetPwdForm2").submit(function() {
		if(isok){
			var userpwd = $("#resetPwdForm2 intput[name='userpwd']").val();
			var reuserpwd = $("#resetPwdForm2 intput[name='reuserpwd']").val();
			if(userpwd != reuserpwd){
				alert("两次输入的不一致！");
				return false;
			}
			$.ajax({
				url : "reset/resetPwd",
				type : "post",
				data : $("#resetPwdForm2").serialize(),
				success : function(message){
					window.location.href="user/goUserLogin";
				},
				
			});
		}
	});
	
});

//----------------------------------函数分装
	
//发送邮箱验证码
function getEmailCode(bt,email,realCode) {
	
	var num = 60;
	if(email=="" || email==null){
		return false;
	}
	$.ajax({
		url : "reset/sendCode",
		type : "post",
		data : {
			"email":email,
		},
		success : function(result){
//			alert(result);
			if(result == "none"){
				alert("不存在此用户！");
			}else{
				realCode.val(result);
			}
		},error: function(message) {
			alert("发送失败！");
		}
	});
	var time = setInterval(function() {
		num --;
		if (num >= 0){
			bt.val(num+"s后重新发送");
		}else{
			bt.val("重新发送验证码");
			bt.attr("disabled",false);
			clearInterval(time);
			num = 60;
		}
	}, 1000);
	bt.attr("disabled",true);
	
}

// 发送手机验证码
function getPhoneCode(bt,phone,url,realCode) {
	
		var num = 60;
		var sms = "";//接收结果
		if(phone=="" || phone==null){
			return false;
		}
		alert(url+"--"+phone)
		//异步请求
		$.ajax({
			//请求地址
			url : url,
			//请求方式
			type : "post",
			//请求参数
			data : {"phone":phone},
			//返回结果
			success : function(result){
				sms = result;
				alert(sms);
				if(sms == "no"){
					alert("找不到改账号！");
				}else if (sms == "00000"){
					alert("发送验证码失败！");
				}else{
					realCode.val(sms);
				}
			},
			
		});
		var time = setInterval(function() {
			num --;
			if (num >= 0){
				bt.val(num+"s后重新发送");
			}else{
				sms = "00000";
				bt.val("重新发送验证码");
				bt.attr("disabled",false);
				clearInterval(time);
				num = 60;
			}
		}, 1000);
		bt.attr("disabled",true);
		
}
