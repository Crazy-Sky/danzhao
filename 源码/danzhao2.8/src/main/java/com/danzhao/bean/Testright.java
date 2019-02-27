package com.danzhao.bean;

public class Testright {
    private Integer rightid;

    private Integer deptid;

    private String rightname;

    private Integer rightvalue;

    private Integer rightparentid;

    public Integer getRightid() {
        return rightid;
    }

    public void setRightid(Integer rightid) {
        this.rightid = rightid;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getRightname() {
        return rightname;
    }

    public void setRightname(String rightname) {
        this.rightname = rightname == null ? null : rightname.trim();
    }

    public Integer getRightvalue() {
        return rightvalue;
    }

    public void setRightvalue(Integer rightvalue) {
        this.rightvalue = rightvalue;
    }

    public Integer getRightparentid() {
        return rightparentid;
    }

    public void setRightparentid(Integer rightparentid) {
        this.rightparentid = rightparentid;
    }
}