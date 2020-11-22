package org.goal.rgas.payment;

import org.goal.rgas.mission.Mission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	public PaymentServiceImpl paymentServiceImpl;
	
	@GetMapping
	public ModelAndView paymentProcess (Mission mission) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("payment/iamport");
		try {
			mv.addObject("IamportRequest", paymentServiceImpl.paymentProcess(mission));
		} catch (Exception e) {
			//에러페이지 띄워주기
			e.printStackTrace();
		}
		return mv;
	}
		
	@PostMapping
	public ModelAndView paymentRegister(Payment payment) {
		ModelAndView mv = new ModelAndView(new RedirectView("mission/"+payment.getMissionNo()));
		try {
			paymentServiceImpl.paymentRegister(payment);
		} catch (Exception e) {
			//에러페이지
			//실패 시 어디로 화면이동해야할지 논의 mv가 위처럼 반환되는게 맞는가?
			e.printStackTrace();
		}
		return mv;
	}
	
	@DeleteMapping
	public ModelAndView paymentCancel(Payment payment) {
		ModelAndView mv = new ModelAndView(new RedirectView("mission"));
		try {
			paymentServiceImpl.paymentCancel(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
