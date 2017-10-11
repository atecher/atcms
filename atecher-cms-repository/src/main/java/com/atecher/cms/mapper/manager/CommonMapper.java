package com.atecher.cms.mapper.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface CommonMapper {

    List<HashMap<String, Object>> getResourceRoot();

    List<Map<String, String>> getConstants();

    Map<String, Object> getProfile();

    int updateProfile(Map<String, Object> param);

    Map<String, Object> getSingleByType(String type);

}
