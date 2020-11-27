package org.goal.rgas.charity;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	private CharityServiceImpl charityServiceImpl;

	//기부 단체 등록 폼
	@GetMapping("/form")
	public ModelAndView charityRegisterForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/register");

		return mv;
	}

	//기부 단체 등록 처리
	@PostMapping
	public ModelAndView charityRegister(@Valid Charity charity, Errors errors) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/charity");
		
		try {
			if (errors.hasErrors()) {
				mv.setViewName("redirect:/charity/form");

				return mv;
			}
			charityServiceImpl.charityRegister(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}

	//기부 단체 목록 조회
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

	//기부 단체 상세 조회
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

	//기부 단체 수정
	@PutMapping
	public ModelAndView charityModify(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/charity");
		
		try {
			charityServiceImpl.charityModify(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}

	//기부 단체 삭제
	@DeleteMapping
	public ModelAndView charityDelete(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/charity");
		
		try {
			charityServiceImpl.charityDelete(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
}