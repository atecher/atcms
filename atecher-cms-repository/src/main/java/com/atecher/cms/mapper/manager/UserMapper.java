package com.atecher.cms.mapper.manager;

import com.atecher.cms.model.auth.AuthUser;
import com.atecher.cms.model.manager.User;
import com.atecher.cms.model.manager.UserRole;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface UserMapper {

    User getUser(Long userId);

    List<HashMap<String,Object>> selectUserForPage(HashMap<String,Object> param);

    int selectUserForPageCount(HashMap<String,Object> param);

    void insert(User user);

    int update(User user);

    int disableUser(Long user_id);


    List<HashMap<String,Object>> selectOwnRoles(Long userId);

    List<HashMap<String,Object>> selectOtherRoles(Long userId);

    int deleteUserRoleByUserId(Long user_id);

    void insertUserRole(UserRole ur);

    int updateAvatar(Map<String,Object> param);

    int resetPassword(AuthUser authUser);


}
