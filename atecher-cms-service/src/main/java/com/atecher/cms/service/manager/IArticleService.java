package com.atecher.cms.service.manager;

import com.atecher.cms.common.service.IGenericService;
import com.atecher.cms.model.manager.Article;

public interface IArticleService extends IGenericService{
	
	void saveArticle(Article article);
	
}
