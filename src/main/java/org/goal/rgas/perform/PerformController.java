package org.goal.rgas.perform;

import java.io.File;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.goal.rgas.mission.Mission;
import org.goal.rgas.mission.MissionServiceImpl;
import org.goal.rgas.payment.Payment;
import org.goal.rgas.payment.PaymentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/perform")
public class PerformController {
	@Autowired 
	private PerformServiceImpl performService;
	@Autowired
	private PaymentServiceImpl paymentService;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private MissionServiceImpl missionService;
	
	@GetMapping("/form/{no}")
	public ModelAndView performRegisterForm(Mission mission) {
		ModelAndView mv = null;
		
		Payment paymentValue = new Payment();
		paymentValue.setMissionNo(mission.getNo());
		System.out.println(paymentValue);
		Payment payment = null;
		
		try {
			payment = paymentService.paymentInquiry(paymentValue);
			mission = missionService.missionInquiry(mission);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (payment != null) {
			mv = new ModelAndView("/perform/register");

			String email = (String)httpSession.getAttribute("email");
			
			mv.addObject("paymentNo", payment.getNo());
			mv.addObject("mission", mission);
			mv.addObject("memberEmail", email);
			
			return mv;
		} else {
			mv = new ModelAndView(new RedirectView("/mission"));
			
			return mv;
		}
		// 
	}
	
	@PostMapping
	public ModelAndView performRegister(@RequestParam("img") MultipartFile file, Perform perform) {
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		performService.performRegister(file, perform);
		
		return mv;
	}
	
	@GetMapping
	public ModelAndView performList(Mission mission) {
		ModelAndView mv = null;
		
		if (mission.getNo() != 0) {
			mv = new ModelAndView("/perform/list");
			List<Perform> performList = null;
			
			try {
				Mission missionValue = missionService.missionInquiry(mission);
				Perform perform = new Perform();
				
				Payment payment = new Payment();
				payment.setMissionNo(missionValue.getNo());
				
				payment = paymentService.paymentInquiry(payment);
				
				perform.setPaymentNo(payment.getNo());
				
				performList = performService.performList(perform);
				System.out.println("mission value = " + missionValue);
				mv.addObject("mission", missionValue);
				mv.addObject("performList", performList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			//모든 수행내역과 미션 제목 각각의 미션제목
			try {
				Perform perform = new Perform();
				List<Perform> PerformList = performService.performList(perform);
				
				mv = new ModelAndView("/perform/list");
				mv.addObject("performList", PerformList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	@GetMapping("/{no}")
	public ModelAndView performInquiry(Perform perform) {
		ModelAndView mv = new ModelAndView("/perform/inquiry");
		Perform performValue = null;
		
		try {
			performValue = performService.performInquiry(perform);
			mv.addObject("perform", performValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@PutMapping
	public ModelAndView performModify(Perform perform) {
		ModelAndView mv = null;
		Payment paymentValue = new Payment();
		paymentValue.setNo(perform.getPaymentNo());
		
		try {
			paymentValue = paymentService.paymentInquiry(paymentValue);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		int missionNo = paymentValue.getMissionNo();
		
		Mission missionValue = new Mission();
		missionValue.setNo(missionNo);
		
		try {
			missionValue = missionService.missionInquiry(missionValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(perform.getRegisterDate().isBefore(missionValue.getStartDate())) {
			try {
				performService.performModify(perform);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv = new ModelAndView(new RedirectView("/perform"));
			
			return mv;
		} else {
			mv = new ModelAndView(new RedirectView("/perform/" + perform.getNo()));
			
			return mv;
		}
	}
	
	@DeleteMapping
	public ModelAndView performDelete(Perform perform) {
		ModelAndView mv = new ModelAndView("/perform");
		try {
			performService.performDelete(perform);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@GetMapping("/photo/{no}")
	public void catView(Perform perform, HttpServletResponse response) {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";
			String physical = performService.performInquiry(perform).getPhysical();
			String imgpath = path + File.separator + physical;
			System.out.println(imgpath);

			File file = new File(imgpath);

			if (file != null) {
				byte[] byteToFile = Files.readAllBytes(file.toPath());

				response.setContentType("image/jpg");
				response.getOutputStream().write(byteToFile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}