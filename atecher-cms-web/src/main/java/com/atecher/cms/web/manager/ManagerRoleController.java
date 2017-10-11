package com.atecher.cms.web.manager;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.common.model.PaginationRequest;
import com.atecher.cms.model.manager.Role;
import com.atecher.cms.service.manager.IRoleService;
import com.atecher.cms.web.common.GenericActionController;
import com.atecher.cms.web.util.Constants;
import com.atecher.cms.web.util.Message;
import com.atecher.cms.web.util.ResponseResult;
import com.atecher.cms.web.util.WebForwardConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * 描述：角色控制类
 * @作者    mark.han
 * @邮箱    hongwei.han@qq.com
 * @日期    2014-7-29
 * @版本    v1.0
 */
@Controller
@RequestMapping(value = "/admin/role")
public class ManagerRoleController extends GenericActionController{
	@Autowired
	private IRoleService roleService;
	/**
	 * 描述：角色查询
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @邮箱 hongwei.han@qq.com
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET)
	public String init() {
		return WebForwardConstants.FWD_MANAGER_ROLE;
	}


	/**
	 * 描述：角色查询
     */
	@RequestMapping(value="/data",method = RequestMethod.POST)
	@ResponseBody
	public  Page<HashMap<String, Object>> getRoles(PaginationRequest pagination, @RequestParam(value="search",required=false) String search) {
		HashMap<String, Object> params= new HashMap<>();
		if(!StringUtils.isEmpty(pagination.getSort())){
			params.put("sort", pagination.getSort());
			params.put("order", pagination.getOrder());
		}
		params.put("search",search);
		return roleService.selectRoleForPage(pagination.getPageNo(), pagination.getLimit(), params);
	}
	
	/**
	 * 描述： 编辑角色
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @邮箱 hongwei.han@qq.com
	 * @param role_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/edit/{role_id}",method=RequestMethod.GET)
	public String edit(@PathVariable("role_id") Long role_id,Model model){
		model.addAttribute("role", roleService.getRole(role_id));
		return WebForwardConstants.FWD_MANAGER_ROLE_EDIT;
	}
	/**
	 * 描述：新增角色
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @邮箱 hongwei.han@qq.com
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String add(){
		return WebForwardConstants.FWD_MANAGER_ROLE_EDIT;
	}
	/**
	 * 描述：保存角色信息
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @邮箱 hongwei.han@qq.com
	 * @param role

	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST) 
	public String save(@ModelAttribute("role") Role role,Model model){
		if(role!=null){
			if(role.getRole_id()!=null){
				roleService.updateRole(role);
			}else{
				roleService.insertRole(role);
			}
		}
		model.addAttribute(Constants.BIZ_MESS, Message.SUCCESS("成功提示：保存成功！"));
		return WebForwardConstants.REDIRECT_MANAGER_ROLE;
	}
	/**
	 * 描述：删除单个角色
	 * @作者 mark.han
	 * @日期 2014-7-29
	 * @邮箱 hongwei.han@qq.com
	 * @param role_id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/remove/{role_id}",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult remove(@PathVariable("role_id") Long role_id,HttpServletRequest request,Model model){
		roleService.disableRole(role_id);
		return new ResponseResult("success");
	}
}
