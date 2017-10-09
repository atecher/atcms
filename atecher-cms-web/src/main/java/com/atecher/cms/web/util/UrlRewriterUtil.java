package com.atecher.cms.web.util;

import com.atecher.cms.model.manager.RewriteRule;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

public class UrlRewriterUtil {

	public synchronized static void  rewriteConf(String confPath,List<RewriteRule> list){
		try {
			SAXBuilder sb = new SAXBuilder();
			Document doc = sb.build(confPath);
			Element root=doc.getRootElement();
			if(root.removeChildren("rule")){
				for(RewriteRule rule:list){
					Element ruleEl=new Element("rule");
			        Element fromEl=new Element("from");
			        fromEl.setText(rule.getUrlFrom());
			        Element toEl=new Element("to");
			        toEl.setAttribute("type", rule.getUrlToType());
			        toEl.setText(rule.getUrlTo());
			        ruleEl.addContent(fromEl);
			        ruleEl.addContent(toEl);
			        root.addContent(ruleEl);
				}
				XMLOutputter out=new XMLOutputter();
				OutputStream os=new FileOutputStream(confPath);
		        out.output(doc,os);
				os.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
