package com.danzhao.bean;

public class Department {
    private Integer deptid;

    private String deptname;

    private String profclass;

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
        this.deptname = deptname == null ? null : deptname.trim();
    }

    public String getProfclass() {
        return profclass;
    }

    public void setProfclass(String profclass) {
        this.profclass = profclass == null ? null : profclass.trim();
    }
}