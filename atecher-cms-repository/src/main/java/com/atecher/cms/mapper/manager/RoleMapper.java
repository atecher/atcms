package com.atecher.cms.mapper.manager;

import com.atecher.cms.model.manager.Role;

import java.util.HashMap;
import java.util.List;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface RoleMapper {

    List<HashMap<String, Object>> selectRoleForPage(HashMap<String, Object> param);

    int selectRoleForPageCount(HashMap<String, Object> param);

    Role getRole(Long roleId);

    void insertRole(Role role);

    int updateRole(Role role);

    int disableRole(Long roleId);

}
