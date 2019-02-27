package com.danzhao.service;

import java.util.List;

import com.danzhao.bean.Profession;

public interface ProfService {

	public int insertOne(Profession profession);
	
	public int updateOne(Profession profession);
	
	public Profession selectOneProf(int profid);
	
	public Profession selectOneByProfName(String profname);
	
	public List<Profession> selectAll();

	// 按照系部查找专业
	public List<Profession> selectByDept(int deptId);
	
	//查找专业名称是否存在
	public int selectIsByprofName(Profession profession);
	
	public int deleteOne(int profid);
	
}
