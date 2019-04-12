package com.danzhao.service;

import java.util.List;

import com.danzhao.bean.ExaminerGrade;
import com.danzhao.dto.ExaminerGradeDto;

public interface ExaminerGradeService {

	public int saveOne(ExaminerGrade examinerGrade,List<String> sroce1,List<String> sroce2);
	
	public List<ExaminerGrade> selectAll();
	
	public List<ExaminerGradeDto> selectExaminerGradesByStu(int stuid);
	
	public List<ExaminerGradeDto> selectExaminerGradesByExaminerId(int examinerid);
	
	public int selectIsGrade(ExaminerGrade examinerGrade);
	
	public ExaminerGrade selectOneById(int gradeid);
	
}
