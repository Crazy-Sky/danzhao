package com.danzhao.dto;

public class UserLoginDto {

	private String userAccount;
    
	private String userpwd;
	
    private Integer userrole;


	public UserLoginDto(String userAccount, String userpwd, Integer userrole) {
		super();
		this.userAccount = userAccount;
		this.userpwd = userpwd;
		this.userrole = userrole;
	}



	@Override
	public String toString() {
		return "UserLoginDto [userAccount=" + userAccount + ", userpwd="
				+ userpwd + ", userrole=" + userrole + "]";
	}



	public String getUserAccount() {
		return userAccount;
	}



	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}



	public String getUserpwd() {
		return userpwd;
	}



	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}



	public Integer getUserrole() {
		return userrole;
	}



	public void setUserrole(Integer userrole) {
		this.userrole = userrole;
	}



	public UserLoginDto() {
		super();
	}
    
}
