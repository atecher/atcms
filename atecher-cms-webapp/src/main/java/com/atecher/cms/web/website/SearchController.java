package com.atecher.cms.web.website;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.common.service.IGenericService;
import com.atecher.cms.model.manager.Article;
import com.atecher.cms.service.search.ISearchService;
import com.atecher.cms.web.common.GenericActionController;
import com.atecher.cms.web.util.WebForwardConstants;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * DESC:
 * Created by hongwei.han@qq.com on 2016/6/13.
 */
@Controller
@RequestMapping("/search")
public class SearchController extends GenericActionController {
    private  final Log log = LogFactory.getLog(SearchController.class);
    @Autowired
    ISearchService searchService;
    @Autowired
    private IGenericService genericService;
    @RequestMapping(method= RequestMethod.GET)
    public String index(@RequestParam("s") String searchText,Model model) throws Exception {
      return search(searchText,1,model);
    }
    @RequestMapping("/page/{pageNo}")
    public String search(@RequestParam("s") String searchText, @PathVariable("pageNo") Integer page, Model model) throws Exception {
        List<Map<String,Object>> modules=genericService.selectList("com.atecher.cms.mapper.manager.ArticleMapper.getModulesByPosition", "category");
        for(Map<String,Object> map:modules){
            model.addAttribute((String)map.get("module_code"), genericService.selectList("com.atecher.cms.mapper.manager.ArticleMapper.getModuleArticles", map));
        }
        model.addAttribute("hots", genericService.selectList("com.atecher.cms.mapper.manager.ArticleMapper.hotArticle", null));
        model.addAttribute("tags", genericService.selectList("com.atecher.cms.mapper.manager.TagMapper.getHotTagsTop", 20));
        if(StringUtils.isNotEmpty(searchText)){
            try{
                Page<Article> results=searchService.search(page,10,searchText);
                model.addAttribute("searchList", results.getRows());
                model.addAttribute("totalRows", results.getTotal());
            }catch (Exception e){
                log.error("搜索出现错误",e);
                model.addAttribute("searchList",new ArrayList<>());
                model.addAttribute("totalRows", 0);
            }


            model.addAttribute("page", page);

            model.addAttribute("displayRows", 10);
            model.addAttribute("searchText", searchText);
            model.addAttribute("searchTextEncode", URLEncoder.encode(searchText,"UTF-8"));
        }
        return WebForwardConstants.FWD_WEBSITE_SEARCH;
    }

}
