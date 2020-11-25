package org.goal.rgas.emailcertification;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/email")
public class EmailCertificationController {
	@Autowired
	private EmailCertificationServiceImpl emailCertificationService;
	@Autowired
	private HttpServletResponse httpResponse;
	
	@GetMapping
	public ModelAndView emailForm() {
		ModelAndView mv = new ModelAndView("/email");
		
		return mv;
	}
	
	@PostMapping
	public boolean sendEmail(String email, String code) {
        emailCertificationService.certifiedCodeSend(email, code);
		httpResponse.setStatus(HttpServletResponse.SC_CREATED);
		
		return true;
	}
}
