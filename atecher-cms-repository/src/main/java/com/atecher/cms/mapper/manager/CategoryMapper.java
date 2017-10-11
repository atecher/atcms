package com.atecher.cms.mapper.manager;

import com.atecher.cms.common.model.TreeNode;
import com.atecher.cms.model.manager.Category;

import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface CategoryMapper {

    List<Category> queryCategoryList();

    List<Category> selectCategoryForPage(Map<String, Object> param);

    int selectCategoryForPageCount(Map<String, Object> param);

    List<TreeNode> selectCategoryByParent(Map<String, Object> param);

    Category getCategory(Integer categoryId);

    int disabledCategory(Integer categoryId);

    int checkCategoryPath(Category category);

    int updateCategory(Category category);

    void insertCategory(Category category);
}
