package com.atecher.cms.service.manager.impl;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.mapper.manager.UrlRewirteMapper;
import com.atecher.cms.model.manager.RewriteRule;
import com.atecher.cms.service.manager.IUrlRewirteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
@Service("urlRewirteService")
public class UrlRewirteServiceImpl implements IUrlRewirteService {
    @Autowired
    private UrlRewirteMapper urlRewirteMapper;
    @Override
    public List<RewriteRule> list() {
        return urlRewirteMapper.list();
    }

    @Override
    public Page<RewriteRule> queryUrlRewirteForPage(int pageNo, int limit, Map<String, Object> param) {
        param.put("start", (pageNo - 1) * limit);
        param.put("limit", limit);
        int total = urlRewirteMapper.queryUrlRewirteForPageCount(param);
        if (total == 0) {
            return new Page<>(0, new ArrayList<RewriteRule>());
        } else {
            return new Page<>(total, urlRewirteMapper.queryUrlRewirteForPage(param));
        }
    }

    @Override
    public RewriteRule get(Long id) {
        return urlRewirteMapper.get(id);
    }

    @Override
    public RewriteRule check(String urlFrom) {
        return urlRewirteMapper.check(urlFrom);
    }

    @Override
    public void insert(RewriteRule rewriteRule) {
        urlRewirteMapper.insert(rewriteRule);
    }

    @Override
    public int update(RewriteRule rewriteRule) {
        return urlRewirteMapper.update(rewriteRule);
    }

    @Override
    public int delete(Long id) {
        return urlRewirteMapper.delete(id);
    }
}
