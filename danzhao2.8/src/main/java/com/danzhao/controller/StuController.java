package com.danzhao.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Examination;
import com.danzhao.bean.ExaminationWithBLOBs;
import com.danzhao.bean.Student;
import com.danzhao.service.ExatService;
import com.danzhao.service.StuService;

/**
 * 
* <p>Title:StuController </p>
* <p>Description: 考生控制器</p> 
* @author cx
* @date 2018年12月3日
*
 */
@Controller
@RequestMapping("stu/")
public class StuController {
	
	@Autowired
	StuService stuService;
	
	@Autowired
	ExatService exatService;
	
	/**
	 * 
	* @Title: selectAll   
	* @Description: (学生登陆 并自动抽取考题)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param student
	* @return 1: 成功； -1：账号错误； -2：密码错误； 
	* 		 -3：拒绝登陆（考生不在考试状态）
	 */
	@RequestMapping("stuLogin")
	@ResponseBody
	public int stuLogin(HttpServletRequest request,
			HttpServletResponse response,Student student){
		int message = stuService.stuLogin(student,request.getSession());
		return message;
	}
	
	@RequestMapping("outLogin")
	public String outLogin(HttpServletRequest request,
			HttpServletResponse response){
		request.getSession().removeAttribute("student");
		request.getSession().removeAttribute("userCorePage");
		return "login/login_student";
	}
	
	@RequestMapping("login")
	public String login(HttpServletRequest request,
			HttpServletResponse response){
		return "login/login_student";
	}
	/**
	 * 
	* @Title: showStuExat   
	* @Description: (显示考生的考题)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param exatid
	* @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("showStuExat")
	@ResponseBody
	public Examination showStuExat(HttpServletRequest request,
			HttpServletResponse response,int exatid){
		String content = exatService.selectOneExatWithBLOBs(exatid).getExatcontent();
		ExaminationWithBLOBs examination = new ExaminationWithBLOBs();
		examination.setExatcontent(content);
		return examination;
	}
}
