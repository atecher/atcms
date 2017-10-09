package com.atecher.cms.model.manager;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Category implements Serializable {
	private String[] nums={"一","二","三","四","五","六","七","八","九"};
	private static final long serialVersionUID = 8127206611141982939L;
	private Integer category_id;
	private Integer parent_id=-1;
	private Boolean is_display=true;
	private String category_name;
	private String category_path;
	private String keywords;
	private String description;
	private Integer category_level;
	private Integer priority;
	private Category parent;
	private List<Category> children=new ArrayList<Category>();

	
	public void addChild(Category category){
		children.add(category);
	}

	public List<Category> getChildren() {
		return children;
	}

	public void setChildren(List<Category> children) {
		this.children = children;
	}

	public String getLevelDesc(){
		if(this.category_level!=null&&this.category_level<10){
			return nums[this.category_level-1]+"级";
		}else{
			return this.category_level+"级";
		}
	}


	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String[] getNums() {
		return nums;
	}
	public void setNums(String[] nums) {
		this.nums = nums;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public Boolean getIs_display() {
		return is_display;
	}
	public void setIs_display(Boolean is_display) {
		this.is_display = is_display;
	}
	
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Integer getCategory_level() {
		return category_level;
	}
	public void setCategory_level(Integer category_level) {
		this.category_level = category_level;
	}
	public Category getParent() {
		return parent;
	}
	public void setParent(Category parent) {
		this.parent = parent;
	}

	public String getCategory_path() {
		return category_path;
	}

	public void setCategory_path(String category_path) {
		this.category_path = category_path;
	}
}