package org.goal.rgas.report;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportMapper reportMapper;

	//신고 내역 등록
	@Override
	public void reportRegister(Report report) throws Exception {
		reportMapper.insert(report);
	}

	//신고 내역 목록 조회
	@Override
	public List<Report> reportList(Report report) throws Exception {

		return reportMapper.list(report);
	}

	//신고 내역 상세 조회
	@Override
	public Report reportInquiry(Report report) throws Exception {

		return reportMapper.select(report);
	}

	//신고 내역 수정
	@Override
	public void reportModify(Report report) throws Exception {
		Report reportValue = reportMapper.select(report);
		reportValue.setStatus('P');

		reportMapper.update(reportValue);
	}

	//신고 내역 삭제
	@Override
	public void reportDelete(Report report) throws Exception {
		reportMapper.delete(report);
	}
}
