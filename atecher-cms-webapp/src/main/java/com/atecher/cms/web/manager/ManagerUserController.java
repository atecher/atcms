package com.atecher.cms.web.manager;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.model.manager.User;
import com.atecher.cms.service.manager.IUserService;
import com.atecher.cms.web.util.ResponseResult;
import com.atecher.cms.web.util.WebForwardConstants;
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
@Controller
@RequestMapping(value="/admin/user")
public class ManagerUserController{
	@Autowired
	private IUserService userService;
	@RequestMapping(method=RequestMethod.GET)
	public String  index(){
		return WebForwardConstants.FWD_MANAGER_USER;
	}
	
	@RequestMapping(value="/roles/{user_id}",method = RequestMethod.GET)
	public String  roles(@PathVariable("user_id") Long user_id,Model model){
		model.addAttribute("ownRoles",userService.selectList("com.atecher.cms.mapper.manager.UserMapper.selectOwnRoles", user_id));
		model.addAttribute("otherRoles",userService.selectList("com.atecher.cms.mapper.manager.UserMapper.selectOtherRoles", user_id));
		return WebForwardConstants.FWD_MANAGER_USER_ROLE;
	}
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String  add(){
		return WebForwardConstants.FWD_MANAGER_USER_EDIT;
	}
	@RequestMapping(value="/edit/{user_id}",method = RequestMethod.GET)
	public String  edit(@PathVariable("user_id") Long userId,Model model){
		User user=userService.getOne("com.atecher.cms.mapper.manager.UserMapper.selectById",userId);
		model.addAttribute("user",user);
		return WebForwardConstants.FWD_MANAGER_USER_EDIT;
	}

	
	@RequestMapping(value="/roles/{user_id}",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult  saveRoles(@PathVariable("user_id") Long user_id,@RequestParam("role_ids") List<Long> role_ids){
		userService.saveUserRoles(user_id, role_ids);
		return new ResponseResult("success");
	}
	
	@RequestMapping(value="/data",method = RequestMethod.POST)
	@ResponseBody
	public Page<HashMap<String, Object>> getUsers(HttpServletRequest request) throws ParseException, IOException {
		int index = request.getParameter("offset") == null ? 0 : Integer.parseInt(request.getParameter("offset"));
		int limit = request.getParameter("limit") == null ? 10 : Integer.parseInt(request.getParameter("limit"));
		int pageNo=index/limit+1;
		HashMap<String, Object> params=new HashMap<String, Object>();
		String sort=request.getParameter("sort");
		if(!StringUtils.isEmpty(sort)){
			params.put("sort", sort);
			params.put("order", request.getParameter("order"));
		}
		params.put("search", request.getParameter("search"));
		return userService.selectForPage("com.atecher.cms.mapper.manager.UserMapper.selectUserForPage", pageNo, limit, params);
	}
	
	@RequestMapping(value = "/remove/{user_id}",method=RequestMethod.GET)
	public ResponseResult remove(@PathVariable("user_id") Long user_id){
		userService.update("com.atecher.cms.mapper.manager.UserMapper.disableUser", user_id);
		return new ResponseResult("success");
	}
}