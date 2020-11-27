package org.goal.rgas.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
 */
@Mapper
public interface ReportMapper {
	public List<Report> list(Report report) throws Exception;

	public Report select(Report report) throws Exception;

	public void insert(Report report) throws Exception;

	public void update(Report report) throws Exception;

	public void delete(Report report) throws Exception;
}