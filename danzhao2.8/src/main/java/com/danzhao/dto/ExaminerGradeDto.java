package com.danzhao.dto;

import java.util.List;

public class ExaminerGradeDto {
	private Integer examinergardeid;

    private Integer examinerid;
    
    private String examinername;
    
    private String rolename;

    private Integer stuid;

    private String result;
    
    private List<String> result1_testright;
    
    private List<String> result1_level;
    
    private List<String> result2_testright;
    
    private List<String> result2_level;

    private Float score;

	public Integer getExaminergardeid() {
		return examinergardeid;
	}

	public void setExaminergardeid(Integer examinergardeid) {
		this.examinergardeid = examinergardeid;
	}

	public Integer getExaminerid() {
		return examinerid;
	}

	public void setExaminerid(Integer examinerid) {
		this.examinerid = examinerid;
	}

	public String getExaminername() {
		return examinername;
	}

	public void setExaminername(String examinername) {
		this.examinername = examinername;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Integer getStuid() {
		return stuid;
	}

	public void setStuid(Integer stuid) {
		this.stuid = stuid;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<String> getResult1_testright() {
		return result1_testright;
	}

	public void setResult1_testright(List<String> result1_testright) {
		this.result1_testright = result1_testright;
	}

	public List<String> getResult1_level() {
		return result1_level;
	}

	public void setResult1_level(List<String> result1_level) {
		this.result1_level = result1_level;
	}

	public List<String> getResult2_testright() {
		return result2_testright;
	}

	public void setResult2_testright(List<String> result2_testright) {
		this.result2_testright = result2_testright;
	}

	public List<String> getResult2_level() {
		return result2_level;
	}

	public void setResult2_level(List<String> result2_level) {
		this.result2_level = result2_level;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "ExaminerGradeDto [examinergardeid=" + examinergardeid
				+ ", examinerid=" + examinerid + ", examinername="
				+ examinername + ", rolename=" + rolename + ", stuid=" + stuid
				+ ", result=" + result + ", result1_testright="
				+ result1_testright + ", result1_level=" + result1_level
				+ ", result2_testright=" + result2_testright
				+ ", result2_level=" + result2_level + ", score=" + score + "]";
	}
	
}