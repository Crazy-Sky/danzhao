package com.danzhao.bean;

public class ExaminerGrade {
    private Integer examinergardeid;

    private Integer examinerid;

    private Integer stuid;

    private String result;

    private Float score;

    public Integer getExaminergardeid() {
        return examinergardeid;
    }

    public void setExaminergardeid(Integer examinergardeid) {
        this.examinergardeid = examinergardeid;
    }

    public Integer getExaminerid() {
        return examinerid;
    }

    public void setExaminerid(Integer examinerid) {
        this.examinerid = examinerid;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }
}