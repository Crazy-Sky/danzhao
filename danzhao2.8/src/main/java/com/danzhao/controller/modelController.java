package com.danzhao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("model/")
public class modelController {
	
	@RequestMapping("insertOne")
	@ResponseBody
	public int insert(HttpServletRequest request,
			HttpServletResponse response){
		int message = 0;
		
		return message;
	}
	
	@RequestMapping("selectAll")
	@ResponseBody
	public Object selectAll(HttpServletRequest request,
			HttpServletResponse response){
		
		return null;
	}
	
	@RequestMapping("updateOne")
	@ResponseBody
	public int updateOne(HttpServletRequest request,
			HttpServletResponse response){
		int message = 0;
		
		return message;
	}
	
	//删除
	@RequestMapping("deleteOne")
	@ResponseBody
	public int deleteOne(HttpServletRequest request,
			HttpServletResponse response,int id){
		if(id == 0){
			return 0;
		}
		return 0;
	}
}
