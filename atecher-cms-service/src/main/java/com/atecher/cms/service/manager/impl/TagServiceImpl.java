package com.atecher.cms.service.manager.impl;

import com.atecher.cms.mapper.manager.TagMapper;
import com.atecher.cms.model.manager.Tag;
import com.atecher.cms.service.manager.ITagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
@Service
public class TagServiceImpl implements ITagService {
    @Autowired
    private TagMapper tagMapper;
    @Override
    public List<Tag> getHotTagsTop(int limit) {
        return tagMapper.getHotTagsTop(limit);
    }

    @Override
    public List<Tag> selectTags() {
        return tagMapper.selectTags();
    }

    @Override
    public Tag getTagByTag(String tag) {
        return tagMapper.getTagByTag(tag);
    }

    @Override
    public int deleteTag(Long id) {
        return tagMapper.deleteTag(id);
    }

    @Override
    public Long checkTag(String tag) {
        return tagMapper.checkTag(tag);
    }

    @Override
    public void insertTag(Tag tag) {
        tagMapper.insertTag(tag);
    }

    @Override
    public void updateTagCount(Map<String, Object> tag) {
        tagMapper.updateTagCount(tag);
    }
}
