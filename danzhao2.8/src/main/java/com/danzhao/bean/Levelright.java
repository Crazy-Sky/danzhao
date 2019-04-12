package com.danzhao.bean;

public class Levelright {
    private Integer levelrightid;

    private Integer deptid;

    private String levelname;

    private Integer levelvalue;
    
    private String remark;

    public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getLevelrightid() {
        return levelrightid;
    }

    public void setLevelrightid(Integer levelrightid) {
        this.levelrightid = levelrightid;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getLevelname() {
        return levelname;
    }

    public void setLevelname(String levelname) {
        this.levelname = levelname == null ? null : levelname.trim();
    }

    public Integer getLevelvalue() {
        return levelvalue;
    }

    public void setLevelvalue(Integer levelvalue) {
        this.levelvalue = levelvalue;
    }
}