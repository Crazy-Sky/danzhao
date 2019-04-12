package com.danzhao.test;

import com.danzhao.bean.EmailBean;
import com.danzhao.util.EmailUtil;

public class EmailTest {

	public static void main(String[] args) {
		EmailBean emailBean = new EmailBean();
		emailBean.setEmailsmtphost("smtp.qq.com");
		emailBean.setEmailsubject("测试邮箱");
		emailBean.setEmailcontent("这是一个测试");
		emailBean.setAuthorizationcode("liefrgfxcruxbigg");
		emailBean.setRecipientaccount("1597594921@qq.com");
		emailBean.setSendaccount("154660165@qq.com");
		System.out.println(emailBean.toString());
//		EmailUtil.sendMail(emailBean);
	}
}
