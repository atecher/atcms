package com.atecher.cms.service.manager.impl;

import com.atecher.cms.common.service.impl.GenericServiceImpl;
import com.atecher.cms.model.manager.UserRole;
import com.atecher.cms.service.manager.IUserService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl extends GenericServiceImpl implements IUserService {
	
	public void saveUserRoles(Long user_id, List<Long> role_ids) {
		delete("com.atecher.cms.mapper.manager.UserMapper.deleteUserRoleByUserId", user_id);
		if(role_ids!=null&&role_ids.size()>0){
			for(Long role_id:role_ids){
				UserRole userRole=new UserRole();
				userRole.setRole_id(role_id);
				userRole.setUser_id(user_id);
				insert("com.atecher.cms.mapper.manager.UserMapper.insertUserRole", userRole);
			}
		}
	}

}
