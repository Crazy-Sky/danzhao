package com.danzhao.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.Examination;
import com.danzhao.bean.ExaminationExample;
import com.danzhao.bean.ExaminationWithBLOBs;
import com.danzhao.dao.ExaminationMapper;
import com.danzhao.service.ExatService;
import com.danzhao.util.StringUtil;

@Service
public class ExatServiceImpl implements ExatService{

	@Autowired
	ExaminationMapper exatMapper;
	
	@Override
	public int insertOneExatWithBLOBs(ExaminationWithBLOBs examinationWithBLOBs) {
		
		if(examinationWithBLOBs.getExatsimplecontent() != null){
			examinationWithBLOBs.setExatsimplecontent(StringUtil.StringDealWith(examinationWithBLOBs.getExatsimplecontent()));
		}
		
		return exatMapper.insertSelective(examinationWithBLOBs);
	}

	@Override
	public int updateOneExatWithBLOBs(ExaminationWithBLOBs examinationWithBLOBs) {
		
		if(examinationWithBLOBs.getExatsimplecontent() != null){
			examinationWithBLOBs.setExatsimplecontent(StringUtil.StringDealWith(examinationWithBLOBs.getExatsimplecontent()));
		}
		
		return exatMapper.updateByPrimaryKeyWithBLOBs(examinationWithBLOBs);
	}

	@Override
	public List<Examination> selectExaminationsByDept(int deptid) {
		ExaminationExample examinationExample = new ExaminationExample();
		ExaminationExample.Criteria criteria = examinationExample.createCriteria();
		criteria.andDeptidEqualTo(deptid);
		return exatMapper.selectByExample(examinationExample);
	}

	@Override
	public List<ExaminationWithBLOBs> selectExaminationWithBLOBsByDept(
			int deptid) {
		ExaminationExample examinationExample = new ExaminationExample();
		ExaminationExample.Criteria criteria = examinationExample.createCriteria();
		criteria.andDeptidEqualTo(deptid);
		List<ExaminationWithBLOBs> examinationWithBLOBs = exatMapper.selectByExampleWithBLOBs(examinationExample);
		return examinationWithBLOBs;
	}
	
	@Override
	public ExaminationWithBLOBs selectOneExatWithBLOBs(int exatid) {
		return exatMapper.selectByPrimaryKey(exatid);
	}

	@Override
	public List<Examination> selectExaminationsByDeptAndType(
			Examination examination) {
		ExaminationExample examinationExample = new ExaminationExample();
		ExaminationExample.Criteria criteria = examinationExample.createCriteria();
		criteria.andDeptidEqualTo(examination.getDeptid());
		criteria.andExattypeEqualTo(examination.getExattype());
		return exatMapper.selectByExample(examinationExample);
	}

	@Override
	public int deleteOne(int exatid) {
		return exatMapper.deleteByPrimaryKey(exatid);
	}

	@Override
	public int randomExat(Examination examination, int t) {
		Object result = exatMapper.randomExat(examination);
		if(result == null && t == 0){
			result = this.randomExat(examination, 1);
		}
		return (Integer) result;
	}
	
	
}
