package com.danzhao.util;

import java.util.ArrayList;
import java.util.List;

import com.danzhao.dto.ExaminerGradeDto;

public class GradeUtil {

	/**
	 * 
	* @Title:    fillExaminerGradeDto
	* @Description: (填充ExaminerGradeDto)   
	* @realization: (将考官评分的结果转化为四个list 用户前台显示)
	* 例如： 4:2;6:3|8:3;9:2   -->> result1_testright=[4, 6], result1_level=[2, 3], result2_testright=[8, 9], result2_level=[3, 2]
	* @author: cx
	* @date 2018年12月26日
	* @param gradeDto
	* @return
	 */
	public static ExaminerGradeDto fillExaminerGradeDto(ExaminerGradeDto gradeDto){
		
		List<String> result1_testright = new ArrayList<String>();
	    
		List<String> result1_level = new ArrayList<String>();
	    
	    List<String> result2_testright = new ArrayList<String>();
	    
	    List<String> result2_level = new ArrayList<String>();
		
		String result = gradeDto.getResult();
		String result1 = result.substring(0, result.indexOf("|"));
		String result2 = result.substring(result.indexOf("|")+1);
		
//		System.out.println(result1);
//		System.out.println(result2);
		String [] str1 = result1.split(";");
		String [] str2 = result2.split(";");
		
		for (int i = 0; i < str1.length; i++) {
			result1_testright.add(str1[i].substring(0, str1[i].indexOf(":")));
			result1_level.add(str1[i].substring(str1[i].indexOf(":")+1));
		}
		
		for (int i = 0; i < str2.length; i++) {
			result2_testright.add(str2[i].substring(0, str2[i].indexOf(":")));
			result2_level.add(str2[i].substring(str2[i].indexOf(":")+1));
		}
		gradeDto.setResult1_testright(result1_testright);
		gradeDto.setResult1_level(result1_level);
		gradeDto.setResult2_testright(result2_testright);
		gradeDto.setResult2_level(result2_level);
		return gradeDto;
		
	}
	
	public static void main(String[] args) {
		ExaminerGradeDto gradeDto = new ExaminerGradeDto();
		gradeDto.setResult("4:2;6:3|8:3;9:2");
		GradeUtil.fillExaminerGradeDto(gradeDto); 
		System.out.println(gradeDto.toString());
	}
	
}
