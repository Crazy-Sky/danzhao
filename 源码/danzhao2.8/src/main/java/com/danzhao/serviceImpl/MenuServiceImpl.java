package com.danzhao.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.UserMenu;
import com.danzhao.bean.UserMenuExample;
import com.danzhao.dao.UserMenuMapper;
import com.danzhao.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	UserMenuMapper menuMapper;
	
	@Override
	public List<UserMenu> selectAllMenuByRole(int role) {
		// TODO Auto-generated method stub
		UserMenuExample menuExample = new UserMenuExample();
		UserMenuExample.Criteria criteria = menuExample.createCriteria();
		criteria.andRoleidEqualTo(role);
		return menuMapper.selectByExample(menuExample);
		
	}
}
