<<<<<<< HEAD
package org.goal.rgas.refunds;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface RefundsMapper {
	/* public int count(Refunds refunds) throws Exception; */
    public List<Refunds> list(Refunds refunds) throws Exception;
    public Refunds select(Refunds refunds) throws Exception;
    public void insert(Refunds refunds) throws Exception;
	/*
	 * public void update(Refunds refunds) throws Exception; public void
	 * delete(Refunds refunds) throws Exception;
	 */
=======
package org.goal.rgas.refunds;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface RefundsMapper {
	/* public int count(Refunds refunds) throws Exception; */
    public List<Refunds> list(Refunds refunds) throws Exception;
    public Refunds select(Refunds refunds) throws Exception;
    public void insert(Refunds refunds) throws Exception;
	/*
	 * public void update(Refunds refunds) throws Exception; public void
	 * delete(Refunds refunds) throws Exception;
	 */
>>>>>>> refs/remotes/origin/suhyung
}