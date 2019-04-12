package com.danzhao.bean;

public class Examroom {
    private Integer erid;

    private String ername;

    private Integer ertype;

    private Integer deptid;

    private String testRoomList;

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
        this.ername = ername == null ? null : ername.trim();
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

    public String getTestRoomList() {
        return testRoomList;
    }

    public void setTestRoomList(String testRoomList) {
        this.testRoomList = testRoomList == null ? null : testRoomList.trim();
    }
}