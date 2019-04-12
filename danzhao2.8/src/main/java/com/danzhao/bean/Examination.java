package com.danzhao.bean;

public class Examination {
    private Integer exatid;

    private String exatsimplecontent;

    private Integer exattype;

    private Integer deptid;

    public Integer getExatid() {
        return exatid;
    }

    public void setExatid(Integer exatid) {
        this.exatid = exatid;
    }

    public String getExatsimplecontent() {
        return exatsimplecontent;
    }

    public void setExatsimplecontent(String exatsimplecontent) {
        this.exatsimplecontent = exatsimplecontent == null ? null : exatsimplecontent.trim();
    }

    public Integer getExattype() {
        return exattype;
    }

    public void setExattype(Integer exattype) {
        this.exattype = exattype;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }
}