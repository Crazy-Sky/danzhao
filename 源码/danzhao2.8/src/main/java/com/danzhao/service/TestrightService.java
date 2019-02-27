package com.danzhao.service;

import java.util.List;

import com.danzhao.bean.Testright;
import com.danzhao.dto.TestrightDto;

public interface TestrightService {

	public int insertOneTestright(Testright testright);
	
	public int updateOneTestright(Testright testright);
	
	public int selectIsRightName(Testright testright);
	
	public Testright selectOneTestrightById(int rightid);
	
	List<TestrightDto> selectAllTestright();
	
	TestrightDto selectOneTestrightDto(int rightid);
    
	List<TestrightDto> selectTestrightDtosByDept(int deptid);
	
    List<TestrightDto> selectTestrightByDeptAndParent(Testright testright);
	
	public int deleteOne(int rightid);
}
