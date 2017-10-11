package com.atecher.cms.service.manager;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.model.auth.AuthUser;
import com.atecher.cms.model.manager.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface IUserService{
	void saveUserRoles(Long user_id,List<Long> role_ids);

	User getUser(Long userId);

	Page<HashMap<String,Object>> selectUserForPage(int pageNo,int limit,HashMap<String,Object> param);

	void insertUser(User user);

	int updateUser(User user);

	int disableUser(Long userId);

	List<HashMap<String,Object>> selectOwnRoles(Long userId);

	List<HashMap<String,Object>> selectOtherRoles(Long userId);

	int updateAvatar(Map<String,Object> user_id);

	int resetPassword(AuthUser authUser);
}
