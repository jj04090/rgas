package org.goal.rgas.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/charity")
public class CharityController {
	@Autowired
	public CharityServiceImpl charityServiceImpl;
	
	@GetMapping("/form")
	public ModelAndView charityRegisterForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/register");
		return mv;
	}
	
	@PostMapping
	public ModelAndView charityRegister(Charity charity) {
		ModelAndView mv = new ModelAndView(new RedirectView("charity"));
		try {
			charityServiceImpl.charityRegister(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@GetMapping
	public ModelAndView charityList(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/list");
		try {
			mv.addObject("charityList", charityServiceImpl.charityList(charity));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@GetMapping("/{no}")
	public ModelAndView charityInquiry(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/inquiry");
		try {
			mv.addObject("charity", charityServiceImpl.charityInquiry(charity));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@PutMapping
	public ModelAndView charityModify(Charity charity) {
		ModelAndView mv = new ModelAndView(new RedirectView("charity/"+charity.getNo()));
		try {
			charityServiceImpl.charityModify(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@DeleteMapping
	public ModelAndView charityDelete(Charity charity) {
		ModelAndView mv = new ModelAndView(new RedirectView("charity"));
		try {
			charityServiceImpl.charityDelete(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
