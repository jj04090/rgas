package org.goal.rgas.report;

import java.util.List;

public interface ReportService{
	public void reportRegister(Report report);
	public List<Report> reportList(Report report);
	public Report reportInquiry(Report report);
	public void reportModify(Report report);
	public void reportDelete(Report report);
}