package com.atecher.cms.model.manager;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


public class Article implements Serializable {
	private static final long serialVersionUID = -1195518622053857175L;
	private Long article_id;
	private Integer category_id;
	private String title;
	private String author;
	private String summary;
	private String original;
	private String template;
	private Date create_time;
	private Date update_time;
	private Integer total_clicks;
	private String keywords;
	private String content;
	private String cover_path;
	private String category_name;
	private String category_path;
	private Boolean pre=false;
	private Boolean next=false;
	private Integer status;
	private List<Tag> tags;
	
	public Boolean getPre() {
		return pre;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setPre(Boolean pre) {
		this.pre = pre;
	}

	public Boolean getNext() {
		return next;
	}

	public void setNext(Boolean next) {
		this.next = next;
	}
	public Article() {

	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getCategory_path() {
		return category_path;
	}

	public void setCategory_path(String category_path) {
		this.category_path = category_path;
	}

	public List<String> getKeywordList() {
		if(keywords!=null&&!keywords.equals("")){
			return Arrays.asList(keywords.split(","));
		}else{
			return new ArrayList<String>();
		}
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}
	
	public String getOriginal() {
		return original;
	}

	public void setOriginal(String original) {
		this.original = original;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public Integer getTotal_clicks() {
		return total_clicks;
	}

	public void setTotal_clicks(Integer total_clicks) {
		this.total_clicks = total_clicks;
	}

	public String getCover_path() {
		return cover_path;
	}

	public void setCover_path(String cover_path) {
		this.cover_path = cover_path;
	}

	public Long getArticle_id() {
		return article_id;
	}

	public void setArticle_id(Long article_id) {
		this.article_id = article_id;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

}