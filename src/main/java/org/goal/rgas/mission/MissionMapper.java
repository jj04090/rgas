package org.goal.rgas.mission;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface MissionMapper {
    public List<Mission> list(Mission mission) throws Exception;
    public Mission select(Mission mission) throws Exception;
    public void insert(Mission mission) throws Exception;
    public void update(Mission mission) throws Exception;
    public void delete(Mission mission) throws Exception;
}