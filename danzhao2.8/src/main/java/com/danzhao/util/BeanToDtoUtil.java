package com.danzhao.util;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.danzhao.bean.Profession;
import com.danzhao.dto.ProfessionDto;
import com.danzhao.service.DeptService;

public class BeanToDtoUtil {

	
	//将Prof转化成profDto
	public static ProfessionDto ProfToProfDto(Profession profession,DeptService deptService) throws IllegalAccessException, InvocationTargetException{
		ProfessionDto professionDto = new ProfessionDto();
		BeanUtils.copyProperties(professionDto, profession);
		professionDto.setDeptname(deptService.selectOne(profession.getDeptid()).getDeptname());
		return professionDto;
	}
	
}
