package org.goal.rgas.charity;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface CharityMapper {
//  public int count(Charity charity) throws Exception;
    public List<Charity> list(Charity charity) throws Exception;
    public Charity select(Charity charity) throws Exception;
    public void insert(Charity charity) throws Exception;
    public void update(Charity charity) throws Exception;
    public void delete(Charity charity) throws Exception;
}