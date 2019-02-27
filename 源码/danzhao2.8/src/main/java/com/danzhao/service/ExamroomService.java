package com.danzhao.service;


import java.util.List;

import com.danzhao.bean.Examroom;
import com.danzhao.dto.ExamroomDto;

public interface ExamroomService {

	public int insertOneExamroom(Examroom examroom);
	
	public int updateOneExamroom(Examroom examroom);
	
	public int selectIsErName(Examroom examroom);
	
	public Examroom selectOneExamroom(int erid);
	
	public ExamroomDto selectExamroomDtoByPrimary(int erid);
	
	public Examroom selectOneByName(String ername);
	
	public List<Examroom> selectAllExamroomByDept(int deptid);
	
	public int deleteOne(int erid);
	
	List<ExamroomDto> selectErDtosByDept(int deptid);
	
	List<ExamroomDto> selectErDtosByDeptAndType(Examroom examroom);
	
	List<ExamroomDto> selectsByDeptAndType(Examroom examroom);
	
}
