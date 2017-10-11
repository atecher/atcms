package com.atecher.cms.mapper.manager;

import com.atecher.cms.model.manager.Tag;

import java.util.List;
import java.util.Map;

/**
 * Created by hanhongwei on 2017/10/11.
 */
public interface TagMapper {

    List<Tag> getHotTagsTop(int limit);

    List<Tag> selectTags();

    Tag getTagByTag(String tag);

    int deleteTag(Long id);

    Long checkTag(String tag);

    void insertTag(Tag tag);

    void updateTagCount(Map<String, Object> tag);

}
