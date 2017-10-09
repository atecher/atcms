package com.atecher.cms.service.auth;

import com.atecher.cms.model.auth.AuthUser;
import com.atecher.cms.model.auth.Menu;

import java.util.List;

public interface IAccountService {

	List<Menu> getMenus(Long userId);
	
	AuthUser getAuthUserByAccount(String account);
}
