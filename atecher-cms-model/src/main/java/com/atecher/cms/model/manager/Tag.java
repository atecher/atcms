package com.atecher.cms.model.manager;

import java.io.Serializable;

public class Tag implements Serializable{
	private static final long serialVersionUID = -233894904223094938L;
	private Long id;
	private String tag;
	private String code;
	private Integer counts;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

}