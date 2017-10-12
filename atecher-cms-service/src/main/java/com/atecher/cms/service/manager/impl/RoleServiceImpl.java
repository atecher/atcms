package com.atecher.cms.service.manager.impl;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.mapper.manager.RoleMapper;
import com.atecher.cms.model.manager.Role;
import com.atecher.cms.service.manager.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by hanhongwei on 2017/10/11.
 */
@Service
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public Page<HashMap<String, Object>> selectRoleForPage(int pageNo, int limit, HashMap<String, Object> param) {
        param.put("start", (pageNo - 1) * limit);
        param.put("limit", limit);
        int total = roleMapper.selectRoleForPageCount(param);
        if (total == 0) {
            return new Page<>(0, new ArrayList<HashMap<String,Object>>());
        } else {
            return new Page<>(total, roleMapper.selectRoleForPage(param));
        }
    }

    @Override
    public Role getRole(Long roleId) {
        return roleMapper.getRole(roleId);
    }

    @Override
    public void insertRole(Role role) {
        roleMapper.insertRole(role);
    }

    @Override
    public int updateRole(Role role) {
        return roleMapper.updateRole(role);
    }

    @Override
    public int disableRole(Long roleId) {
        return roleMapper.disableRole(roleId);
    }
}
