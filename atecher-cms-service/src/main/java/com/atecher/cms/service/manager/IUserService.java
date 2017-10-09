package com.atecher.cms.service.manager;

import com.atecher.cms.common.service.IGenericService;

import java.util.List;

public interface IUserService extends IGenericService{
	void saveUserRoles(Long user_id,List<Long> role_ids);
}
