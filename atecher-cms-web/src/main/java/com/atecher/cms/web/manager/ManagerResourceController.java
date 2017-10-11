package com.atecher.cms.web.manager;

import com.atecher.cms.service.common.ICommonService;
import com.atecher.cms.web.util.FileInfo;
import com.atecher.cms.web.util.WebForwardConstants;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
@Controller
public class ManagerResourceController{
	@Autowired
	private ICommonService commonService;
	@RequestMapping("/admin/resources")
	public String  index(Model model){
		List<HashMap<String, Object>> resourceRoots=commonService.getResourceRoot();
		model.addAttribute("resourceRoots", resourceRoots);
		return WebForwardConstants.FWD_MANAGER_RESOURCE;
	}
	@RequestMapping("/admin/resources/edit")
	public String  editFile(@RequestParam("path") String base64Path,HttpServletRequest request,Model model) throws IOException{
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String path=new String(Base64.decodeBase64(base64Path),"UTF-8");
		String realPath=request.getSession().getServletContext().getRealPath(path);
		File target=new File(realPath);

		FileInfo info=new FileInfo();
		String fileName=target.getName();
		info.setName(fileName);
		info.setType(target.isDirectory()?FileInfo.FOLDER:FileInfo.FILE);
		info.setSize(formetFileSize(target.isFile()?target.length():0));

		if(target.isFile()){
			info.setPath(path);
			info.setSuffix(fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase());
			if(info.getSuffix()!=null&&"txt,jsp,css,properties,js,json".contains(info.getSuffix())){
				String content=FileUtils.readFileToString(target,"utf-8");
				model.addAttribute("fileContent", content);
			}

		}else{
			info.setPath(path+"/"+fileName);
		}
		Calendar cd = Calendar.getInstance();
        cd.setTimeInMillis(target.lastModified());
		info.setLastModified(df.format(cd.getTime()));
		info.setEncodePath(Base64.encodeBase64String((path+"/"+fileName).getBytes("UTF-8")));
		model.addAttribute("fileInfo", info);
		return WebForwardConstants.FWD_MANAGER_EDIT;
	}
	@RequestMapping(value="/admin/resources/list",method = RequestMethod.POST)
	@ResponseBody
	public List<FileInfo>  resources(@RequestParam("path") String path,HttpServletRequest request) throws UnsupportedEncodingException{
		String realPath=request.getSession().getServletContext().getRealPath(path);
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		File[] children=new File(realPath).listFiles();
		List<FileInfo> files= new ArrayList<>();
		if(children!=null) {
			for (File file : children) {
				FileInfo info = new FileInfo();
				String fileName = file.getName();
				info.setName(fileName);
				info.setType(file.isDirectory() ? FileInfo.FOLDER : FileInfo.FILE);
				info.setSize(formetFileSize(file.isFile() ? file.length() : 0));
				info.setPath(path + "/" + fileName);
				if (file.isFile()) {
					info.setSuffix(fileName.substring(fileName.lastIndexOf(".") + 1));
				}
				Calendar cd = Calendar.getInstance();
				cd.setTimeInMillis(file.lastModified());
				info.setLastModified(df.format(cd.getTime()));
				info.setEncodePath(Base64.encodeBase64String((path + "/" + fileName).getBytes("UTF-8")));
				files.add(info);
			}
		}
		return files;
	}
	//转换文件大小
	private String formetFileSize(long fileS) {
		DecimalFormat df = new DecimalFormat("#.00");          
		String fileSizeString;
		if (fileS < 1024) {                
			fileSizeString = df.format((double) fileS) + "B"; 
		} else if (fileS < 1048576) {               
		    fileSizeString = df.format((double) fileS / 1024) + "K";         
		 } else if (fileS < 1073741824) {               
		     fileSizeString = df.format((double) fileS / 1048576) + "M";          
		} else {               
			fileSizeString = df.format((double) fileS / 1073741824) + "G"; 
		}          
		return fileSizeString;     
	}

}