package org.goal.rgas.mission;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/mission")
public class MissionController {
	@GetMapping("/form")
	public ModelAndView missionRegisterForm() {
		
		return null;
	}
	
	@PostMapping
	public ModelAndView missionRegister(Mission mission) {
		
		return null;
	}
	
	@GetMapping
	public ModelAndView missionList(Mission mission) {
		
		return null;
	}
	
	@GetMapping("/{no}")
	public ModelAndView missionInquiry(Mission mission) {
		
		return null;
	}
	
	@PutMapping
	public ModelAndView missionModify(Mission mission) {
		
		return null;
	}
	
	@DeleteMapping
	public ModelAndView missionDelete(Mission mission) {
		
		return null;
	}
}
