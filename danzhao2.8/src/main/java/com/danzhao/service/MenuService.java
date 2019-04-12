package com.danzhao.service;

import java.util.List;

import com.danzhao.bean.UserMenu;

public interface MenuService {

	public List<UserMenu> selectAllMenuByRole(int role);
	
}
