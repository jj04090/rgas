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
	private ReportServiceImpl reportServiceImpl;

	@Autowired
	private MemberServiceImpl memberServiceImpl;

	@Autowired
	private PerformServiceImpl performServiceImpl;

	@Autowired
	private HttpSession httpSession;

	// 신고 등록 폼
	@GetMapping("/form/{no}")
	public ModelAndView reportRegisterForm(@PathVariable int no) {
		ModelAndView mv = new ModelAndView("/report/register");

		String email = (String) httpSession.getAttribute("email");
		Member memberValue = new Member();
		memberValue.setEmail(email);

		try {
			int memberNo = memberServiceImpl.memberInquiry(memberValue).getNo();

			mv.addObject("performNo", no);
			mv.addObject("memberNo", memberNo);
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
	public ModelAndView reportList(Report report) {
		ModelAndView mv = new ModelAndView();

		if ("A".equals(httpSession.getAttribute("auth"))) {
			try {
				mv.setViewName("/report/list");

				List<Report> reportList = reportServiceImpl.reportList(report);
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

		if ("A".equals(httpSession.getAttribute("auth"))) {
			mv.setViewName("/report/inquiry");

			try {
				Report reportValue = reportServiceImpl.reportInquiry(report);
				List<Member> memberList = memberServiceImpl.memberList(new Member());

				mv.addObject("memberList", memberList);
				mv.addObject("report", reportValue);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			mv.setViewName("redirect:/mission");
		}

		return mv;
	}

	// 신고 내역 수정
	@PutMapping
	public ModelAndView reportModify(Report report) {
		ModelAndView mv = new ModelAndView(new RedirectView("/report"));
		Perform performValue = new Perform();

		performValue.setNo(report.getPerformNo());
		performValue.setStatus('N');
		System.out.println(performValue);
		try {
			performServiceImpl.performModify(performValue);
			reportServiceImpl.reportModify(report);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 신고 내역 삭제
	@DeleteMapping
	public ModelAndView reportDelete(Report report) {
		ModelAndView mv = new ModelAndView(new RedirectView("/report"));

		Report reportValue = new Report();
		reportValue.setNo(report.getNo());

		try {
			reportServiceImpl.reportDelete(reportValue);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
}