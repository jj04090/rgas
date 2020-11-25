package org.goal.rgas.perform;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface PerformMapper {
    public List<Perform> list(Perform perform) throws Exception;
    public Perform select(Perform perform) throws Exception;
    public void insert(Perform perform) throws Exception;
    public void update(Perform perform) throws Exception;
    public void delete(Perform perform) throws Exception;
}