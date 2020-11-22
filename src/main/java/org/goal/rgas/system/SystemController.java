package org.goal.rgas.system;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class SystemController {
	@Autowired
	public HttpSession httpSession;
	
	@GetMapping("/login")
	public ModelAndView loginForm() {
		httpSession.setAttribute("auth", "sucess");
		return null;
	}
	
	@PostMapping("/login")
	public ModelAndView login(Member member) {
		
		return null;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout() {
		
		return null;
	}
}
