package com.danzhao.bean;

public class ExaminationWithBLOBs extends Examination {
    private String exatcontent;

    private String exatanswer;

    public String getExatcontent() {
        return exatcontent;
    }

    public void setExatcontent(String exatcontent) {
        this.exatcontent = exatcontent == null ? null : exatcontent.trim();
    }

    public String getExatanswer() {
        return exatanswer;
    }

    public void setExatanswer(String exatanswer) {
        this.exatanswer = exatanswer == null ? null : exatanswer.trim();
    }
}