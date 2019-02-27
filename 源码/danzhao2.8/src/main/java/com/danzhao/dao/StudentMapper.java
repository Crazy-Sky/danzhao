package com.danzhao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.danzhao.bean.Student;
import com.danzhao.bean.StudentExample;
import com.danzhao.dto.ShowStuDto;
import com.danzhao.dto.StuAllInfoDto;
import com.danzhao.dto.StuInfoDto;

public interface StudentMapper {
    long countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer stuid);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(Integer stuid);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    
    //根据系部按姓名或者专业模糊查询获取学生
    List<StuInfoDto> selectStusByDeptAndNameOrProf(StuInfoDto stuInfoDto);
    
//  查询StudentInfoDto
    List<StuInfoDto> selectStudentInfoDtoByExample(StudentExample example);
    
//  根据专业获取某状态(如：正在被呼叫)的学生
    List<StuInfoDto> selectStusByProfIdAndState(Student student);
    
//  根据考场获取某状态(如：正在候考)的学生
    List<StuInfoDto> selectStusByErIdAndState(Student student);
    
//  查询StuAllInfoDto
    StuAllInfoDto selectStuAllInfoDtoById(Integer stuid);
    
    //根据考场获取某状态范围(如：候考、在呼叫的、在考试的)的学生 
    List<StuInfoDto> selectStusByShowStuDto(ShowStuDto showStuDto);
    
    //根据考场获取正在考试的学生
    StuInfoDto selectExamingStuByEr(Student student);

    
}