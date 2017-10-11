package com.atecher.cms.mapper.manager;

import com.atecher.cms.model.manager.Article;

import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface ArticleMapper {

    List<Map<String,Object>> queryArticleMainForPage(Map<String,Object> param);

    List<Article> selectArticleForPage(Map<String,Object> param);

    int selectArticleForPageCount(Map<String,Object> param);

    List<Article> hotArticle();

    Article getArticle(Long articleId);

    void insertArticle(Article article);

    void insertPicture(Map<String,Object> param);

    int deletePictures(Map<String,Object> param);

    int updateArticle(Article article);

    int deleteArticle(Long articleId);

    List<Map<String,Object>> getUnSelectedModule(Long articleId);

    List<Map<String,Object>> getSelectedModule(Long articleId);

    List<Article> getModuleArticles(Map<String,Object> param);

    List<Map<String,Object>> getModulesByPosition(String position);

    int deleteModuleArticle(Long articleId);

    void insertModuleArticle(Map<String,Object> param);

    void insertArticleTag(Map<String,Object> param);

    int deleteTagsByArticleId(Long articleId);

}
