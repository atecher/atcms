package com.atecher.cms.service.manager.impl;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.mapper.manager.UserMapper;
import com.atecher.cms.model.auth.AuthUser;
import com.atecher.cms.model.manager.User;
import com.atecher.cms.model.manager.UserRole;
import com.atecher.cms.service.manager.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl  implements IUserService {

	@Autowired
	UserMapper userMapper;

	public void saveUserRoles(Long user_id, List<Long> role_ids) {
		userMapper.deleteUserRoleByUserId(user_id);
		if(role_ids!=null&&role_ids.size()>0){
			for(Long role_id:role_ids){
				UserRole userRole=new UserRole();
				userRole.setRole_id(role_id);
				userRole.setUser_id(user_id);
				userMapper.insertUserRole(userRole);
			}
		}
	}

	@Override
	public User getUser(Long userId) {
		return userMapper.getUser(userId);
	}

	@Override
	public Page<HashMap<String,Object>> selectUserForPage(int pageNo, int limit, HashMap<String,Object> param){
		param.put("start", (pageNo - 1) * limit);
		param.put("limit", limit);
		int total = userMapper.selectUserForPageCount(param);
		if (total == 0) {
			return new Page<>(0, new ArrayList<HashMap<String,Object>>());
		} else {
			return new Page<>(total, userMapper.selectUserForPage(param));
		}
	}


	@Override
	public void insertUser(User user) {
		userMapper.insert(user);
	}

	@Override
	public int updateUser(User user) {
		return userMapper.update(user);
	}

	@Override
	public int disableUser(Long userId) {
		return userMapper.disableUser(userId);
	}

	@Override
	public List<HashMap<String, Object>> selectOwnRoles(Long userId) {
		return userMapper.selectOwnRoles(userId);
	}

	@Override
	public List<HashMap<String, Object>> selectOtherRoles(Long userId) {
		return userMapper.selectOtherRoles(userId);
	}


	@Override
	public int updateAvatar(Map<String, Object> param) {
		return userMapper.updateAvatar(param);
	}

	@Override
	public int resetPassword(AuthUser authUser) {
		return userMapper.resetPassword(authUser);
	}

}
