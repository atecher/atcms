package com.atecher.cms.web.listener;

import com.atecher.cms.web.util.ServletContextUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 描述：系统启动监听，用户参数初始化
 * @author    mark.han
 * @version    v1.0
 */
public class StartupListener  implements ServletContextListener {
    private  final Log log = LogFactory.getLog(StartupListener.class);
	public void contextInitialized(ServletContextEvent event) {
		log.debug("Initializing context...");
		ServletContext context=event.getServletContext();
		ServletContextUtil.readSystemSetting(context);
	}
	
	
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
