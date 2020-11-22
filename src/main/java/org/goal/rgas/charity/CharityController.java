package org.goal.rgas.charity;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/charity")
public class CharityController {
	
	@GetMapping("/form")
	public ModelAndView charityRegisterForm() {
		return null;
	}
	
	@PostMapping
	public ModelAndView charityRegister(Charity charity) {
		return null;
	}
	
	@GetMapping
	public ModelAndView charityList(Charity charity) {
		
		return null;
	}
	
	@GetMapping("/{no}")
	public ModelAndView charityInquiry(Charity charity) {
		return null;
	}
	
	@PutMapping
	public ModelAndView charityModify(Charity charity) {
		return null;
	}
	
	@DeleteMapping
	public ModelAndView charityDelete(Charity charity) {
		return null;
	}
}
