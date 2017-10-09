package com.atecher.cms.web.manager;

import com.alibaba.fastjson.JSONObject;
import com.atecher.cms.common.service.IGenericService;
import com.atecher.cms.common.util.PasswordUtil;
import com.atecher.cms.model.auth.AuthUser;
import com.atecher.cms.model.manager.User;
import com.atecher.cms.service.auth.IAccountService;
import com.atecher.cms.web.common.GenericActionController;
import com.atecher.cms.web.util.Constants;
import com.atecher.cms.web.util.Message;
import com.atecher.cms.web.util.WebForwardConstants;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;



/**
 * 描述：用户中心控制类
 */
@Controller
public class ManagerUserCenterController extends GenericActionController{
	private static final Logger logger = LoggerFactory.getLogger(ManagerUserCenterController.class);
	private static final String GET_USER_KEY="com.atecher.cms.mapper.manager.UserMapper.selectById";
	@Autowired
	private IGenericService genericService;
	@Autowired
	private IAccountService accountService;
	/**
	 * 描述：用户信息查看
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user",method=RequestMethod.GET)
	public String index(Model model,HttpServletRequest request) throws Exception {
		User user=genericService.getOne(GET_USER_KEY, getCurrentUserId(request));
		model.addAttribute("user", user);
		logger.info("访问用户中心");
		return WebForwardConstants.FWD_MANAGER_HOME;
	}



	@RequestMapping(value = "/user/password", method = RequestMethod.GET)
	public String password(Model model, HttpServletRequest request) throws Exception {
		Long user_id = getCurrentUserId(request);
		User user = genericService.getOne(GET_USER_KEY, user_id);
		model.addAttribute("user", user);
		return WebForwardConstants.FWD_MANAGER_HOME;

	}

	@RequestMapping(value = "/user/password", method = RequestMethod.POST)
	public String updatePassword(Model model, HttpServletRequest request) throws Exception {
		String oldPasswd = request.getParameter("user_old_password");
		String newPasswd = request.getParameter("user_new_password");
		String rePasswd = request.getParameter("user_rep_password");
		AuthUser currentUser=getCurrentUser(request);
		AuthUser user =accountService.getAuthUserByAccount(currentUser.getAccount());
		JSONObject json = new JSONObject();
		if (user.getPassword().equals(PasswordUtil.passwordEncrypt(oldPasswd))) {
			if (StringUtils.isNotEmpty(newPasswd) && newPasswd.equals(rePasswd)) {
				user.setPassword(PasswordUtil.passwordEncrypt(newPasswd));
				genericService.update("com.atecher.cms.mapper.manager.UserMapper.resetPassword", user);
				model.addAttribute(Constants.BIZ_MESS, Message.SUCCESS("成功提示：密码重置成功！"));
			}else{
				json.put("message", "两次输入的密码不一致");
				model.addAttribute(Constants.BIZ_MESS, Message.ERROR("两次输入的密码不一致"));
			}
		} else {
			model.addAttribute(Constants.BIZ_MESS, Message.ERROR("原密码不正确！"));
		}
		model.addAttribute("user", user);
		return WebForwardConstants.FWD_MANAGER_HOME_PASSWORD;

	}


	@RequestMapping(value = "/user/avatar", method = RequestMethod.GET)
	public String avatar(Model model, HttpServletRequest request) throws Exception {
		User user = genericService.getOne(GET_USER_KEY, getCurrentUserId(request));
		model.addAttribute("user", user);
		return WebForwardConstants.FWD_MANAGER_HOME_AVATAR;
	}
	@ResponseBody
	@RequestMapping(value = "/user/avatar", method = RequestMethod.POST)
	public JSONObject avatarPost(MultipartHttpServletRequest request) throws Exception {
        MultipartFile avatar=request.getFile("__avatar1");
		Long user_id = getCurrentUserId(request);
		JSONObject json=new JSONObject();
		String dirPath="/avatar/"+new SimpleDateFormat("yyyyMMdd").format(new Date());
		String remoteDirPath=request.getSession().getServletContext().getRealPath(dirPath);
		try {
			File destFile = new File(remoteDirPath + "/" + user_id);
			if (!destFile.exists()) {
				destFile.mkdirs();
			}
			String fileNameNew = UUID.randomUUID().toString() + ".jpg" ;//
			File f = new File(destFile.getAbsoluteFile() + File.separator + fileNameNew);
			//如果当前文件已经存在了，就跳过。
			if (f.exists()) {

			}else{
				avatar.transferTo(f);
				f.createNewFile();
                String url=dirPath+"/"+user_id+ File.separator + fileNameNew;
				json.put("url",url);
                json.put("success",true);
                Map<String, Object> imageMap = new HashMap<>();
                imageMap.put("user_id", user_id);
                imageMap.put("avatar", url);
                int success=genericService.update("com.atecher.cms.mapper.manager.UserMapper.updateAvatar", imageMap);

                AuthUser authUser = getCurrentUser(request);
                authUser.setAvatar(url);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return json;

	}


	
}
