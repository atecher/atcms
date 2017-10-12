package com.atecher.cms.service.website.impl;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.mapper.website.WebsiteMapper;
import com.atecher.cms.model.manager.Article;
import com.atecher.cms.model.manager.Category;
import com.atecher.cms.model.manager.Tag;
import com.atecher.cms.service.website.IWebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
@Service
public class WebsiteServiceImpl implements IWebsiteService {
    @Autowired
    private WebsiteMapper websiteMapper;

    @Override
    public int updateArticleClicks(Long articleId) {
        return websiteMapper.updateArticleClicks(articleId);
    }

    @Override
    public Tag getTagsByArticleId(Long articleId) {
        return websiteMapper.getTagsByArticleId(articleId);
    }

    @Override
    public int checkVistorViewArticle(Map<String, Object> param) {
        return websiteMapper.checkVistorViewArticle(param);
    }

    @Override
    public void addVistorView(Map<String, Object> param) {
        websiteMapper.addVistorView(param);
    }

    @Override
    public Category getCategoryById(Long categoryId) {
        return websiteMapper.getCategoryById(categoryId);
    }

    @Override
    public List<Category> getCategoryByParentId(Long categoryId) {
        return websiteMapper.getCategoryByParentId(categoryId);
    }

    @Override
    public Category getCategoryByPath(String param) {
        return websiteMapper.getCategoryByPath(param);
    }

    @Override
    public List<Category> queryCategoryList() {
        return websiteMapper.queryCategoryList();
    }

    @Override
    public Page<Article> queryArticleForPage(int pageNo, int limit,Map<String, Object> param) {
        param.put("start", (pageNo - 1) * limit);
        param.put("limit", limit);
        int total = websiteMapper.queryArticleForPageCount(param);
        if (total == 0) {
            return new Page<>(0, new ArrayList<Article>());
        } else {
            return new Page<>(total, websiteMapper.queryArticleForPage(param));
        }

    }


    @Override
    public Page<Article> queryArticleByTagForPage(int pageNo, int limit,Map<String, Object> param) {
        param.put("start", (pageNo - 1) * limit);
        param.put("limit", limit);
        int total = websiteMapper.queryArticleForPageCount(param);
        if (total == 0) {
            return new Page<>(0, new ArrayList<Article>());
        } else {
            return new Page<>(total, websiteMapper.queryArticleForPage(param));
        }
    }



    @Override
    public Article getArticleById(Long articleId) {
        return websiteMapper.getArticleById(articleId);
    }

    @Override
    public List<Article> selectPreNextArticle(Long articleId) {
        return websiteMapper.selectPreNextArticle(articleId);
    }
}
