package com.danzhao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Levelright;
import com.danzhao.service.LevelrightService;

@Controller
@RequestMapping("level/")
public class LevelrightController {

	@Autowired
	LevelrightService levelrightService;
	
	@RequestMapping("saveOne")
	@ResponseBody
	public int saveOne(HttpServletRequest request,
			HttpServletResponse response,Levelright levelright,String action){
		int message = 0;
		if(levelrightService.selectIsLevelname(levelright) == 1){
			return -1;
		}
		if(action.equals("insert")){
			message = levelrightService.insertOneLevelright(levelright);
		}else if(action.equals("update")){
			message = levelrightService.updateOneLevelright(levelright);
		}
		return message;
	}
	
	@RequestMapping("selectLevelrightByDept")
	@ResponseBody
	public List<Levelright> selectLevelrightByDept(HttpServletRequest request,
			HttpServletResponse response,int deptid){
		return levelrightService.selectLevelrightByDept(deptid);
	}
	
	@RequestMapping("selectOne")
	@ResponseBody
	public Levelright selectOne(HttpServletRequest request,
			HttpServletResponse response,int levelid){
		if(levelid == 0){
			return null;
		}
		return levelrightService.selectOneLevelright(levelid);
	}
	
	//删除
	@RequestMapping("deleteOne")
	@ResponseBody
	public int deleteOne(HttpServletRequest request,
			HttpServletResponse response,int id){
		if(id == 0){
			return 0;
		}
		return levelrightService.deleteOne(id);
	}
	
}
