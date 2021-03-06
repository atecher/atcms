package com.atecher.cms.common.service.impl;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.common.repository.IGenericRepository;
import com.atecher.cms.common.service.IGenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service(value = "genericService")
public class GenericServiceImpl implements IGenericService {
    @Autowired
    protected IGenericRepository genericRepository;

    public int delete(String sql_key, Object parameter) {
        return genericRepository.delete(sql_key, parameter);
    }

    public <T> T getOne(String sql_key, Object id) {
        return genericRepository.getOne(sql_key, id);
    }

    public <T> Page<T> selectForPage(String sql_key, int pageNo, int limit, Map<String, Object> parameter) {
        parameter.put("start", (pageNo - 1) * limit);
        parameter.put("limit", limit);
        int total = genericRepository.getListCount(sql_key + "Count", parameter);
        if (total == 0) {
            return new Page<>(0, new ArrayList<T>());
        } else {
            return new Page(total, genericRepository.selectList(sql_key, parameter));
        }
    }

    public Object insert(String sql_key, Object parameter) {
        return genericRepository.insert(sql_key, parameter);
    }

    public int update(String sql_key, Object parameter) {
        return genericRepository.update(sql_key, parameter);
    }

    public <T> List<T> selectList(String sql_key, Object parameter) {

        return genericRepository.selectList(sql_key, parameter);
    }

}
