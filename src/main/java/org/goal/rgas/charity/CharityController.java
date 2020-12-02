package org.goal.rgas.charity;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
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
	@Autowired
	private CharityServiceImpl charityServiceImpl;
	
	@Autowired
	private Properties properties;
    // 기부 단체 등록 폼
	@GetMapping("/form")
	public ModelAndView charityRegisterForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/register");

		return mv;
	}

	// 기부 단체 등록 처리
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

	// 기부 단체 목록 조회
	@GetMapping
	public ModelAndView charityList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/list");
		try {
			Map<String, String> map = new HashMap<String, String>();
			
			properties.load(new FileInputStream(new File("src/main/resources/bankcode.properties").getAbsolutePath()));
			
			for (String key : properties.stringPropertyNames()) {
				map.put(key, new String(properties.getProperty(key).getBytes("ISO-8859-1"), "utf-8"));
			}
			
			mv.addObject("bankList", map);
			mv.addObject("charityList", charityServiceImpl.charityList(new Charity()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 기부 단체 상세 조회
	@GetMapping("/{no}")
	public ModelAndView charityInquiry(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/inquiry");
		try {
			charity = charityServiceImpl.charityInquiry(charity);
			
			properties.load(new FileInputStream(new File("src/main/resources/bankcode.properties").getAbsolutePath()));
			if (charity != null) {
				mv.addObject("charity", charity);
				mv.addObject("bankName", new String(properties.getProperty(charity.getBank()).getBytes("ISO-8859-1"), "utf-8"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 기부 단체 수정
	@PutMapping
	public ModelAndView charityModify(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/charity");

		try {
			if (charity != null) {
				charityServiceImpl.charityModify(charity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 기부 단체 삭제
	@DeleteMapping
	public ModelAndView charityDelete(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/charity");

		try {
			if (charity != null) {
				charityServiceImpl.charityDelete(charity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
}