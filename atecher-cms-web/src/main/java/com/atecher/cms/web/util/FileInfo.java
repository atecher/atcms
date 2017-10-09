package com.atecher.cms.web.util;



public class FileInfo {
	public static final String FILE="file";
	public static final String FOLDER="folder";
	private String name;
	private String path;
	private String type;
	private String suffix;
	private String size;
	private String lastModified;
	private String encodePath;

	
	public String getEncodePath() {
		return encodePath;
	}
	public void setEncodePath(String encodePath) {
		this.encodePath = encodePath;
	}
	public String getLastModified() {
		return lastModified;
	}
	public void setLastModified(String lastModified) {
		this.lastModified = lastModified;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSuffix() {
		return suffix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
}
