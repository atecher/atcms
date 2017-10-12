package com.atecher.cms.service.auth.impl;

import com.atecher.cms.mapper.auth.AccountMapper;
import com.atecher.cms.model.auth.AuthUser;
import com.atecher.cms.model.auth.Menu;
import com.atecher.cms.service.auth.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AccountServiceImpl implements IAccountService {
	@Autowired
	private AccountMapper accountMapper;
	
	public AuthUser getAuthUserByAccount(String account) {
		return accountMapper.getAuthUserByAccount(account);
	}
	
	public List<Menu> getMenus(Long userId){
		HashMap<String, Object> query= new HashMap<>(2);
		query.put("parentCode", "system");
		query.put("userId", userId);
		return accountMapper.selectAuthMenuByParentCode(query);
	}
	

}
