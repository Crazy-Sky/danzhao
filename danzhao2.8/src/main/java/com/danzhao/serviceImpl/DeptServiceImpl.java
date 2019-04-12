package com.danzhao.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.Department;
import com.danzhao.bean.DepartmentExample;
import com.danzhao.dao.DepartmentMapper;
import com.danzhao.service.DeptService;
import com.danzhao.util.StringUtil;

@Service
public class DeptServiceImpl implements DeptService{

	@Autowired
	DepartmentMapper deptMapper;
	
	@Override
	public int insertDeptSelective(Department department) {
		department.setDeptname(StringUtil.StringDealWith(department.getDeptname()));
		department.setProfclass(StringUtil.StringDealWith(department.getProfclass()));
		return deptMapper.insertSelective(department);
	}

	@Override
	public List<Department> selectAll() {
		return deptMapper.selectByExample(null);
	}

	@Override
	public int selectIsName(Department department) {
		DepartmentExample deptExample = new DepartmentExample();
		DepartmentExample.Criteria criteria = deptExample.createCriteria();
		criteria.andDeptnameEqualTo(department.getDeptname());
		int message = 0;
		List<Department> departments = deptMapper.selectByExample(deptExample);
		if(departments.size() >= 1){
			if(departments.size() == 1 && departments.get(0).getDeptid() == department.getDeptid()){
				message = 0;
			}else{
				message = 1;
			}
			
		}
		return message;
	}
	
	@Override
	public int selectIsProfClass(Department department) {
		DepartmentExample deptExample = new DepartmentExample();
		DepartmentExample.Criteria criteria = deptExample.createCriteria();
		criteria.andProfclassEqualTo(department.getProfclass());
		int message = 0;
		List<Department> departments = deptMapper.selectByExample(deptExample);
		if(departments.size() >= 1){
			if(departments.size() == 1 && departments.get(0).getDeptid() == department.getDeptid()){
				message = 0;
			}else{
				message = 1;
			}
		}
		return message;
	}

	@Override
	public int updateOne(Department department) {
		if(department.getDeptname() != null){
			department.setDeptname(StringUtil.StringDealWith(department.getDeptname()));
		}
		if(department.getProfclass() != null){
			department.setProfclass(StringUtil.StringDealWith(department.getProfclass()));
		}
		int message = deptMapper.updateByPrimaryKeySelective(department);
//		System.out.println(message);
		return message;
	}

	@Override
	public Department selectOne(int deptId) {
		return deptMapper.selectByPrimaryKey(deptId);
	}

	@Override
	public int deleteOne(int deptid) {
		return deptMapper.deleteByPrimaryKey(deptid);
	}

	@Override
	public Department selectOneByProfclass(String profclass) {
		DepartmentExample deptExample = new DepartmentExample();
		DepartmentExample.Criteria criteria = deptExample.createCriteria();
		criteria.andProfclassEqualTo(profclass);
		List<Department> departments = deptMapper.selectByExample(deptExample);
		if(departments.size() > 0){
			return departments.get(0);
		}
		return null;
	}

}
