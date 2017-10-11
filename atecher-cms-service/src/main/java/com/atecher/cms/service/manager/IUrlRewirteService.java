package com.atecher.cms.service.manager;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.model.manager.RewriteRule;

import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface IUrlRewirteService {

    List<RewriteRule> list();

    Page<RewriteRule> queryUrlRewirteForPage(int pageNo,int limit,Map<String, Object> param);

    RewriteRule get(Long id);

    RewriteRule check(String urlFrom);

    void insert(RewriteRule rewriteRule);

    int update(RewriteRule rewriteRule);

    int delete(Long id);
}
