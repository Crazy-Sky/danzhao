package com.danzhao.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.UserMenu;
import com.danzhao.service.MenuService;

@Controller
@RequestMapping("menu/")
public class MenuController {

	@Autowired
	MenuService menuService;
	
	@RequestMapping("selectAllMenuByRole")
	@ResponseBody
	public List<List<UserMenu>> selectAll(HttpServletRequest request,
			HttpServletResponse response,int role){
		List<List<UserMenu>> allMenus = new ArrayList<List<UserMenu>>();
		allMenus.add(new ArrayList<UserMenu>());
		allMenus.add(new ArrayList<UserMenu>());
		List<UserMenu> userMenus = menuService.selectAllMenuByRole(role);
		for (UserMenu userMenu : userMenus) {
			if(userMenu.getParentid() == null || userMenu.getParentid() == 0){
				allMenus.get(0).add(userMenu);
			}else{
				allMenus.get(1).add(userMenu);
			}
		}
		return allMenus;
	}
}
