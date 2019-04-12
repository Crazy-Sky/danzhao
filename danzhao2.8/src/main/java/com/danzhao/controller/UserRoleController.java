package com.danzhao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.UserRole;
import com.danzhao.service.UserRoleService;

@Controller
@RequestMapping("role/")
public class UserRoleController {

	@Autowired
	UserRoleService userRoleService;
	
	@RequestMapping("selectAllRole")
	@ResponseBody
	public List<UserRole> selectAll(HttpServletRequest request,
			HttpServletResponse response){
		return userRoleService.selectAllRole();
	}
	
}
