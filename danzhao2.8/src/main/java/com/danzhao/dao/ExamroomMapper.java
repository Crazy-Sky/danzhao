package com.danzhao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.danzhao.bean.Examroom;
import com.danzhao.bean.ExamroomExample;
import com.danzhao.dto.ExamroomDto;

public interface ExamroomMapper {
    long countByExample(ExamroomExample example);

    int deleteByExample(ExamroomExample example);

    int deleteByPrimaryKey(Integer erid);

    int insert(Examroom record);

    int insertSelective(Examroom record);

    List<Examroom> selectByExample(ExamroomExample example);

    Examroom selectByPrimaryKey(Integer erid);

    int updateByExampleSelective(@Param("record") Examroom record, @Param("example") ExamroomExample example);

    int updateByExample(@Param("record") Examroom record, @Param("example") ExamroomExample example);

    int updateByPrimaryKeySelective(Examroom record);

    int updateByPrimaryKey(Examroom record);

    // dto

    ExamroomDto selectDtoByPrimaryKey(Integer erid);

    List<ExamroomDto> selectErDtosByExample(ExamroomExample example);

    List<ExamroomDto> selectErDtosByDept(int deptid);

    List<ExamroomDto> selectErDtosByDeptAndType(Examroom examroom);

    List<ExamroomDto> selectsByDeptAndType(Examroom examroom);

}