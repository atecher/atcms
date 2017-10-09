package com.atecher.cms.model.manager;

import java.io.Serializable;

public class Role  implements Serializable {
	
	private static final long serialVersionUID = 7412463266304856995L;
	private Long role_id;
	private String role_code;
	private String role_name;
	private String role_desc;
	public Long getRole_id() {
		return role_id;
	}
	public void setRole_id(Long role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_desc() {
		return role_desc;
	}
	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}
	public String getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}

}
