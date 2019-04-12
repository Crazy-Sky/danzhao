package com.danzhao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.dto.ExaminerGradeDto;
import com.danzhao.service.ExaminerGradeService;

/**
 * 
* <p>Title:GradeController </p>
* <p>Description: 学生评分控制器</p> 
* @author cx
* @date 2018年12月4日
*
 */
@Controller
@RequestMapping("grade/")
public class GradeController {
	
	@Autowired
	ExaminerGradeService gradeService;
	
	/**
	 * 
	* @Title: selectGradesByStu   
	* @Description: (获取学生评分情况)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param stuid
	* @return
	 */
	@RequestMapping("selectGradesByStu")
	@ResponseBody
	public List<ExaminerGradeDto> selectGradesByStu(HttpServletRequest request,
			HttpServletResponse response,int stuid){
		if(stuid == 0){
			return null;
		}
		return gradeService.selectExaminerGradesByStu(stuid);
	}
	
	
	@RequestMapping("selectGradesByExaminerId")
	@ResponseBody
	public List<ExaminerGradeDto> selectGradesByExaminerId(HttpServletRequest request,
			HttpServletResponse response,int examinerid){
		if(examinerid == 0){
			return null;
		}
		return gradeService.selectExaminerGradesByExaminerId(examinerid);
	}
	
}
