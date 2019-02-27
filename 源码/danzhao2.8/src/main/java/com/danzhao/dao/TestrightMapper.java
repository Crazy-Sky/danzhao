package com.danzhao.dao;

import com.danzhao.bean.Testright;
import com.danzhao.bean.TestrightExample;
import com.danzhao.dto.TestrightDto;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TestrightMapper {
    long countByExample(TestrightExample example);

    int deleteByExample(TestrightExample example);

    int deleteByPrimaryKey(Integer rightid);

    int insert(Testright record);

    int insertSelective(Testright record);

    List<Testright> selectByExample(TestrightExample example);

    Testright selectByPrimaryKey(Integer rightid);

    int updateByExampleSelective(@Param("record") Testright record, @Param("example") TestrightExample example);

    int updateByExample(@Param("record") Testright record, @Param("example") TestrightExample example);

    int updateByPrimaryKeySelective(Testright record);

    int updateByPrimaryKey(Testright record);
    
    //dto
    List<TestrightDto> selectDtoByExample(TestrightExample example);
    
    TestrightDto selectOneTestrightDto(int rightid);
    
    List<TestrightDto> selectTestrightDtosByDept(int deptid);
    
    List<TestrightDto> selectTestrightByDeptAndParent(Testright testright);
    
}