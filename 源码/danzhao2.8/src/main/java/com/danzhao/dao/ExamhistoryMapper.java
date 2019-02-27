package com.danzhao.dao;

import com.danzhao.bean.Examhistory;
import com.danzhao.bean.ExamhistoryExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ExamhistoryMapper {
    long countByExample(ExamhistoryExample example);

    int deleteByExample(ExamhistoryExample example);

    int deleteByPrimaryKey(Integer ehid);

    int insert(Examhistory record);

    int insertSelective(Examhistory record);

    List<Examhistory> selectByExample(ExamhistoryExample example);

    Examhistory selectByPrimaryKey(Integer ehid);

    int updateByExampleSelective(@Param("record") Examhistory record, @Param("example") ExamhistoryExample example);

    int updateByExample(@Param("record") Examhistory record, @Param("example") ExamhistoryExample example);

    int updateByPrimaryKeySelective(Examhistory record);

    int updateByPrimaryKey(Examhistory record);
}