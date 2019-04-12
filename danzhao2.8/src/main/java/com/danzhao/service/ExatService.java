package com.danzhao.service;

import java.util.List;

import com.danzhao.bean.Examination;
import com.danzhao.bean.ExaminationWithBLOBs;

public interface ExatService {

	//插入单个考题
	public int insertOneExatWithBLOBs(ExaminationWithBLOBs examinationWithBLOBs);
	//修改单个考题
	public int updateOneExatWithBLOBs(ExaminationWithBLOBs examinationWithBLOBs);
	//按系部查找考题
	public List<ExaminationWithBLOBs> selectExaminationWithBLOBsByDept(int deptid);
	//按系部查找简略考题(用以批量显示)
	public List<Examination> selectExaminationsByDept(int deptid);
	//根据类型和系部查找简略考题(用以批量显示)
	public List<Examination> selectExaminationsByDeptAndType(Examination examination);
	//查询单个考题
	public ExaminationWithBLOBs selectOneExatWithBLOBs(int exatid);
	//随机抽取考题
	public int randomExat(Examination examination, int t);
	public int deleteOne(int exatid); 
}
