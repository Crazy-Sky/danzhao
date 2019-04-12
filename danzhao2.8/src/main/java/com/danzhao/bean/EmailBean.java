package com.danzhao.bean;

public class EmailBean {
    private Integer emailuserid;

    private String sendaccount;

    private String recipientaccount;

    private String authorizationcode;

    private String emailsmtphost;

    private String emailsubject;

    private String emailcontent;

    @Override
	public String toString() {
		return "EmailBean [emailuserid=" + emailuserid + ", sendaccount="
				+ sendaccount + ", recipientaccount=" + recipientaccount
				+ ", authorizationcode=" + authorizationcode
				+ ", emailsmtphost=" + emailsmtphost + ", emailsubject="
				+ emailsubject + ", emailcontent=" + emailcontent + "]";
	}

	public Integer getEmailuserid() {
        return emailuserid;
    }

    public void setEmailuserid(Integer emailuserid) {
        this.emailuserid = emailuserid;
    }

    public String getSendaccount() {
        return sendaccount;
    }

    public void setSendaccount(String sendaccount) {
        this.sendaccount = sendaccount == null ? null : sendaccount.trim();
    }

    public String getRecipientaccount() {
        return recipientaccount;
    }

    public void setRecipientaccount(String recipientaccount) {
        this.recipientaccount = recipientaccount == null ? null : recipientaccount.trim();
    }

    public String getAuthorizationcode() {
        return authorizationcode;
    }

    public void setAuthorizationcode(String authorizationcode) {
        this.authorizationcode = authorizationcode == null ? null : authorizationcode.trim();
    }

    public String getEmailsmtphost() {
        return emailsmtphost;
    }

    public void setEmailsmtphost(String emailsmtphost) {
        this.emailsmtphost = emailsmtphost == null ? null : emailsmtphost.trim();
    }

    public String getEmailsubject() {
        return emailsubject;
    }

    public void setEmailsubject(String emailsubject) {
        this.emailsubject = emailsubject == null ? null : emailsubject.trim();
    }

    public String getEmailcontent() {
        return emailcontent;
    }

    public void setEmailcontent(String emailcontent) {
        this.emailcontent = emailcontent == null ? null : emailcontent.trim();
    }
}