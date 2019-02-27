package com.danzhao.dao;

import com.danzhao.bean.UserMenu;
import com.danzhao.bean.UserMenuExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMenuMapper {
    long countByExample(UserMenuExample example);

    int deleteByExample(UserMenuExample example);

    int deleteByPrimaryKey(Integer menuid);

    int insert(UserMenu record);

    int insertSelective(UserMenu record);

    List<UserMenu> selectByExample(UserMenuExample example);

    UserMenu selectByPrimaryKey(Integer menuid);

    int updateByExampleSelective(@Param("record") UserMenu record, @Param("example") UserMenuExample example);

    int updateByExample(@Param("record") UserMenu record, @Param("example") UserMenuExample example);

    int updateByPrimaryKeySelective(UserMenu record);

    int updateByPrimaryKey(UserMenu record);
}