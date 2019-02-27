package com.danzhao.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.Testright;
import com.danzhao.bean.TestrightExample;
import com.danzhao.dao.TestrightMapper;
import com.danzhao.dto.TestrightDto;
import com.danzhao.service.TestrightService;

@Service
public class TestrightServiceImpl implements TestrightService{

	@Autowired
	TestrightMapper testrightMapper;
	
	@Override
	public int insertOneTestright(Testright testright) {
		// TODO Auto-generated method stub
		return testrightMapper.insertSelective(testright);
	}

	@Override
	public int updateOneTestright(Testright testright) {
		// TODO Auto-generated method stub
		return testrightMapper.updateByPrimaryKeySelective(testright);
	}

	@Override
	public List<TestrightDto> selectTestrightDtosByDept(int deptid) {
		return testrightMapper.selectTestrightDtosByDept(deptid);
	}

	@Override
	public int selectIsRightName(Testright testright) {
		// TODO Auto-generated method stub
		List<Testright> testrights = new ArrayList<Testright>();
		TestrightExample testrightExample = new TestrightExample();
		TestrightExample.Criteria criteria = testrightExample.createCriteria();
		criteria.andRightnameEqualTo(testright.getRightname());
		testrights = testrightMapper.selectByExample(testrightExample);
		int message = 0;
		if(testrights.size() > 0){
			if(testrights.size() == 1 && testrights.get(0).getRightid() == testright.getRightid()){
				message = 0;
			}else{
				message = 1;
			}
		}
		return message;
	}

	@Override
	public Testright selectOneTestrightById(int rightid) {
		return testrightMapper.selectByPrimaryKey(rightid);
	}

	@Override
	public int deleteOne(int rightid) {
		return testrightMapper.deleteByPrimaryKey(rightid);
	}

	
	@Override
	public List<TestrightDto> selectTestrightByDeptAndParent(Testright testright) {
		return testrightMapper.selectTestrightByDeptAndParent(testright);
	}

	@Override
	public List<TestrightDto> selectAllTestright() {
		return testrightMapper.selectDtoByExample(null);
	}

	@Override
	public TestrightDto selectOneTestrightDto(int rightid) {
		return testrightMapper.selectOneTestrightDto(rightid);
	}

}
