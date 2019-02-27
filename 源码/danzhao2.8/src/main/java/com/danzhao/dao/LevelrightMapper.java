package com.danzhao.dao;

import com.danzhao.bean.Levelright;
import com.danzhao.bean.LevelrightExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface LevelrightMapper {
    long countByExample(LevelrightExample example);

    int deleteByExample(LevelrightExample example);

    int deleteByPrimaryKey(Integer levelrightid);

    int insert(Levelright record);

    int insertSelective(Levelright record);

    List<Levelright> selectByExample(LevelrightExample example);

    Levelright selectByPrimaryKey(Integer levelrightid);

    int updateByExampleSelective(@Param("record") Levelright record, @Param("example") LevelrightExample example);

    int updateByExample(@Param("record") Levelright record, @Param("example") LevelrightExample example);

    int updateByPrimaryKeySelective(Levelright record);

    int updateByPrimaryKey(Levelright record);
}