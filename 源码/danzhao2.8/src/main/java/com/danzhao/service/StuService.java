package com.danzhao.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.danzhao.bean.Examroom;
import com.danzhao.bean.Student;
import com.danzhao.dto.ShowStuDto;
import com.danzhao.dto.StuAllInfoDto;
import com.danzhao.dto.StuInfoDto;

public interface StuService {

	//导入excel
	public int importExcelToStu(HttpServletRequest request,HttpServletResponse response);
	//导出excel
	public XSSFWorkbook exportExcel(int deptid);
	//导出考生签名表
	public XSSFWorkbook exportStuSignatureExcel(int deptid);
	
	//导出考生成绩表
	public Workbook exportStuScoreExcel(Examroom examroom, String kType, int deptid);
	
	public StuInfoDto selectOneDtoByStuNumber(String stuNumber);
	
	public int updateOneStu(Student student);
	
	public int insertOneStu(Student student);
	
	public List<Student> selectAllStu();
	
	public List<StuInfoDto> selectStusByDeptAndNameOrProf(StuInfoDto stuInfoDto);
	
//	public List<StuInfoDto> selectStuInfosByName(int deptid,String name);
//	
//	public List<StuInfoDto> selectStuInfosByProf(int deptid,String profname);
	
	public List<Map<String,Object>> selectStuGradeByErIdAnDeptAndkType(int erId, String kType, int deptid);
	
	public Student selectOneStu(int stuid);
	
	public int stuLogin(Student student,HttpSession session);
	
	public StuAllInfoDto selectOneStuAllInfoDto(int stuid);
	
	//根据专业获取某状态、某考试时间段(如：上午正在被呼叫)的学生
	public List<StuInfoDto> selectStusByProfIdAndState(Student student);
	
	//根据考场获取某状态、某考试时间段(如：上午正在被呼叫)的学生 
	public List<StuInfoDto> selectStusByErIdAndState(Student student);
	
	//根据考场获取某状态范围、某考试时间段(如：上午候考、被呼叫的、考试的)的学生
	public List<StuInfoDto> selectStusByShowStuDto(ShowStuDto showStuDto);
	
	//获取系部的所有学生
    
    public StuInfoDto selectExamingStuByEr(int erid);
    
    public int updateteststarttime(int stuid);
    
    public int updatetestendtime(int stuid);
    
    public int countTotleScore(int stuid);
    
    public int deleteOne(int stuid);
}
