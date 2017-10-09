package com.atecher.cms.service.search;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.model.manager.Article;

import java.io.IOException;


/**
 * Created by hanhongwei on 2016/6/14.
 * @author hongwei.han@qq.com
 */
public interface ISearchService {

    void buildIndexAll() throws IOException;

    Page<Article> search(int page, int limit, String text);

}
