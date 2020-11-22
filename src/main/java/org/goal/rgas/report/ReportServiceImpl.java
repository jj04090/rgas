package org.goal.rgas.report;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService{
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
		if ("A".equals(httpSession.getAttribute("auth"))) {
			List<Report> list = reportMapper.list(report);
			
			return list;
		}
		
		return null;
	}

	@Override
	public Report reportInquiry(Report report) throws Exception {
		if (httpSession.getAttribute("auth").equals("admin")) {
			Report reportValue = reportMapper.select(report);
			
			return reportValue;
		}
		
		return null;
	}

	@Override
	public void reportModify(Report report) throws Exception {
		if (httpSession.getAttribute("auth").equals("admin")) {
			Report reportValue = reportMapper.select(report);
			reportValue.setStatus('Y');
			
			reportMapper.update(reportValue);
		}
	}

	@Override
	public void reportDelete(Report report) throws Exception {
		if (httpSession.getAttribute("auth").equals("admin")) {
			reportMapper.delete(report);
		}
	}
}
