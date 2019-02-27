package com.danzhao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.User;
import com.danzhao.service.UserService;

/**
 * 
* <p>Title: countScoreController</p>
* <p>Description: 统分员控制器</p> 
* @author cx
* @date 2018年12月25日
*
 */
@Controller
@RequestMapping("countScore/")
public class countScoreController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("passGrade")
	@ResponseBody
	public int passGrade(HttpServletRequest request,
			HttpServletResponse response, User user){
		int message = 0;
		user.setIsgrade(1);
		message = userService.updateByPrimaryKeySelective(user);
		return message;
	}
	
}
