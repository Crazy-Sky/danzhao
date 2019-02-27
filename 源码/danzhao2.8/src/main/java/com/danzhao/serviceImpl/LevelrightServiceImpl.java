package com.danzhao.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.Levelright;
import com.danzhao.bean.LevelrightExample;
import com.danzhao.dao.LevelrightMapper;
import com.danzhao.service.LevelrightService;

@Service
public class LevelrightServiceImpl implements LevelrightService{

	@Autowired
	LevelrightMapper levelrightMapper;
	
	@Override
	public int insertOneLevelright(Levelright levelright) {
		// TODO Auto-generated method stub
		return levelrightMapper.insertSelective(levelright);
	}

	@Override
	public int updateOneLevelright(Levelright levelright) {
		// TODO Auto-generated method stub
		return levelrightMapper.updateByPrimaryKeySelective(levelright);
	}

	@Override
	public List<Levelright> selectLevelrightByDept(int deptid) {
		// TODO Auto-generated method stub
		LevelrightExample levelrightExample = new LevelrightExample();
		LevelrightExample.Criteria criteria = levelrightExample.createCriteria();
		criteria.andDeptidEqualTo(deptid);
		return levelrightMapper.selectByExample(levelrightExample);
	}

	@Override
	public int selectIsLevelname(Levelright levelright) {
		int message = 0;
		List<Levelright> levelrights = new ArrayList<Levelright>();
		LevelrightExample levelrightExample = new LevelrightExample();
		LevelrightExample.Criteria criteria = levelrightExample.createCriteria();
		criteria.andLevelnameEqualTo(levelright.getLevelname());
		levelrights = levelrightMapper.selectByExample(levelrightExample);
		if(levelrights.size() > 0){
			if(levelrights.size() == 1 && levelrights.get(0).getLevelrightid() == levelright.getLevelrightid()){
				message = 0;
			}else{
				message = 1;
			}
		}
		return message;
	}

	@Override
	public Levelright selectOneLevelright(int levelrightid) {
		return levelrightMapper.selectByPrimaryKey(levelrightid);
	}

	@Override
	public int deleteOne(int levelrightid) {
		return levelrightMapper.deleteByPrimaryKey(levelrightid);
	}

}
