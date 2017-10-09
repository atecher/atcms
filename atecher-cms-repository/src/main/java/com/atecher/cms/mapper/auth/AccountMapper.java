package com.atecher.cms.mapper.auth;

import com.atecher.cms.model.auth.AuthUser;
import com.atecher.cms.model.auth.Menu;

import java.util.HashMap;
import java.util.List;

public interface AccountMapper {

	AuthUser getAuthUserByAccount(String account);
	
	List<Menu> selectAuthMenuByParentCode(HashMap<String, Object> query);
	
}
