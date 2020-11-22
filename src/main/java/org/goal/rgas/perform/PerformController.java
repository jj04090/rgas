package org.goal.rgas.perform;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/perform")
public class PerformController {
	@GetMapping("/form")
	public ModelAndView performRegisterForm() {
		
		return null;
	}
	
	@PostMapping
	public ModelAndView performRegister() {
		
		return null;
	}
	
	@GetMapping
	public ModelAndView performList() {
		
		return null;
	}
	
	@GetMapping("/{no}")
	public ModelAndView performInquiry() {
		
		return null;
	}
	
	@PutMapping
	public ModelAndView performModify() {
		
		return null;
	}
	
	@DeleteMapping
	public ModelAndView performDelete() {
		
		return null;
	}
}
