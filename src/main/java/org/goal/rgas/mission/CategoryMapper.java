package org.goal.rgas.mission;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface CategoryMapper {
    public List<Category> list(Category category) throws Exception;
}