package org.goal.rgas.report;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportMapper reportMapper;
	@Autowired
	private HttpSession httpSession;

	@Override
	public void reportRegister(Report report) throws Exception {
		reportMapper.insert(report);
	}

	@Override
	public List<Report> reportList(Report report) throws Exception {
		List<Report> list = null;

		list = reportMapper.list(report);

		return list;
	}

	@Override
	public Report reportInquiry(Report report) throws Exception {
		Report reportValue = reportMapper.select(report);

		return reportValue;
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
