package com.danzhao.bean;

public class Examroom {
    private Integer erid;

    private String ername;

    private Integer ertype;

    private Integer deptid;

    private String proflist;

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

    public String getProflist() {
        return proflist;
    }

    public void setProflist(String proflist) {
        this.proflist = proflist == null ? null : proflist.trim();
    }

	@Override
	public String toString() {
		return "Examroom [erid=" + erid + ", ername=" + ername + ", ertype="
				+ ertype + ", deptid=" + deptid + ", proflist=" + proflist
				+ "]";
	}
}