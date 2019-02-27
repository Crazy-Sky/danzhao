package com.danzhao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.EmailBean;
import com.danzhao.service.EmailService;
import com.danzhao.util.EmailUtil;

@Controller
@RequestMapping("email/")
public class EmailController {
	
	@Autowired
	EmailService emailService;
	
	/**
	 * 
	* @Title: insert   
	* @Description: (发送邮箱)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param emailBean
	* @return
	 */
	@RequestMapping("sendEmail")
	@ResponseBody
	public int sendEmail(HttpServletRequest request,
			HttpServletResponse response,EmailBean emailBean){
		EmailBean emailBean2 = emailService.selectOne(1);
		emailBean2.setRecipientaccount(emailBean.getRecipientaccount());
		emailBean2.setEmailsubject(emailBean.getEmailsubject());
		emailBean2.setEmailcontent(emailBean.getEmailcontent());
//		System.out.println(emailBean2.toString());
//		for (int i = 0; i < 100; i++) {
//			System.out.print(i);
			EmailUtil.sendMail(emailBean2);
//		}
		return 1;
	}
}
