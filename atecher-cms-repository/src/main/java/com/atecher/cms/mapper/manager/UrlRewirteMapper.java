package com.atecher.cms.mapper.manager;

import com.atecher.cms.model.manager.RewriteRule;

import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface UrlRewirteMapper {

    List<RewriteRule> list();

    List<RewriteRule> queryUrlRewirteForPage(Map<String, Object> param);

    int queryUrlRewirteForPageCount(Map<String, Object> param);

    RewriteRule get(Long id);

    RewriteRule check(String urlFrom);

    void insert(RewriteRule rewriteRule);

    int update(RewriteRule rewriteRule);

    int delete(Long id);


}
