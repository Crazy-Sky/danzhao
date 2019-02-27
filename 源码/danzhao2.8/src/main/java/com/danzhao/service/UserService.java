package com.danzhao.service;

import java.util.List;

import com.danzhao.bean.User;
import com.danzhao.dto.UserDto;
import com.danzhao.dto.UserLoginDto;


public interface UserService {
	//单个条件查询
	public User selectOneByDto(UserLoginDto userLoginDto);
	//单个查询
	public User selectOneUser(int userid);
	public UserDto selectOneDtoUser(int userid);
	//根据考场查主考官或候考管理员
	public User selectOneUserByExamroom(int erid);
	//单个修改
	public int updateByPrimaryKeySelective(User user);
	
	//根据邮箱修改密码
	public int updatePwdByEmail(User user);
	
	//查看手机号是否存在(用于添加和修改)
	public int selectIsPhone(User user);
	
	public int selectIsPhoneToResetPwd(String phone);
	
	//查看邮箱是否存在
	public int selectIsEmail(User user);
	//查看系部管理员是否已经存在
	public int selectIsDeptAdmin(User user);
	//查看(主考官/候考管理员/统分员)是否已经存在
	public int selectIsExaminerByExamroom(User user);
	//查看某考场是否已被使用
	public int selectIsExamroom(User user);
	// 添加单个管理员
	public int insertUser(User user);
	public int deleteOne(int userid);
	
	
	//dto 查询
	public List<UserDto> selectDtos(int deptid);
	
	//根据系部查询所有考官
	public List<UserDto> selectDtosByRole(User user);
	
	//根据系部查询所有考官 3-6
	public List<UserDto> selectAllExaminer(int deptid);
	
	//把考场所有考官的评分状态初始化
	public int initExaminerIsGrade(int erid);
	
	//判断考场考官是否全部已经评分
	public int selectExaminerIsGradeByErId(int erid);
	
	public int selectCountExaminerIsGradeByErId(int erid);	
}
