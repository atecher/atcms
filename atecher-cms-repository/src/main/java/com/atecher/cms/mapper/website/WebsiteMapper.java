package com.atecher.cms.mapper.website;

import com.atecher.cms.model.manager.Article;
import com.atecher.cms.model.manager.Category;
import com.atecher.cms.model.manager.Tag;

import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface WebsiteMapper {

    int updateArticleClicks(Long articleId);

    Tag getTagsByArticleId(Long articleId);

    int checkVistorViewArticle(Map<String, Object> param);

    void addVistorView(Map<String, Object> param);

    Category getCategoryById(Long categoryId);

    List<Category> getCategoryByParentId(Long categoryId);

    Category getCategoryByPath(String param);

    List<Category> queryCategoryList();

    List<Article> queryArticleForPage(Map<String, Object> param);

    int queryArticleForPageCount(Map<String, Object> param);

    List<Article> queryArticleByTagForPage(Map<String, Object> param);

    int queryArticleByTagForPageCount(Map<String, Object> param);

    Article getArticleById(Long articleId);

    List<Article> selectPreNextArticle(Long articleId);

}
