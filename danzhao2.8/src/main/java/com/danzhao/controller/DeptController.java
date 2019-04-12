package com.danzhao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Department;
import com.danzhao.service.DeptService;
import com.danzhao.util.CheckUtil;

@Controller
@RequestMapping("dept/")
public class DeptController {

	@Autowired
	DeptService deptService;
	
	//添加单个院部信息
	@RequestMapping("insertOneDept")
	@ResponseBody
	public int insertOneDept(HttpServletRequest request,
			HttpServletResponse response,Department department){
		int message = CheckUtil.checkDept(department, deptService);
		if(message == 1){
			message = deptService.insertDeptSelective(department);
		}
		System.out.println(message);
		return message;
	}
	
	//查询所有院部信息
	@RequestMapping("selectAllDept")
	@ResponseBody
	public List<Department> selectAllDept(HttpServletRequest request,
			HttpServletResponse response){
		return deptService.selectAll();
	}
	
	//查询单个院部信息
	@RequestMapping("selectOneDept")
	@ResponseBody
	public Department selectOneDept(HttpServletRequest request,
			HttpServletResponse response,int deptid){
		return deptService.selectOne(deptid);
	}
	
	//修改单个院部信息
	@RequestMapping("updateOneDept")
	@ResponseBody
	public int updateOneDept(HttpServletRequest request,
			HttpServletResponse response,Department department){
		int message = CheckUtil.checkDept(department, deptService);
		if(message == 1){
			message = deptService.updateOne(department);
		}
		System.out.println(message);
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
		return deptService.deleteOne(id);
	}
	
}
