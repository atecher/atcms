package com.atecher.cms.web.util;

/**
 * 描述：页面跳转静态常量类
 * 
 * @author hongwei.han@qq.com
 * @version v1.0
 */
public class WebForwardConstants {
	public static final String REDIRECT_ROOT = "redirect:/";
	public static final String FWD_LOGIN = "account/login";
	public static final String REDIRECT_LOGIN = "redirect:/account/login";
	
	/**
	 * 管理
	 */
	public static final String FWD_MANAGER_INDEX="manager/index";
	public static final String FWD_MANAGER_DASHBOARD="manager/dashboard";
	
	public static final String FWD_MANAGER_USER="manager/user/index";
	public static final String FWD_MANAGER_USER_ROLE="manager/user/roles";
	public static final String FWD_MANAGER_USER_EDIT="manager/user/edit";
	
	public static final String FWD_MANAGER_ROLE="manager/role/index";
	
	public static final String FWD_MANAGER_ROLE_EDIT="manager/role/edit";
	
	public static final String REDIRECT_MANAGER_ROLE="redirect:/admin/role";
	/** 资源管理 */
	public static final String FWD_MANAGER_RESOURCE="manager/resource/index";
	public static final String FWD_MANAGER_EDIT="manager/resource/edit";
	
	/** 分类管理 */
	public static final String MANAGER_CATEGORY_LIST = "manager/category/index";
	public static final String MANAGER_CATEGORY_EDIT = "manager/category/edit";
	
	public static final String MANAGER_ARTICLE_LIST = "manager/article/index";
	public static final String MANAGER_ARTICLE_EDIT = "manager/article/edit";
	public static final String MANAGER_ARTICLE_MODULE = "manager/article/module";
	public static final String MANAGER_REDIRECT_ARTICLE_LIST = "redirect:/manage/article";
	
	
	/**URLREWRITE*/
	public static final String FWD_MANAGER_URLREWRITE = "manager/urlrewrite/index";
	public static final String FWD_MANAGER_URLREWRITE_EDIT = "manager/urlrewrite/edit";
	/**PROFILE*/
	
	public static final String FWD_MANAGER_SETTING = "manager/setting/setting";
	public static final String FWD_MANAGER_PROFILE = "manager/setting/profile";
	
	public static final String FWD_MANAGER_HOME = "manager/home/index";
	public static final String FWD_MANAGER_HOME_PASSWORD = "manager/home/password";
	public static final String FWD_MANAGER_HOME_AVATAR = "manager/home/avatar";
	
	public static final String ERROR_500 = "error/500";
	
	/** 系统登录跳转页面 */
	public static final String REDIRECT = "redirect:";
	
	public static final String FWD_WEBSITE_INDEX="website/index";
	public static final String FWD_WEBSITE_CATEGORY="website/category";
	public static final String FWD_WEBSITE_DETAIL="website/detail";
	public static final String FWD_WEBSITE_TAG="website/tag";
	public static final String FWD_WEBSITE_SINGLE="website/single";
	public static final String FWD_WEBSITE_SEARCH="website/search";


}
