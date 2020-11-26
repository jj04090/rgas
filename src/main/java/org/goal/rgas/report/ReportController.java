package org.goal.rgas.report;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberServiceImpl;
import org.goal.rgas.perform.Perform;
import org.goal.rgas.perform.PerformServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
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
	private ReportServiceImpl reportService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private PerformServiceImpl performService;
	
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("/form/{no}")
	public ModelAndView reportRegisterForm(@PathVariable int no) {
		ModelAndView mv = new ModelAndView("/report/register");
		
		String email = (String)httpSession.getAttribute("email");
		Member memberValue = new Member();
		memberValue.setEmail(email);
		
		try {
			int memberNo = memberService.memberInquiry(memberValue).getNo();
			
			mv.addObject("performNo", no);
			mv.addObject("memberNo", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@PostMapping
	public ModelAndView reportRegister(Report report) {
		ModelAndView mv = new ModelAndView(new RedirectView("/perform"));
		try {
			reportService.reportRegister(report);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@GetMapping
	public ModelAndView reportList(Report report) {
		ModelAndView mv = null;
		if ("A".equals(httpSession.getAttribute("auth"))) {
			try {
				mv = new ModelAndView("/report/list");
				
				List<Report> reportList = reportService.reportList(report);
				List<Member> memberList = memberService.memberList(new Member());
				
				mv.addObject("list", reportList);
				mv.addObject("memberList", memberList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			mv = new ModelAndView(new RedirectView("/mission"));
		}
		
		return mv;
	}
	
	@GetMapping("/{no}")
	public ModelAndView reportInquiry(Report report) {
		ModelAndView mv = null;
		
		if ("A".equals(httpSession.getAttribute("auth"))) {
			mv = new ModelAndView("/report/inquiry");
			
			try {
				Report reportValue = reportService.reportInquiry(report);
				List<Member> memberList = memberService.memberList(new Member());
				
				mv.addObject("memberList", memberList);
				mv.addObject("report", reportValue);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			mv = new ModelAndView(new RedirectView("/mission"));
		}
		
		return mv;
	}
	
	@PutMapping
	public ModelAndView reportModify(Report report) {
		ModelAndView mv = new ModelAndView(new RedirectView("/report"));
		Perform performValue = new Perform();
		
		performValue.setNo(report.getPerformNo());
		performValue.setStatus('N');
		System.out.println(performValue);
		try {
			performService.performModify(performValue);
			reportService.reportModify(report);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@DeleteMapping
	public ModelAndView reportDelete(Report report) {
		ModelAndView mv = new ModelAndView(new RedirectView("/report"));
		
		Report reportValue = new Report();
		reportValue.setNo(report.getNo());
		
		try {
			reportService.reportDelete(reportValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
}