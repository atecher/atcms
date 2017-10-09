package com.atecher.cms.model.manager;

import java.io.Serializable;
import java.util.Date;

public class UserRole implements Serializable{
	
	private static final long serialVersionUID = -2831446063448677401L;
	private Long user_id;
	private Long role_id;
	private String session_type;
	private Date valid_from;
	private Date valid_to;
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public Long getRole_id() {
		return role_id;
	}
	public void setRole_id(Long role_id) {
		this.role_id = role_id;
	}
	public String getSession_type() {
		return session_type==null?"0":session_type;
	}
	public void setSession_type(String session_type) {
		this.session_type = session_type;
	}
	public Date getValid_from() {
		return valid_from;
	}
	public void setValid_from(Date valid_from) {
		this.valid_from = valid_from;
	}
	public Date getValid_to() {
		return valid_to;
	}
	public void setValid_to(Date valid_to) {
		this.valid_to = valid_to;
	}

}
