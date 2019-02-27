package com.danzhao.service;


import java.util.List;

import com.danzhao.bean.Department;

public interface DeptService {

	// 添加二级学院（系部）
	public int insertDeptSelective(Department department);
	
	//获取所有二级学院（系部）
	public List<Department> selectAll();
	
	//查询单个二级学院
	public Department selectOne(int deptId);
	
	//按专业大类查询单个二级学院
	public Department selectOneByProfclass(String profclass);
	
	//查看系部名称是否存在
	public int selectIsName(Department department);
	
	//查看专业大类是否存在
	public int selectIsProfClass(Department department);
	
	//修改单个系部信息
	public int updateOne(Department department);
	
	public int deleteOne(int deptid);
}
