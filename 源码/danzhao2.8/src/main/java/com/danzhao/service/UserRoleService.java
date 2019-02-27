package com.danzhao.service;

import java.util.List;

import com.danzhao.bean.UserRole;

public interface UserRoleService {

//	public int insert();
	
//	public int update();
	
	public List<UserRole> selectAllRole();
	
	public UserRole selectOneRole(int roleid);
	
}
