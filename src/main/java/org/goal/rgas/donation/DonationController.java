package org.goal.rgas.donation;

import javax.servlet.http.HttpServletResponse;

import org.goal.rgas.charity.Charity;
import org.goal.rgas.charity.CharityServiceImpl;
import org.goal.rgas.payment.IamportRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/donation")
public class DonationController {
	@Autowired
	public DonationServiceImpl donationServiceImpl;
	
	@Autowired
	public CharityServiceImpl charityServiceImpl;
	
	@Autowired
	private HttpServletResponse response;
	
	@PostMapping("/form/{merchantUid}")
	public IamportRequest donationTransferForm(@RequestBody Charity charity, @PathVariable String merchantUid) {
		IamportRequest iamportRequest = null;
		try {
			response.setStatus(HttpServletResponse.SC_CREATED);
			iamportRequest = donationServiceImpl.donationTransferProcess(charity, merchantUid);
		} catch (Exception e) {
			//에러페이지 띄워주기
			e.printStackTrace();
		}
		return iamportRequest;
	}
	
	@PostMapping
	public ModelAndView donationTransferRegister(int no) {
		ModelAndView mv = new ModelAndView(new RedirectView("donation"));
		try {
			DonationTransfer donationTransfer = new DonationTransfer();
			donationTransfer.setCharityNo(no);
			
			donationTransfer.setAmount(donationServiceImpl.totalDonationSave());
			donationServiceImpl.donationTransferRegister(donationTransfer);
			
			donationServiceImpl.donationSaveModify(new DonationSave());
		} catch (Exception e) {
			//에러페이지 띄워주기
			e.printStackTrace();
		}
		return mv;
	}
	
	@GetMapping
	public ModelAndView donationTransferList(DonationTransfer donationTransfer) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("donation/list");
		try {
			mv.addObject("donationList", donationServiceImpl.donationTransferList(donationTransfer));
			mv.addObject("charityList", charityServiceImpl.charityList(new Charity()));
		} catch (Exception e) {
			//에러페이지 띄워주기
			e.printStackTrace();
		}
		return mv;
	}
}
