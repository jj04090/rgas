package org.goal.rgas.member;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/member")
public class MemberController {
	@GetMapping("/form")
	public ModelAndView memberRegisterForm() {
		
		return null;
	}
	
	@PostMapping
	public ModelAndView memberRegister(Member member) {
		
		return null;
	}
	
	@GetMapping
	public ModelAndView memberList(Member member) {
		
		return null;
	}
	
	@GetMapping("/{no}")
	public ModelAndView memberInquiry(Member member) {
		
		return null;
	}
	
	@GetMapping("/{no}/form")
	public ModelAndView memberModifyForm(Member member) {
		
		return null;
	}

	@PutMapping
	public ModelAndView memberModify(Member member) {
		
		return null;
	}
	
}
