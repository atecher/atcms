package com.atecher.cms.service.common.impl;

import com.atecher.cms.mapper.manager.CommonMapper;
import com.atecher.cms.service.common.ICommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
@Service("commonService")
public class CommonServiceImpl implements ICommonService {
    @Autowired
    private CommonMapper commonMapper;
    @Override
    public List<HashMap<String, Object>> getResourceRoot() {
        return commonMapper.getResourceRoot();
    }

    @Override
    public List<Map<String, String>> getConstants() {
        return commonMapper.getConstants();
    }

    @Override
    public Map<String, Object> getProfile() {
        return commonMapper.getProfile();
    }

    @Override
    public int updateProfile(Map<String, Object> param) {
        return commonMapper.updateProfile(param);
    }

    @Override
    public Map<String, Object> getSingleByType(String type) {
        return commonMapper.getSingleByType(type);
    }
}
