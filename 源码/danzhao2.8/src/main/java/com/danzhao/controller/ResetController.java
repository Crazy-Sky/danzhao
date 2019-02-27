package com.danzhao.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.EmailBean;
import com.danzhao.bean.User;
import com.danzhao.service.EmailService;
import com.danzhao.service.UserService;
import com.danzhao.util.CodeUtil;
import com.danzhao.util.EmailUtil;


@Controller
@RequestMapping("reset/")
public class ResetController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	EmailService emailService;
	
	@RequestMapping("/sendCode")
	@ResponseBody
	public  String sendCode(HttpServletRequest request,
			HttpServletResponse response,String email) throws Exception {
		User user = new User();
		user.setUseremail(email);
		if(userService.selectIsEmail(user) != 1){
			return "none";
		}
		EmailBean emailBean = emailService.selectOne(1);
		emailBean.setRecipientaccount(email);
		String code = CodeUtil.createCode();
		emailBean.setEmailcontent("您的验证码是："+code);
		EmailUtil.sendMail(emailBean);
		return code;
	}
	
	@RequestMapping("/resetNext")
	public String resetNext(HttpSession session,String email) throws Exception {
		// 返回正确的验证码
		session.setAttribute("email", email);
		session.setAttribute("reset", "yes");
		return "login/resetPwd2";
	}
	
	@RequestMapping("/resetPwd")
	@ResponseBody
	public int resetPwd(HttpServletRequest request,
			HttpServletResponse response,User user) throws Exception {
		int message = userService.updatePwdByEmail(user);
		return message;
	}
	
}
