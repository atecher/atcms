package com.atecher.cms.web.util;

import com.atecher.cms.service.common.ICommonService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
public class ServletContextUtil {
	public static void readSystemSetting(ServletContext context){
		ApplicationContext  app=WebApplicationContextUtils.getWebApplicationContext(context);
		ICommonService commonService=(ICommonService)app.getBean("commonService");
		Map<String,Object> profileSetting=commonService.getProfile();
		List<Map<String,String>> constants=commonService.getConstants();
		for (Entry<String, Object> en : profileSetting.entrySet()) {
			context.setAttribute(en.getKey(), en.getValue());
			Constants.updateProperties(en.getKey(), (String) en.getValue());
		}
		for(Map<String,String> map:constants){
			Constants.updateProperties(map.get("profile_key"), map.get("profile_value"));
		}
	}
	
	public static void buildAllIndex(ServletContext context){
//		ApplicationContext  app=WebApplicationContextUtils.getWebApplicationContext(context);
//		ISearchService searchService=(ISearchService)app.getBean("searchServiceImpl");
//		searchService.buildIndex();
	}
}
