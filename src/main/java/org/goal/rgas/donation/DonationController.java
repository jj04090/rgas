package org.goal.rgas.donation;

import org.goal.rgas.charity.Charity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/donation")
public class DonationController {
	@Autowired
	public DonationServiceImpl donationServiceImpl;
	
	@GetMapping("/form")
	public ModelAndView donationTransferForm(Charity charity) {
		ModelAndView mv = new ModelAndView(new RedirectView("payment/iamport"));
		try {
			mv.addObject("IamportRequest", donationServiceImpl.donationTransferProcess(charity));
		} catch (Exception e) {
			//에러페이지 띄워주기
			e.printStackTrace();
		}
		return mv;
	}
	
	@PostMapping
	public ModelAndView donationTransferRegister(DonationTransfer donationTransfer) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("donationTransfer/list");
		try {
			donationServiceImpl.donationTransferRegister(donationTransfer);
		} catch (Exception e) {
			//에러페이지 띄워주기
			e.printStackTrace();
		}
		return mv;
	}
	
	@GetMapping
	public ModelAndView donationTransferList(DonationTransfer donationTransfer) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("donationTransfer/list");
		try {
			mv.addObject("donationList", donationServiceImpl.donationTransferList(donationTransfer));
		} catch (Exception e) {
			//에러페이지 띄워주기
			e.printStackTrace();
		}
		return mv;
	}
}
