package com.atecher.cms.web.website;

import com.atecher.cms.model.manager.Category;
import com.atecher.cms.model.manager.Tag;
import com.atecher.cms.service.manager.IArticleService;
import com.atecher.cms.service.manager.ICategoryService;
import com.atecher.cms.service.manager.ITagService;
import com.atecher.cms.web.common.GenericActionController;
import com.atecher.cms.web.util.SiteMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hongw on 2016/6/13.
 */
@Controller
@RequestMapping("/SiteMap.xml")
public class SiteMapController extends GenericActionController {
    @Autowired
    IArticleService articleService;
    @Autowired
    ICategoryService categoryService;
    @Autowired
    ITagService tagService;
    @RequestMapping(method= RequestMethod.GET)
    public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/xml;charset=utf-8");
        OutputStream out = response.getOutputStream();
        String web_realm_name = (String) request.getSession().getServletContext().getAttribute("web_realm_name");
        buildSiteMap(out,web_realm_name);
        out.flush();
        out.close();
    }
    private void buildSiteMap(OutputStream os,String web_realm_name){
        try {
            SiteMap siteMap= SiteMap.getInstance();
            siteMap.init();

            //首页
            siteMap.addUrl(web_realm_name, new Date(), "daily", "1.0");
            //分类
            List<Category> categories=categoryService.queryCategoryList();
            for(Category category:categories){
                siteMap.addUrl(web_realm_name+"/category/"+category.getCategory_path(), new Date(), "daily", "0.8");
            }
            //文章
            Map<String,Object> queryParam= new HashMap<>();
            int startRow=0;
            queryParam.put("limit", 100);
            queryParam.put("startRow", startRow);
            List<Map<String,Object>> articles=articleService.queryArticleMainForPage(queryParam);
            while(articles.size()>0){
                for(Map<String,Object> map:articles){
                    siteMap.addUrl(web_realm_name+"/article/"+map.get("article_id"), (Date)map.get("update_time"), "daily", "0.8");
                }
                startRow+=100;
                queryParam.put("startRow", startRow);
                articles=articleService.queryArticleMainForPage(queryParam);
            }
            //标签
            List<Tag> list=tagService.selectTags();
            for(Tag tag:list){
                siteMap.addUrl(web_realm_name+"/tag/"+tag.getCode(), new Date(), "daily", "0.8");
            }

            siteMap.writeXml(os);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
