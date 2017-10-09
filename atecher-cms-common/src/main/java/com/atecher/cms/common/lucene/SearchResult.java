package com.atecher.cms.common.lucene;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by hanhongwei on 2016/6/14.
 */
public class SearchResult implements Serializable {

    private Long id;
    private String title;
    private Date modifiedTime;
    private String content;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
