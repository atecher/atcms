package com.atecher.cms.web.util;

import com.atecher.cms.common.service.IGenericService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
public class ServletContextUtil {
	public static void readSystemSetting(ServletContext context){
		ApplicationContext  app=WebApplicationContextUtils.getWebApplicationContext(context);
		IGenericService genericService=(IGenericService)app.getBean("genericService");
		Map<String,Object> profileSetting=genericService.getOne("com.atecher.cms.mapper.manager.ProfileMapper.getProfile", null);
		List<Map<String,String>> constants=genericService.selectList("com.atecher.cms.mapper.manager.ProfileMapper.getConstants", null);
		Iterator<Entry<String, Object>> its=profileSetting.entrySet().iterator();
		while(its.hasNext()){
			Entry<String, Object> en=its.next();
			context.setAttribute((String)en.getKey(), en.getValue());
			Constants.updateProperties((String)en.getKey(), (String)en.getValue());
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
