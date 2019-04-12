package com.danzhao.dto;

public class ProfessionDto {

	private Integer profid;

	private Integer deptid;
	
    private String deptname;

    private String profname;

    private String profnumber;

	public Integer getProfid() {
		return profid;
	}
	
	public Integer getDeptid() {
		return deptid;
	}


	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}


	public void setProfid(Integer profid) {
		this.profid = profid;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getProfname() {
		return profname;
	}

	public void setProfname(String profname) {
		this.profname = profname;
	}

	public String getProfnumber() {
		return profnumber;
	}

	public void setProfnumber(String profnumber) {
		this.profnumber = profnumber;
	}

	public ProfessionDto(Integer profid, String deptname, String profname,
			String profnumber) {
		super();
		this.profid = profid;
		this.deptname = deptname;
		this.profname = profname;
		this.profnumber = profnumber;
	}

	public ProfessionDto() {
		super();
	}

	@Override
	public String toString() {
		return "ProfessionDto [profid=" + profid + ", deptname=" + deptname
				+ ", profname=" + profname + ", profnumber=" + profnumber + "]";
	}
	
	
}
