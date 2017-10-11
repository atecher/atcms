package com.atecher.cms.service.manager;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.model.manager.Article;

import java.util.List;
import java.util.Map;

public interface IArticleService{
	
	void saveArticle(Article article);


	List<Map<String,Object>> queryArticleMainForPage(Map<String,Object> param);

	Page<Article> selectArticleForPage(int page,int limit,Map<String,Object> param);

	List<Article> hotArticle();

	Article getArticle(Long articleId);


	int deleteArticle(Long articleId);

	List<Map<String,Object>> getUnSelectedModule(Long articleId);

	List<Map<String,Object>> getSelectedModule(Long articleId);

	List<Article> getModuleArticles(Map<String,Object> param);

	List<Map<String,Object>> getModulesByPosition(String position);

	int deleteModuleArticle(Long articleId);

	void insertModuleArticle(Map<String,Object> param);


}
