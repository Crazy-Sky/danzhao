package com.danzhao.dto;

import java.util.List;


public class DoorStickerDto {

	private String title;
	
	private String dept;
	
	private String examroom;
	
	private String ertype;
	
	private List<String> examrooms;
	
	
    public List<String> getExamrooms() {
        return examrooms;
    }

    public void setExamrooms(List<String> examrooms) {
        this.examrooms = examrooms;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getExamroom() {
        return examroom;
    }

    public void setExamroom(String examroom) {
        this.examroom = examroom;
    }

    public String getErtype() {
        return ertype;
    }

    public void setErtype(String ertype) {
        this.ertype = ertype;
    }

    @Override
    public String toString() {
        return "DoorStickerDto [title=" + title + ", dept=" + dept
                + ", examroom=" + examroom + ", ertype=" + ertype + "]";
    }

}
