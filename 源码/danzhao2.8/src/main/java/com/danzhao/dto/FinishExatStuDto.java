package com.danzhao.dto;

import java.io.Serializable;

public class FinishExatStuDto  implements Serializable{
  
	private static final long serialVersionUID = 1L;

	private Integer deptId;
	
	private Integer erId;

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Integer getErId() {
		return erId;
	}

	public void setErId(Integer erId) {
		this.erId = erId;
	}
	
	
	
}
