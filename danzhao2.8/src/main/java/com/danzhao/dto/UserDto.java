package com.danzhao.dto;

public class UserDto {

	private Integer userid;

    private String username;

    private String userpwd;

    private String userphone;

    private String useremail;

    private Integer userrole;

    //角色名称
    private String rolename;
    
    private Integer deptid;
    
    //所属系部名称
    private String deptname;

    private Integer erid;
    
    //考场名称
    private String ername;
    
    private Integer isgrade;

	public Integer getIsgrade() {
		return isgrade;
	}

	public void setIsgrade(Integer isgrade) {
		this.isgrade = isgrade;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public Integer getUserrole() {
		return userrole;
	}

	public void setUserrole(Integer userrole) {
		this.userrole = userrole;
	}

	public Integer getDeptid() {
		return deptid;
	}

	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

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
		this.ername = ername;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	@Override
	public String toString() {
		return "UserDto [userid=" + userid + ", username=" + username
				+ ", userpwd=" + userpwd + ", userphone=" + userphone
				+ ", useremail=" + useremail + ", userrole=" + userrole
				+ ", rolename=" + rolename + ", deptid=" + deptid
				+ ", deptname=" + deptname + ", erid=" + erid + ", ername="
				+ ername + "]";
	}

}
