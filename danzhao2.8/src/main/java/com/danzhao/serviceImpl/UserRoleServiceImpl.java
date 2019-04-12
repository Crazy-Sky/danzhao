package com.danzhao.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.UserRole;
import com.danzhao.dao.UserRoleMapper;
import com.danzhao.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService{

	@Autowired
	UserRoleMapper userRoleMapper;

	@Override
	public List<UserRole> selectAllRole() {
		return userRoleMapper.selectByExample(null);
	}

	@Override
	public UserRole selectOneRole(int roleid) {
		// TODO Auto-generated method stub
		return userRoleMapper.selectByPrimaryKey(roleid);
	}

	
	
}
