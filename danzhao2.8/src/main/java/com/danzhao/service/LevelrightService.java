package com.danzhao.service;

import java.util.List;

import com.danzhao.bean.Levelright;

public interface LevelrightService {

	public int insertOneLevelright(Levelright levelright);
	
	public int updateOneLevelright(Levelright levelright);
	
	public List<Levelright> selectLevelrightByDept(int deptid);
	
	public int selectIsLevelname(Levelright levelright);
	
	public Levelright selectOneLevelright(int levelrightid);
	
	public int deleteOne(int levelrightid);
	
}
