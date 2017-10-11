package com.atecher.cms.web.website;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.model.manager.Article;
import com.atecher.cms.model.manager.Category;
import com.atecher.cms.model.manager.Tag;
import com.atecher.cms.service.common.ICommonService;
import com.atecher.cms.service.manager.IArticleService;
import com.atecher.cms.service.manager.ITagService;
import com.atecher.cms.service.website.IWebsiteService;
import com.atecher.cms.web.common.GenericActionController;
import com.atecher.cms.web.util.WebForwardConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
/**
 * 描述：网站信息展示控制类
 * @版本    v1.0
 */
@Controller
public class WebsiteController extends GenericActionController{
	private static final Logger logger = LoggerFactory.getLogger(WebsiteController.class);
	@Autowired
	private ICommonService commonService;
	@Autowired
	private IWebsiteService websiteService;
	@Autowired
	private IArticleService articleService;
	@Autowired
	private ITagService tagService;

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(Model model) throws Exception {
		return page(1,model);
	}
	@RequestMapping(value="/page/{pageNo}",method=RequestMethod.GET)
	public String page(@PathVariable("pageNo") Integer page,Model model) throws Exception {
		Map<String,Object> query= new HashMap<>();
		Page<Article> pageInfo=websiteService.queryArticleForPage(page,10,query);
		model.addAttribute("articleList", pageInfo.getRows());
		model.addAttribute("page", page);
		model.addAttribute("totalRows", pageInfo.getTotal());
		model.addAttribute("displayRows", 10);
		List<Map<String,Object>> modules=articleService.getModulesByPosition("index");

		for(Map<String,Object> map:modules){
			model.addAttribute((String)map.get("module_code"), articleService.getModuleArticles(map));
		}
		model.addAttribute("hots", articleService.hotArticle());
		model.addAttribute("tags", tagService.getHotTagsTop(20));
		return WebForwardConstants.FWD_WEBSITE_INDEX;
	}


	
	private void getCategoryNav(Category category,List<Category> nav){
		nav.add(category);
		if(category!=null&&category.getParent()!=null){
			getCategoryNav(category.getParent(), nav);
		}
	}
	
	@RequestMapping(value="/category/{menuId}",method=RequestMethod.GET)
	public String category(@PathVariable("menuId") String menuId, Model model) throws Exception {
		return categoryPage(menuId,1,model);
	}

	@RequestMapping(value="/category/{menuId}/page/{pageNo}",method=RequestMethod.GET)
	public String categoryPage(@PathVariable("menuId") String menuId,@PathVariable("pageNo") Integer page, Model model) throws Exception {
		Category category= websiteService.getCategoryByPath(menuId);
		List<Category> nav= new ArrayList<>();
		getCategoryNav(category, nav);
		Collections.reverse(nav);
		model.addAttribute("categoryNav", nav);
		List<Integer> categoryIds=new ArrayList<>();
		Map<String,Object> query= new HashMap<>();
		if(category!=null){
			getCategoryList(category,categoryIds);
			query.put("category_ids",categoryIds);
			Page<Article> pageInfo=websiteService.queryArticleForPage(page,10,query);
			model.addAttribute("articleList", pageInfo.getRows());
			model.addAttribute("page", page);
			model.addAttribute("totalRows", pageInfo.getTotal());
			model.addAttribute("displayRows", 10);
			model.addAttribute("menuId",menuId);
			model.addAttribute("category", category);
			List<Map<String,Object>> modules=articleService.getModulesByPosition("category");
			for(Map<String,Object> map:modules){
				model.addAttribute((String)map.get("module_code"),articleService.getModuleArticles(map));
			}
			model.addAttribute("hots", articleService.hotArticle());
			model.addAttribute("tags", tagService.getHotTagsTop(20));
			return WebForwardConstants.FWD_WEBSITE_CATEGORY;
		}else{
			return WebForwardConstants.REDIRECT_ROOT;
		}
	}
	
	
	/**
	 * 描述：查看文章详细内容
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @author hongwei.han@qq.com
	 * @param article_id
	 * @param model
	 */
	@RequestMapping(value="/article/{article_id}",method=RequestMethod.GET)
	public String article(@PathVariable("article_id") Long article_id,Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Map<String,Object> vistorMap=getVisitorInfo(request, response);
		vistorMap.put("article_id", article_id);
		vistorMap.put("handle", "view");
		if(websiteService.checkVistorViewArticle(vistorMap)==0){
			websiteService.updateArticleClicks(article_id);//点击量+1
			websiteService.addVistorView(vistorMap);//点击量+1
		}
		long start=System.currentTimeMillis();
		model.addAttribute("article", websiteService.getArticleById(article_id));
		model.addAttribute("preNext", websiteService.selectPreNextArticle(article_id));//上一篇下一篇文章
		List<Map<String,Object>> modules=articleService.getModulesByPosition("category");
		for(Map<String,Object> map:modules){
			model.addAttribute((String)map.get("module_code"), articleService.getModuleArticles(map));
		}
		model.addAttribute("hots", articleService.hotArticle());
		model.addAttribute("tags", tagService.getHotTagsTop(20));

		logger.info("文章页面生成使用了{}毫秒",System.currentTimeMillis()-start);
		return WebForwardConstants.FWD_WEBSITE_DETAIL;
	}
	
	@RequestMapping(value="/tag/{tag}",method=RequestMethod.GET)
	public String tag(@PathVariable("tag") String tag, Model model) throws Exception {

		return tagData(tag,1,model);
	}

	@RequestMapping(value="/tag/{tag}/page/{pageNo}",method=RequestMethod.GET)
	public String tagData(@PathVariable("tag") String tag, @PathVariable("pageNo") Integer page,Model model) throws Exception {
		Map<String,Object> query= new HashMap<>();
		int displayRows=10;
		Tag tagObj=tagService.getTagByTag(tag);
		query.put("tag_id", tagObj!=null?tagObj.getId():-1);
		Page<Article> pageInfo=websiteService.queryArticleByTagForPage(page,displayRows,query);
		model.addAttribute("articleList", pageInfo.getRows());
		model.addAttribute("page", page);
		model.addAttribute("totalRows", pageInfo.getTotal());
		model.addAttribute("displayRows", displayRows);
		model.addAttribute("tag",tagObj);
		model.addAttribute("hots", articleService.hotArticle());
		model.addAttribute("tags", tagService.getHotTagsTop(20));
		List<Map<String,Object>> modules=articleService.getModulesByPosition("category");
		for(Map<String,Object> map:modules){
			model.addAttribute((String)map.get("module_code"), articleService.getModuleArticles(map));
		}
		return WebForwardConstants.FWD_WEBSITE_TAG;
	}
	
	
	/**
	 * @作者 mark.han
	 * @日期 2014-12-15
	 * @邮箱 hongwei.han@qq.com
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/single",method=RequestMethod.GET)
	public String intruduction(@RequestParam("type") String type,Model model) throws Exception {
		model.addAttribute("single", commonService.getSingleByType(type));
		List<Map<String,Object>> modules=articleService.getModulesByPosition("category");
		for(Map<String,Object> map:modules){
			model.addAttribute((String)map.get("module_code"), articleService.getModuleArticles(map));
		}
		model.addAttribute("hots", articleService.hotArticle());
		model.addAttribute("tags", tagService.getHotTagsTop(20));
		return WebForwardConstants.FWD_WEBSITE_SINGLE;
	}

	private void getCategoryList(Category category,List<Integer> category_ids){
		category_ids.add(category.getCategory_id());
		if(category.getChildren()!=null&&category.getChildren().size()>0){
			for(Category child:category.getChildren()){
				getCategoryList(child,category_ids);
			}
		}
	}

}
