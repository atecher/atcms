package com.atecher.cms.web.filter;

import com.atecher.cms.model.manager.RewriteRule;
import com.atecher.cms.service.manager.IUrlRewirteService;
import com.atecher.cms.web.util.Constants;
import com.atecher.cms.web.util.UrlRewriterUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.tuckey.web.filters.urlrewrite.UrlRewriteFilter;
import org.tuckey.web.filters.urlrewrite.utils.StringUtils;

import javax.servlet.*;
import java.io.IOException;
import java.util.List;


public class CustomUrlRewriterFilter extends UrlRewriteFilter {

    public void init(final FilterConfig filterConfig) throws ServletException {
        String confPathStr = filterConfig.getInitParameter("confPath");
        ServletContext context = filterConfig.getServletContext();
        String confPath;
        if (!StringUtils.isBlank(confPathStr)) {
            confPath = StringUtils.trim(confPathStr);
        } else {
            confPath = DEFAULT_WEB_CONF_PATH;
        }
        String urlRewiriterPath = context.getRealPath(confPath);

        ApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(context);
        IUrlRewirteService urlRewirteService = (IUrlRewirteService) app.getBean("urlRewirteService");
        List<RewriteRule> list = urlRewirteService.list();
        Constants.updateProperties("URLREWIRITER_CONF_PATH", urlRewiriterPath);
        UrlRewriterUtil.rewriteConf(urlRewiriterPath, list);
        super.init(filterConfig);
    }

}
