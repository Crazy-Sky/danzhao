package com.danzhao.bean;

import java.util.Date;

public class Student {
    private Integer stuid;

    private String stunumber;

    private String stuname;

    private String stusex;

    private String stutel1;

    private String stutel2;

    private String stutel3;

    private String ktype;

    private String zgtype;

    private String schoolname;

    private Integer stustatus;

    private Integer deptid;

    private Integer profid;

    private String stupwd;

    private String examnumber;

    private String idcard;

    private Integer erid;

    private String testtime;

    private Date teststarttime;

    private Date testendtime;

    private Integer exatid;

    private Integer exatid2;

    private Float totalscore;

    private Integer eh;

    private Integer roleid;

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public String getStunumber() {
        return stunumber;
    }

    public void setStunumber(String stunumber) {
        this.stunumber = stunumber == null ? null : stunumber.trim();
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname == null ? null : stuname.trim();
    }

    public String getStusex() {
        return stusex;
    }

    public void setStusex(String stusex) {
        this.stusex = stusex == null ? null : stusex.trim();
    }

    public String getStutel1() {
        return stutel1;
    }

    public void setStutel1(String stutel1) {
        this.stutel1 = stutel1 == null ? null : stutel1.trim();
    }

    public String getStutel2() {
        return stutel2;
    }

    public void setStutel2(String stutel2) {
        this.stutel2 = stutel2 == null ? null : stutel2.trim();
    }

    public String getStutel3() {
        return stutel3;
    }

    public void setStutel3(String stutel3) {
        this.stutel3 = stutel3 == null ? null : stutel3.trim();
    }

    public String getKtype() {
        return ktype;
    }

    public void setKtype(String ktype) {
        this.ktype = ktype == null ? null : ktype.trim();
    }

    public String getZgtype() {
        return zgtype;
    }

    public void setZgtype(String zgtype) {
        this.zgtype = zgtype == null ? null : zgtype.trim();
    }

    public String getSchoolname() {
        return schoolname;
    }

    public void setSchoolname(String schoolname) {
        this.schoolname = schoolname == null ? null : schoolname.trim();
    }

    public Integer getStustatus() {
        return stustatus;
    }

    public void setStustatus(Integer stustatus) {
        this.stustatus = stustatus;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public Integer getProfid() {
        return profid;
    }

    public void setProfid(Integer profid) {
        this.profid = profid;
    }

    public String getStupwd() {
        return stupwd;
    }

    public void setStupwd(String stupwd) {
        this.stupwd = stupwd == null ? null : stupwd.trim();
    }

    public String getExamnumber() {
        return examnumber;
    }

    public void setExamnumber(String examnumber) {
        this.examnumber = examnumber == null ? null : examnumber.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public Integer getErid() {
        return erid;
    }

    public void setErid(Integer erid) {
        this.erid = erid;
    }

    public String getTesttime() {
        return testtime;
    }

    public void setTesttime(String testtime) {
        this.testtime = testtime == null ? null : testtime.trim();
    }

    public Date getTeststarttime() {
        return teststarttime;
    }

    public void setTeststarttime(Date teststarttime) {
        this.teststarttime = teststarttime;
    }

    public Date getTestendtime() {
        return testendtime;
    }

    public void setTestendtime(Date testendtime) {
        this.testendtime = testendtime;
    }

    public Integer getExatid() {
        return exatid;
    }

    public void setExatid(Integer exatid) {
        this.exatid = exatid;
    }

    public Integer getExatid2() {
        return exatid2;
    }

    public void setExatid2(Integer exatid2) {
        this.exatid2 = exatid2;
    }

    public Float getTotalscore() {
        return totalscore;
    }

    public void setTotalscore(Float totalscore) {
        this.totalscore = totalscore;
    }

    public Integer getEh() {
        return eh;
    }

    public void setEh(Integer eh) {
        this.eh = eh;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }
}