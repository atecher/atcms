package com.atecher.cms.service.manager.impl;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.common.model.TreeNode;
import com.atecher.cms.mapper.manager.CategoryMapper;
import com.atecher.cms.model.manager.Category;
import com.atecher.cms.service.manager.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
@Service
public class CategoryServiceImpl implements ICategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    @Override
    public List<Category> queryCategoryList() {
        return categoryMapper.queryCategoryList();
    }
    @Override
    public Page<Category> selectCategoryForPage(int pageNo, int limit, Map<String, Object> param) {
        param.put("start", (pageNo - 1) * limit);
        param.put("limit", limit);
        int total = categoryMapper.selectCategoryForPageCount(param);
        if (total == 0) {
            return new Page<>(0, new ArrayList<Category>());
        } else {
            return new Page(total, categoryMapper.selectCategoryForPage(param));
        }
    }


    @Override
    public List<TreeNode> selectCategoryByParent(Map<String, Object> param) {
        return categoryMapper.selectCategoryByParent(param);
    }

    @Override
    public Category getCategory(Integer categoryId) {
        return categoryMapper.getCategory(categoryId);
    }

    @Override
    public int disabledCategory(Integer categoryId) {
        return categoryMapper.disabledCategory(categoryId);
    }

    @Override
    public int checkCategoryPath(Category category) {
        return categoryMapper.checkCategoryPath(category);
    }

    @Override
    public int updateCategory(Category category) {
        return categoryMapper.updateCategory(category);
    }

    @Override
    public void insertCategory(Category category) {
        categoryMapper.insertCategory(category);
    }
}
