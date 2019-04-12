package com.danzhao.dao;

import com.danzhao.bean.ExaminerGrade;
import com.danzhao.bean.ExaminerGradeExample;
import com.danzhao.dto.ExaminerGradeDto;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ExaminerGradeMapper {
    long countByExample(ExaminerGradeExample example);

    int deleteByExample(ExaminerGradeExample example);

    int deleteByPrimaryKey(Integer examinergardeid);

    int insert(ExaminerGrade record);

    int insertSelective(ExaminerGrade record);

    List<ExaminerGrade> selectByExample(ExaminerGradeExample example);

    ExaminerGrade selectByPrimaryKey(Integer examinergardeid);

    int updateByExampleSelective(@Param("record") ExaminerGrade record, @Param("example") ExaminerGradeExample example);

    int updateByExample(@Param("record") ExaminerGrade record, @Param("example") ExaminerGradeExample example);

    int updateByPrimaryKeySelective(ExaminerGrade record);

    int updateByPrimaryKey(ExaminerGrade record);
    
    // dto
    List<ExaminerGradeDto> selectGradeDtoByExample(ExaminerGradeExample example);
    
    List<ExaminerGradeDto> selectGradeDtoByExaminerId(Integer examinerid);
    
    
}