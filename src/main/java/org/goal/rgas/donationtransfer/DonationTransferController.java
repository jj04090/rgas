package org.goal.rgas.donationtransfer;

import org.goal.rgas.charity.Charity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/donationTransfer")
public class DonationTransferController {
	@GetMapping("/form")
	public ModelAndView donationTransferForm(Charity charity) {
		return null;
	}
	
	@PostMapping
	public ModelAndView donationTransferRegister(DonationTransfer donationTransfer) {
		return null;
	}
	
	@GetMapping
	public ModelAndView donationTransferList(DonationTransfer donationTransfer) {
		return null;
	}
}
