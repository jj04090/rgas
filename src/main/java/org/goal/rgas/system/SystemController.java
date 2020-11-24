package org.goal.rgas.system;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
public class SystemController {
	@Autowired
	private SystemServiceImpl systemService;
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("/login")
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView("/system/loginForm");
		
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView login(Member member) throws Exception {
		ModelAndView mv = null;
		boolean isLogin = systemService.login(member);
		
		if(isLogin) {
			if ("A".equals(httpSession.getAttribute("auth"))) {
				mv = new ModelAndView(new RedirectView("/member"));
			} else {
				mv = new ModelAndView(new RedirectView("/mission"));
			}
		} else {
			mv = new ModelAndView("/system/loginForm");
		}
		
		return mv;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView(new RedirectView("/login"));
		systemService.logout();
		
		return mv;
	}
}
