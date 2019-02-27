package com.danzhao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Testright;
import com.danzhao.dto.TestrightDto;
import com.danzhao.service.TestrightService;

@Controller
@RequestMapping("testright/")
public class TestrightController {

	@Autowired
	TestrightService testrightService;
	
	@RequestMapping("saveOne")
	@ResponseBody
	public int insertOneTestright(HttpServletRequest request,
			HttpServletResponse response,Testright testright,String action){
		int message = 0;
		if(testrightService.selectIsRightName(testright) == 1){
			return -1;
		}
//		Object obj = null;
		if(testright.getRightparentid() != null && testright.getRightparentid() == 0){
			testright.setRightparentid(null);
		}
		if(action.equals("insert")){
			message = testrightService.insertOneTestright(testright);
		}else if(action.equals("update")){
			message = testrightService.updateOneTestright(testright);
		}
		return message;
	}
	
	//去修改界面
    @RequestMapping("enterTestright")
    public String enterTestright (HttpSession session,String page,int rightparentid){
        session.setAttribute("userCorePage", page);
        session.setAttribute("rightparentid", rightparentid);
        return "user/Main";
    }
	
	/**
	 * 
	* @Title: selectTestrightByDept   
	* @Description: (这里用一句话描述这个方法的作用)   
	* @realization: (实现的方法)
	* @author: cx
	* @param request
	* @param response
	* @param testright 需要 deptid  rightparentid
	* @return
	 */
	@RequestMapping("selectTestrightByDeptAndParent")
	@ResponseBody
	public List<TestrightDto> selectTestrightByDeptAndParent(HttpServletRequest request,
			HttpServletResponse response,Testright testright){
	    System.out.println(testright.getRightparentid());
		return testrightService.selectTestrightByDeptAndParent(testright);
	}
	
	@RequestMapping("selectOne")
	@ResponseBody
	public TestrightDto selectOne(HttpServletRequest request,
			HttpServletResponse response,int rightid){
		if(rightid == 0){
			return null;
		}
		return testrightService.selectOneTestrightDto(rightid);
	}
	
	
	//删除
	@RequestMapping("deleteOne")
	@ResponseBody
	public int deleteOne(HttpServletRequest request,
			HttpServletResponse response,int id){
		if(id == 0){
			return 0;
		}
		return testrightService.deleteOne(id);
	}
	
}
