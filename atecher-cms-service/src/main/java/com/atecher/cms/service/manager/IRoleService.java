package com.atecher.cms.service.manager;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.model.manager.Role;

import java.util.HashMap;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface IRoleService {

    Page<HashMap<String, Object>> selectRoleForPage(int pageNo,int limit,HashMap<String, Object> param);

    Role getRole(Long roleId);

    void insertRole(Role role);

    int updateRole(Role role);

    int disableRole(Long roleId);
}
