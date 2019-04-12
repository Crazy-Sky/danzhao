package com.danzhao.dao;

import com.danzhao.bean.Examination;
import com.danzhao.bean.ExaminationExample;
import com.danzhao.bean.ExaminationWithBLOBs;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ExaminationMapper {
    long countByExample(ExaminationExample example);

    int deleteByExample(ExaminationExample example);

    int deleteByPrimaryKey(Integer exatid);

    int insert(ExaminationWithBLOBs record);

    int insertSelective(ExaminationWithBLOBs record);

    List<ExaminationWithBLOBs> selectByExampleWithBLOBs(ExaminationExample example);

    List<Examination> selectByExample(ExaminationExample example);

    ExaminationWithBLOBs selectByPrimaryKey(Integer exatid);

    int updateByExampleSelective(@Param("record") ExaminationWithBLOBs record, @Param("example") ExaminationExample example);

    int updateByExampleWithBLOBs(@Param("record") ExaminationWithBLOBs record, @Param("example") ExaminationExample example);

    int updateByExample(@Param("record") Examination record, @Param("example") ExaminationExample example);

    int updateByPrimaryKeySelective(ExaminationWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ExaminationWithBLOBs record);

    int updateByPrimaryKey(Examination record);
    
    //随机获取一条
    int randomExat(Examination record);
}