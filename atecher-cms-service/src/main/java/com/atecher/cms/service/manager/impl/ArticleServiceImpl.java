package com.atecher.cms.service.manager.impl;

import com.atecher.cms.common.service.impl.GenericServiceImpl;
import com.atecher.cms.common.util.Constants;
import com.atecher.cms.model.manager.Article;
import com.atecher.cms.model.manager.Tag;
import com.atecher.cms.service.manager.IArticleService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class ArticleServiceImpl extends GenericServiceImpl implements IArticleService {
	private static final Logger logger = LoggerFactory.getLogger(ArticleServiceImpl.class);

	public void saveArticle(Article article) {
		List<String> imgList=new ArrayList<>();
		if(article!=null&&article.getContent()!=null){
			Document doc = Jsoup.parse(article.getContent());
			if(StringUtils.isEmpty(article.getSummary())){
				String con=doc.text().trim();
				article.setSummary((con.length()>100?con.substring(0, 100):con).trim());
			}
			Elements images=doc.getElementsByTag("img");
			for(Element im:images){
				String urlString=im.attr("src");
				if(!StringUtils.isEmpty(urlString)&&urlString.startsWith("http")){
					 try {
						BufferedImage sourceImg =ImageIO.read(new URL(urlString));
						if(sourceImg.getWidth()*sourceImg.getHeight()>10000){
							imgList.add(urlString);
						}
					} catch (Exception e) {
						logger.error("无法获取图片", e);
					}
				}
			}
			
			if(StringUtils.isEmpty(article.getCover_path())&&imgList.size()>0){
				article.setCover_path(imgList.get(0));
			 }
			Map<String,Object> conditionMap=new HashMap<>();
			if(article.getArticle_id()!=null){
				update("com.atecher.cms.mapper.manager.ArticleMapper.updateArticle", article);
				conditionMap.put("source_id", article.getArticle_id());
				conditionMap.put("type", 1);
				delete("com.atecher.cms.mapper.manager.ArticleMapper.deletePictures",conditionMap);
//				searchService.update((Article) get("com.atecher.cms.mapper.manager.ArticleMapper.getArticle", article.getArticle_id()));
			}else{
				insert("com.atecher.cms.mapper.manager.ArticleMapper.insertArticle", article);
				conditionMap.put("source_id", article.getArticle_id());
				conditionMap.put("type", 1);
//				searchService.add((Article) get(MybatisConstants.ARTICLE_GET_BY_ID, article.getArticle_id()));
			}
			int sorted=1;
			for(String url:imgList){
				conditionMap.put("pic_path", url);
				conditionMap.put("sorted", sorted++);
				insert("com.atecher.cms.mapper.manager.ArticleMapper.insertPicture", conditionMap);
			}
			/**
			 * 添加Tag
			 */
			delete("com.atecher.cms.mapper.manager.ArticleMapper.deleteTagsByArticleId", article.getArticle_id());
			String keywords=article.getKeywords();
			if(StringUtils.isEmpty(keywords)){
				String[] args=keywords.split(",");
				Map<String, Object> tagMap= new HashMap<>();
				tagMap.put("article_id", article.getArticle_id());
				for(String tag:args){
					tag=tag.trim();
					Long tagId=getOne("com.atecher.cms.mapper.manager.TagMapper.checkTag", tag);
					if(tagId==null){
						Tag tagModel=new Tag();
						tagModel.setTag(tag);
						try {
							tagModel.setCode(URLEncoder.encode(tag, Constants.CHARSET));
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						}
						insert("com.atecher.cms.mapper.manager.TagMapper.insertTag", tagModel);
						tagId=tagModel.getId();
					}
					tagMap.put("tag_id", tagId);
					insert("com.atecher.cms.mapper.manager.ArticleMapper.insertArticleTag", tagMap);
				}
			}
		}
	}
	

}
