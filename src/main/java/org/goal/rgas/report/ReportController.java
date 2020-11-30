package org.goal.rgas.report;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberServiceImpl;
import org.goal.rgas.perform.Perform;
import org.goal.rgas.perform.PerformServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/report")
public class ReportController {
	@Autowired
	private HttpSession httpSession;

	@Autowired
	private ReportServiceImpl reportServiceImpl;

	@Autowired
	private MemberServiceImpl memberServiceImpl;

	@Autowired
	private PerformServiceImpl performServiceImpl;

	// 신고 등록 폼
	@GetMapping("/form/{no}")
	public ModelAndView reportRegisterForm(@PathVariable int no) {
		ModelAndView mv = new ModelAndView("/report/register");
		Member member = (Member) httpSession.getAttribute("memberValue");

		try {
			mv.addObject("performNo", no);
			mv.addObject("memberNo", member.getNo());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 신고 내역 등록
	@PostMapping
	public ModelAndView reportRegister(@Valid Report report, Errors errors) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/perform");

		try {
			if (errors.hasErrors()) {
				mv.setViewName("redirect:/mission");
				return mv;
			}
			reportServiceImpl.reportRegister(report);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 신고 내역 목록 조회
	@GetMapping
	public ModelAndView reportList() {
		ModelAndView mv = new ModelAndView();

		if ("A".equals(httpSession.getAttribute("auth"))) {
			try {
				mv.setViewName("/report/list");

				List<Report> reportList = reportServiceImpl.reportList(new Report());
				List<Member> memberList = memberServiceImpl.memberList(new Member());

				mv.addObject("list", reportList);
				mv.addObject("memberList", memberList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			mv.setViewName("redirect:/mission");
		}

		return mv;
	}

	// 신고 내역 상세 조회
	@GetMapping("/{no}")
	public ModelAndView reportInquiry(Report report) {
		ModelAndView mv = new ModelAndView();

		try {
			if ("A".equals(httpSession.getAttribute("auth")) && report != null) {
				mv.setViewName("/report/inquiry");

				Report reportValue = reportServiceImpl.reportInquiry(report);
				List<Member> memberList = memberServiceImpl.memberList(new Member());

				mv.addObject("memberList", memberList);
				mv.addObject("report", reportValue);
			} else {
				mv.setViewName("redirect:/mission");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 신고 내역 수정
	@PutMapping
	public ModelAndView reportModify(Report report) {
		ModelAndView mv = new ModelAndView(new RedirectView("/report"));
		Perform perform = new Perform();

		try {
			if (report != null) {
				perform.setNo(report.getPerformNo());
				perform.setStatus('N');

				performServiceImpl.performModify(perform);
				reportServiceImpl.reportModify(report);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 신고 내역 삭제
	@DeleteMapping
	public ModelAndView reportDelete(Report report) {
		ModelAndView mv = new ModelAndView(new RedirectView("/report"));

		try {
			if (report != null) {
				reportServiceImpl.reportDelete(report);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
}