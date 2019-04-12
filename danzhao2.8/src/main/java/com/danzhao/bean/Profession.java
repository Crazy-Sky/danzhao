package com.danzhao.bean;

public class Profession {
    private Integer profid;

    private Integer deptid;

    private String profname;

    private String profnumber;

    public Integer getProfid() {
        return profid;
    }

    public void setProfid(Integer profid) {
        this.profid = profid;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getProfname() {
        return profname;
    }

    public void setProfname(String profname) {
        this.profname = profname == null ? null : profname.trim();
    }

    public String getProfnumber() {
        return profnumber;
    }

    public void setProfnumber(String profnumber) {
        this.profnumber = profnumber == null ? null : profnumber.trim();
    }
}