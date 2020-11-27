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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/donation")
public class DonationController {
	@Autowired
	private DonationServiceImpl donationServiceImpl;
	
	@Autowired
	private CharityServiceImpl charityServiceImpl;
	
	@Autowired
	private HttpServletResponse httpServletResponse;
	
	//기부금 이체 정보 찾기
	@PostMapping("/form/{merchantUid}")
	public IamportRequest donationTransferForm(@RequestBody Charity charity, @PathVariable String merchantUid) {
		IamportRequest iamportRequest = null;
		
		try {
			httpServletResponse.setStatus(HttpServletResponse.SC_CREATED);
			iamportRequest = donationServiceImpl.donationTransferProcess(charity, merchantUid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return iamportRequest;
	}
	
	//기부금 이체 내역 등록
	@PostMapping
	public ModelAndView donationTransferRegister(int no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/donation");
		
		try {
			DonationTransfer donationTransfer = new DonationTransfer();
			donationTransfer.setCharityNo(no);
			donationTransfer.setAmount(donationServiceImpl.totalDonationSave());
			
			//기부금 이체 후 기부금 적립 상태 변경
			donationServiceImpl.donationTransferRegister(donationTransfer);
			donationServiceImpl.donationSaveModify(new DonationSave());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//기부금 이체 목록 조회
	@GetMapping
	public ModelAndView donationTransferList(DonationTransfer donationTransfer) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("donation/list");
		
		try {
			mv.addObject("donationList", donationServiceImpl.donationTransferList(donationTransfer));
			mv.addObject("charityList", charityServiceImpl.charityList(new Charity()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
}
