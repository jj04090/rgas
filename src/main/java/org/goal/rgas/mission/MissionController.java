package org.goal.rgas.mission;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/mission")
public class MissionController {
	@Autowired
	private MissionServiceImpl missionService;
	
	@GetMapping("/form")
	public ModelAndView missionRegisterForm() {
		ModelAndView mv = new ModelAndView("/mission/register");
		
		return mv;
	}
	@PostMapping
	public ModelAndView missionRegister(@RequestParam("img") MultipartFile file, Mission mission) { 
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		try {
			missionService.missionRegister(file, mission);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv; 
	 }
	
	@GetMapping
	public ModelAndView missionList(Mission mission) {
		ModelAndView mv = new ModelAndView();
		
		return mv;
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
