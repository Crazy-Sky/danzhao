package com.danzhao.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Profession;
import com.danzhao.dto.ProfessionDto;
import com.danzhao.service.DeptService;
import com.danzhao.service.ProfService;
import com.danzhao.util.BeanToDtoUtil;
import com.danzhao.util.CheckUtil;

@Controller
@RequestMapping("prof/")
public class ProfController {

	@Autowired
	ProfService profService;
	@Autowired
	DeptService deptService;
	
	
	// 添加单个专业
	@RequestMapping("insertOneProf")
	@ResponseBody
	public int insertOneProf(HttpServletRequest request,
			HttpServletResponse response,Profession profession){
		int message = CheckUtil.checkProf(profession, profService);
		if(message == 1){
			message = profService.insertOne(profession);
		}
//		System.out.println("message:"+message);
		return message;
	}
	
	//查询所有专业
	@RequestMapping("selectAllProf")
	@ResponseBody
	public List<ProfessionDto> selectAll(HttpServletRequest request,
			HttpServletResponse response) throws IllegalAccessException, InvocationTargetException{
		List<Profession> professions = profService.selectAll();
//		System.out.println("length:"+professions.size());
		List<ProfessionDto> professionDtos = new ArrayList<ProfessionDto>();
		for (Profession profession : professions) {
			ProfessionDto professionDto = BeanToDtoUtil.ProfToProfDto(profession, deptService);
			professionDtos.add(professionDto);
		}
		return professionDtos;
	}
	
	// 按照系部查找专业
	@RequestMapping("selectByDept")
	@ResponseBody
	public List<ProfessionDto> selectByDept(HttpServletRequest request,
			HttpServletResponse response,int deptId) throws IllegalAccessException, InvocationTargetException{
		List<Profession> professions = profService.selectByDept(deptId);
//		System.out.println("length:"+professions.size());
		List<ProfessionDto> professionDtos = new ArrayList<ProfessionDto>();
		for (Profession profession : professions) {
			ProfessionDto professionDto = BeanToDtoUtil.ProfToProfDto(profession, deptService);
			professionDtos.add(professionDto);
		}
		return professionDtos;
	}
	
	//修改专业信息
	@RequestMapping("updateOneProf")
	@ResponseBody
	public int updateOneProf(HttpServletRequest request,
			HttpServletResponse response,Profession profession){
		int message = CheckUtil.checkProf(profession, profService);
		if(message == 1){
			message = profService.updateOne(profession);
		}
		return message;
	}
	
	//查询单个专业信息
	@RequestMapping("selectOneProf")
	@ResponseBody
	public ProfessionDto selectOneProf(HttpServletRequest request,
			HttpServletResponse response,int profid) throws IllegalAccessException, InvocationTargetException{
		Profession profession = profService.selectOneProf(profid);
		ProfessionDto professionDto = BeanToDtoUtil.ProfToProfDto(profession, deptService);
		return professionDto;
	}
	
	//删除
	@RequestMapping("deleteOne")
	@ResponseBody
	public int deleteOne(HttpServletRequest request,
			HttpServletResponse response,int id){
		if(id == 0){
			return 0;
		}
		return profService.deleteOne(id);
	}
	
}
