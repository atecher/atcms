package com.atecher.cms.web.manager;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.common.model.PaginationRequest;
import com.atecher.cms.common.model.TreeNode;
import com.atecher.cms.model.manager.Article;
import com.atecher.cms.service.manager.IArticleService;
import com.atecher.cms.service.manager.ICategoryService;
import com.atecher.cms.service.manager.ITagService;
import com.atecher.cms.web.common.GenericActionController;
import com.atecher.cms.web.util.ResponseResult;
import com.atecher.cms.web.util.WebForwardConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 描述：负责后台文章管理
 * @作者    mark.han
 * @邮箱    hongwei.han@qq.com
 * @日期    2014-7-29
 * @版本    v1.0
 */
@Controller
@RequestMapping(value = "/manage/article")
public class ManagerArticleController extends GenericActionController{
	private static final Logger logger = LoggerFactory.getLogger(ManagerArticleController.class);
	@Autowired
	private IArticleService articleService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private ITagService tagService;

	/**
	 * 描述：文章查询
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @邮箱 hongwei.han@qq.com
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET)
	public String index() {	
		return WebForwardConstants.MANAGER_ARTICLE_LIST;
	}
	
	@RequestMapping(value="/data",method=RequestMethod.POST)
	@ResponseBody
	public Page<Article> getArticlePage(PaginationRequest pagination, @RequestParam(value="search",required=false) String search) throws ParseException, IOException {
		HashMap<String, Object> params= new HashMap<>();
		if(!StringUtils.isEmpty(pagination.getSort())){
			params.put("sort", pagination.getSort());
			params.put("order", pagination.getOrder());
		}
		params.put("search", search);

		return articleService.selectArticleForPage(pagination.getPageNo(), pagination.getLimit(), params);
	}
	
	@RequestMapping(value="/categoryTree",method=RequestMethod.POST)
	@ResponseBody
	public List<TreeNode> categoryTree(HttpServletRequest request) throws ParseException, IOException {
		HashMap<String, Object> param= new HashMap<>(2);
		param.put("code",-1);
		return categoryService.selectCategoryByParent(param);
	}
	
	@RequestMapping(value = "/add",method=RequestMethod.GET)
	public String add(Model model) {	
		logger.debug("正在创建文章");
		model.addAttribute("tags", tagService.getHotTagsTop(10));
		return WebForwardConstants.MANAGER_ARTICLE_EDIT;
	}
	
	@RequestMapping(value = "/edit/{article_id}",method=RequestMethod.GET)
	public String edit(@PathVariable("article_id") Long article_id,Model model) {
		Article article=articleService.getArticle(article_id);
		model.addAttribute("article", article);
		model.addAttribute("tags", tagService.getHotTagsTop(10));
		logger.debug("正在编辑ID为{}的文章", article.getArticle_id());
		return WebForwardConstants.MANAGER_ARTICLE_EDIT;
	}
	
	/**
	 * 描述：保存文章信息
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @邮箱 hongwei.han@qq.com
	 * @param article
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save(@ModelAttribute("article") Article article){
			articleService.saveArticle(article);
			return WebForwardConstants.MANAGER_REDIRECT_ARTICLE_LIST;
	}
	
	/**
	 * 描述：删除文章
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @邮箱 hongwei.han@qq.com
	 * @param article_id
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/remove/{article_id}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult delete(@PathVariable("article_id") Long article_id) throws IOException{
		articleService.deleteArticle(article_id);
		return new ResponseResult("success");
	}
	
	@RequestMapping(value = "/module/{article_id}",method = RequestMethod.GET)
	public String moduleEdit(@PathVariable("article_id") Long article_id,Model model) throws IOException{
		model.addAttribute("unselectModule", articleService.getUnSelectedModule(article_id));
		model.addAttribute("selectModule", articleService.getSelectedModule(article_id));
		model.addAttribute("article_id", article_id);
		return WebForwardConstants.MANAGER_ARTICLE_MODULE;
	}

	/**
	 * @param article_id
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/module/{article_id}",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult moduleSave(@PathVariable("article_id") Long article_id,@RequestParam("module_ids") List<Long> module_ids) throws IOException{
		articleService.deleteModuleArticle(article_id);
		if(module_ids!=null){
			Map<String,Object> map= new HashMap<>();
			map.put("article_id", article_id);
			for(Long module_id:module_ids){
				map.put("module_id", module_id);
				articleService.insertModuleArticle(map);
			}
		}
		return new ResponseResult("success");
	}
	
}
