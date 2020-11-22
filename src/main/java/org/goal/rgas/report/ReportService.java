package org.goal.rgas.report;

import java.util.List;

public interface ReportService{
	public void reportRegister(Report report) throws Exception;
	public List<Report> reportList(Report report) throws Exception;
	public Report reportInquiry(Report report) throws Exception;
	public void reportModify(Report report) throws Exception;
	public void reportDelete(Report report) throws Exception;
}