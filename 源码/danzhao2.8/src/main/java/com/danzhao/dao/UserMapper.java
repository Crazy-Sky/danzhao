package com.danzhao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.danzhao.bean.User;
import com.danzhao.bean.UserExample;
import com.danzhao.dto.UserDto;
import com.danzhao.dto.UserLoginDto;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer userid);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    //单个条件查询
    User selectOneByDto(UserLoginDto userLoginDto);
    
    //根据邮箱修改密码
    int updatePwdByEmail(User user);
    
    //单个查询dto
    UserDto selectOneDto (int userid);
    
    //dto查询
    List<UserDto> selectDtoByExample(UserExample example);
    
    List<UserDto> selectDtos(int deptid);
    // 按系部、角色
    List<UserDto> selectDtosByRole(User user);
    //按系部 角色：3-6
    List<UserDto> selectAllExaminer(int deptid);
    
}