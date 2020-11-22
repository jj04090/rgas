<<<<<<< HEAD
package org.goal.rgas.mission;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface CategoryMapper {
//  public int count(Category category) throws Exception;
    public List<Category> list(Category category) throws Exception;
//  public Category select(Category category) throws Exception;
//  public void insert(Category category) throws Exception;
//  public void update(Category category) throws Exception;
//  public void delete(Category category) throws Exception;
=======
package org.goal.rgas.mission;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface CategoryMapper {
//  public int count(Category category) throws Exception;
    public List<Category> list(Category category) throws Exception;
//  public Category select(Category category) throws Exception;
//  public void insert(Category category) throws Exception;
//  public void update(Category category) throws Exception;
//  public void delete(Category category) throws Exception;
>>>>>>> refs/remotes/origin/suhyung
}