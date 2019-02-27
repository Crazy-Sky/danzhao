package com.danzhao.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Examination;
import com.danzhao.bean.ExaminationWithBLOBs;
import com.danzhao.service.ExatService;

/**
 * 
 * 
* <p>Title: ExatController</p>
* <p>Description: 考题管理控制器 </p> 
* @author cx
* @date 2018年12月23日
*
 */
@Controller
@RequestMapping("exat/")
public class ExatController {

	@Autowired
	ExatService exatService;
	
	
	@RequestMapping("insertOneExatWithBLOBs")
	@ResponseBody
	public int insertOneExatWithBLOBs(HttpServletRequest request,
			HttpServletResponse response,ExaminationWithBLOBs examinationWithBLOBs){
		int message = 0;
		message = exatService.insertOneExatWithBLOBs(examinationWithBLOBs);
		return message;
	}
	
	@RequestMapping("updateOneExatWithBLOBs")
	@ResponseBody
	public int updateOne(HttpServletRequest request,
			HttpServletResponse response,ExaminationWithBLOBs examinationWithBLOBs){
		int message = 0;
		message = exatService.updateOneExatWithBLOBs(examinationWithBLOBs);
		return message;
	}
	
	@RequestMapping("showExat")
	public String showExat(HttpSession session, int exatid,String exatOprt){
		session.setAttribute("exatOprt", exatOprt);
		if(exatOprt.equals("update")){
			session.setAttribute("exatid", exatid);
		}
		session.setAttribute("userCorePage", "deptAdmin/saveExat");
		return "user/Main";
	}
	
	@RequestMapping("selectOneExatWithBLOBs")
	@ResponseBody
	public ExaminationWithBLOBs selectOneExamination(HttpServletRequest request,
			HttpServletResponse response, int exatid){
		ExaminationWithBLOBs examination = exatService.selectOneExatWithBLOBs(exatid);
		return examination;
	}
	
//	@RequestMapping("selectExaminationsByDept")
//	@ResponseBody
//	public List<Examination> selectExaminationsByDept(HttpServletRequest request,
//			HttpServletResponse response, int deptid){
//		List<Examination> examinations = exatService.selectExaminationsByDept(deptid);
//		return examinations;
//	}
//	
//	@RequestMapping("selectExaminationsByDeptAndType")
//	@ResponseBody
//	public List<Examination> selectExaminationsByDeptAndType(HttpServletRequest request,
//			HttpServletResponse response, Examination examination){
//		List<Examination> examinations = exatService.selectExaminationsByDeptAndType(examination);
//		return examinations;
//	}
	
	/**
	 * 
	* @Title:    
	* @Description: ()   
	* @realization: (一句话简单介绍这个方法)
	* @author: cx
	* @date 2018年12月23日
	* @param request
	* @param response
	* @param examination
	* @param nowPage
	* @param pageSize
	* @return
	 */
	@RequestMapping("selectExatPaging")
	@ResponseBody
	public Object selectExatPaging(HttpServletRequest request,
			HttpServletResponse response, Examination examination,
			@RequestParam(value="nowPage", defaultValue="1")int nowPage,
			@RequestParam(value="pageSize", defaultValue="10")int pageSize){
		List<Examination> examinations = new ArrayList<Examination>();
		if(examination.getExattype() == 0){
			examinations = exatService.selectExaminationsByDept(examination.getDeptid());
		}else{
			examinations = exatService.selectExaminationsByDeptAndType(examination);
		}
		request.getSession().setAttribute("exat_nowPage", nowPage);
		return examinations;
	}
	
	//删除
	@RequestMapping("deleteOne")
	@ResponseBody
	public int deleteOne(HttpServletRequest request,
			HttpServletResponse response,int id){
		if(id == 0){
			return 0;
		}
		return exatService.deleteOne(id);
	}
	
}
