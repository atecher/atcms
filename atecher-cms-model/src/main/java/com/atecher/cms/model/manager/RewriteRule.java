package com.atecher.cms.model.manager;

public class RewriteRule {
	private Long id;
	private String urlToType;
	private String urlFrom;
	private String urlTo;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUrlToType() {
		return urlToType;
	}
	public void setUrlToType(String urlToType) {
		this.urlToType = urlToType;
	}
	public String getUrlFrom() {
		return urlFrom;
	}
	public void setUrlFrom(String urlFrom) {
		this.urlFrom = urlFrom;
	}
	public String getUrlTo() {
		return urlTo;
	}
	public void setUrlTo(String urlTo) {
		this.urlTo = urlTo;
	}
	
}
