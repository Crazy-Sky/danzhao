package com.danzhao.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Examination;
import com.danzhao.bean.ExaminationWithBLOBs;
import com.danzhao.bean.ExaminerGrade;
import com.danzhao.bean.Levelright;
import com.danzhao.bean.Student;
import com.danzhao.dto.StuInfoDto;
import com.danzhao.dto.TestrightDto;
import com.danzhao.service.ExaminerGradeService;
import com.danzhao.service.ExatService;
import com.danzhao.service.LevelrightService;
import com.danzhao.service.StuService;
import com.danzhao.service.TestrightService;

/**
 * 
* <p>Title:ExaminerController </p>
* <p>Description: 考官控制器</p> 
* @author cx
* @date 2018年11月30日
*
 */
@Controller
@RequestMapping("examiner/")
public class ExaminerController {
	
	@Autowired
	StuService stuService;
	
	@Autowired
	ExatService exatService;
	
	@Autowired
	TestrightService testrightService;
	
	@Autowired
	LevelrightService levelrightService;
	
	@Autowired
	ExaminerGradeService gradeService;
	
	/**
	 * 
	* @Title: gradingStu   
	* @Description: (考官评分)   
	* @realization: (首先判断此评分是不是第一次评 如果是则添加评分 否则则修改评分 并将考官的isGrade赋为1)
	* @author: cx
	* @param request
	* @param response
	* @param sroce1 格式：[权重id:等级id,权重id:等级id] 
	* @param sroce2 ...
	* @param examinerGrade 需要考官id 学生id
	* @return
	 */
	@RequestMapping("gradingStu")
	@ResponseBody
	public int gradingStu(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("sroce1") List<String> sroce1,
			@RequestParam("sroce2") List<String> sroce2,
			ExaminerGrade examinerGrade){
//		System.out.println(sroce1);
		return gradeService.saveOne(examinerGrade, sroce1, sroce2);
	}
	
	/**
	 * 
	* @Title: selectExamingStu   
	* @Description: (根据考场获取正在考试的学生)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param erid 
	* @return
	 */
	@RequestMapping("selectExamingStuByEr")
	@ResponseBody
	public StuInfoDto selectExamingStu(HttpServletRequest request,
			HttpServletResponse response,int erid){
		StuInfoDto stuInfoDto = stuService.selectExamingStuByEr(erid);
		return stuInfoDto;
	}
	
	/**
	 * 
	* @Title: selectExatByStu   
	* @Description: (根据考生 获取该考生的考题1 职业素质测试题)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param stuid
	* @return
	 */
	@RequestMapping("selectExat1ByStu")
	@ResponseBody
	public ExaminationWithBLOBs selectExat1ByStu(HttpServletRequest request,
			HttpServletResponse response,int stuid){
		Student student = stuService.selectOneStu(stuid);
		if(student.getExatid() == null){
			return null;
		}
		int exat1 = student.getExatid();
		return exatService.selectOneExatWithBLOBs(exat1);
	}
	
	
	/**
	 * 
	* @Title: selectExatByStu   
	* @Description: (根据考生 获取该考生的考题2 技能测试题)
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param stuid
	* @return
	 */
	@RequestMapping("selectExat2ByStu")
	@ResponseBody
	public Examination selectExat2ByStu(HttpServletRequest request,
			HttpServletResponse response,int stuid){
		Student student = stuService.selectOneStu(stuid);
		int exat2 = student.getExatid2();
		if(exat2 == 0){
			return null;
		}
		return exatService.selectOneExatWithBLOBs(exat2);
	}
	
	/**
	* @Title: selectTestRightsByDept   
	* @Description: (获取测试权重)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param deptid
	* @return
	 */
	@RequestMapping("selectTestRightsByDept")
	@ResponseBody
	public Object selectTestRightsByDept(HttpServletRequest request,
			HttpServletResponse response,int deptid){
		List<List<TestrightDto>> allTestrights = new ArrayList<List<TestrightDto>>();
		allTestrights.add(new ArrayList<TestrightDto>());
		allTestrights.add(new ArrayList<TestrightDto>());
		List<TestrightDto> testrightDtos = testrightService.selectTestrightDtosByDept(deptid);
		for (TestrightDto testrightDto : testrightDtos) {
			if(testrightDto.getRightparentid() == null || testrightDto.getRightparentid() == 0){
				allTestrights.get(0).add(testrightDto);
			}else{
				allTestrights.get(1).add(testrightDto);
			}
		}
		
		return allTestrights;
	}
	
	/**
	 * 
	* @Title: selectLevelRightsByDept   
	* @Description: (获取等级权重)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param deptid
	* @return
	 */
	@RequestMapping("selectLevelRightsByDept")
	@ResponseBody
	public List<Levelright> selectLevelRightsByDept(HttpServletRequest request,
			HttpServletResponse response,int deptid){
		List<Levelright> levelrights = levelrightService.selectLevelrightByDept(deptid);
		return levelrights;
	}
	
}
