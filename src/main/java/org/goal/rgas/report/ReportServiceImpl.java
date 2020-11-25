package org.goal.rgas.report;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportMapper reportMapper;

	@Override
	public void reportRegister(Report report) throws Exception {
		reportMapper.insert(report);
	}

	@Override
	public List<Report> reportList(Report report) throws Exception {

		return reportMapper.list(report);
	}

	@Override
	public Report reportInquiry(Report report) throws Exception {

		return reportMapper.select(report);
	}

	@Override
	public void reportModify(Report report) throws Exception {
		Report reportValue = reportMapper.select(report);
		reportValue.setStatus('P');

		reportMapper.update(reportValue);
	}

	@Override
	public void reportDelete(Report report) throws Exception {
		reportMapper.delete(report);
	}
}
