package com.danzhao.dto;

import java.util.List;

public class ExamroomDto {

	private Integer erid;

    private String ername;

    private Integer ertype;

    private Integer deptid;
    //
    private String deptname;

    private String proflist;
    
    private List<String> proflists;
    
    private List<String> proflistNames;
    
    private Integer userid;
    
    private String username;
    
	public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<String> getProflistNames() {
		return proflistNames;
	}

	public void setProflistNames(List<String> proflistNames) {
		this.proflistNames = proflistNames;
	}

	public Integer getErid() {
		return erid;
	}

	public void setErid(Integer erid) {
		this.erid = erid;
	}

	public String getErname() {
		return ername;
	}

	public void setErname(String ername) {
		this.ername = ername;
	}

	public Integer getErtype() {
		return ertype;
	}

	public void setErtype(Integer ertype) {
		this.ertype = ertype;
	}

	public Integer getDeptid() {
		return deptid;
	}

	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	
	public String getProflist() {
		return proflist;
	}

	public void setProflist(String proflist) {
		this.proflist = proflist;
	}

	public List<String> getProflists() {
		return proflists;
	}

	public void setProflists(List<String> proflists) {
		this.proflists = proflists;
	}

}
