package org.goal.rgas.emailcertification;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/email")
public class EmailCertificationController {
	@Autowired
	private EmailCertificationServiceImpl emailCertificationServiceImpl;

	@Autowired
	private HttpServletResponse httpServletResponse;

	// 인증 이메일 전송
	@PostMapping
	public boolean sendEmail(String email, String code) {
		if (email != null && code != null) {
			emailCertificationServiceImpl.certifiedCodeSend(email, code);
			httpServletResponse.setStatus(HttpServletResponse.SC_CREATED);
		}
		
		return true;
	}
}