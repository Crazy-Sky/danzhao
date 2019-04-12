package com.danzhao.bean;

import java.util.Date;

public class Examhistory {
    private Integer ehid;

    private Date start;

    private Date end;

    private Integer er;

    public Integer getEhid() {
        return ehid;
    }

    public void setEhid(Integer ehid) {
        this.ehid = ehid;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Integer getEr() {
        return er;
    }

    public void setEr(Integer er) {
        this.er = er;
    }
}