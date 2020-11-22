package org.goal.rgas.payment;

import org.goal.rgas.mission.Mission;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/payment")
public class PaymentController {
	@GetMapping
	public ModelAndView paymentProcess (Mission mission) {
		return null;
		
	}
		
	@PostMapping
	public ModelAndView paymentRegister(Payment payment) {
		return null;
	}
	
	@DeleteMapping
	public ModelAndView paymentCancel(Payment payment) {
		return null;
	}
}
