package com.danzhao.service;

import java.util.List;

public interface modelService {

	public int insert();
	
	public int update();
	
	public List<?> select();
	
	public int selectIs();
	
	public Object selectOne();
	
	
}
