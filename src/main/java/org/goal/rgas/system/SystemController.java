package org.goal.rgas.system;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.goal.rgas.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
public class SystemController {
	@Autowired
	private HttpSession httpSession;

	@Autowired
	private SystemServiceImpl systemServiceImpl;

	// 로그인 폼
	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();

		if (httpSession.getAttribute("auth") != null) {
			mv.setViewName("/system/home");

			return mv;
		} else {
			mv.setViewName("/system/loginForm");

			return mv;
		}

	}

	// 로그인 폼
	@GetMapping("/login")
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView("/system/loginForm");

		return mv;
	}

	// 로그인 처리
	@PostMapping("/login")
	public ModelAndView login(Member member, Errors errors) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(member);
		boolean isLogin = systemServiceImpl.login(member);

		if (isLogin) {
			mv.setViewName("redirect:/home");
		} else {
			mv.setViewName("redirect:/login");
		}

		return mv;
	}

	@GetMapping("/logout")
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView(new RedirectView("/login"));
		systemServiceImpl.logout();

		return mv;
	}
}