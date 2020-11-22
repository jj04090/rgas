package org.goal.rgas.report;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/report")
public class ReportController {
	@GetMapping("/form")
	public ModelAndView reportRegisterForm() {
		
		return null;
	}
	
	@PostMapping
	public ModelAndView reportRegister(Report report) {
		
		return null;
	}
	
	@GetMapping
	public ModelAndView reportList(Report report) {
		
		return null;
	}
	
	@GetMapping("/{no}")
	public ModelAndView reportInquiry(Report report) {
		
		return null;
	}
	
	@PutMapping
	public ModelAndView reportModify(Report report) {
		
		return null;
	}
	
	@DeleteMapping
	public ModelAndView reportDelete(Report report) {
		
		return null;
	}
}
