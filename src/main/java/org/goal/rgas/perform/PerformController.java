package org.goal.rgas.perform;

import java.io.File;
import java.nio.file.Files;
import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.PathVariable;
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
			
			return new ModelAndView(new RedirectView("/mission"));
		}
	}
	
	@PostMapping
	public ModelAndView performRegister(@RequestParam("img") MultipartFile file, Perform perform) {
		ModelAndView mv = null;
		try {
			mv = new ModelAndView(new RedirectView("/mission"));
			
			LocalDate today = LocalDate.now();
			perform.setRegisterDate(today);
			Perform performValue = performService.performInquiry(perform);
			
			if (performValue != null) {
				performService.performEdit(file, perform);
			} else {
				performService.performRegister(file, perform);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
	
	@GetMapping
	public ModelAndView performList(Mission mission) {
		ModelAndView mv = null;
		List<Perform> performList = null;
		
		if (mission.getNo() != 0) {
			mv = new ModelAndView("/perform/list");
			
			try {
				Mission missionValue = missionService.missionInquiry(mission);
				Perform perform = new Perform();
				Payment payment = new Payment();
				
				payment.setMissionNo(missionValue.getNo());
				payment = paymentService.paymentInquiry(payment);
				
				perform.setPaymentNo(payment.getNo());
				performList = performService.performList(perform);
				
				mv.addObject("mission", missionValue);
				mv.addObject("performList", performList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				Perform perform = new Perform();
				performList = performService.performList(perform);
				
				mv = new ModelAndView("/perform/list");
				mv.addObject("performList", performList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	@GetMapping("/{no}")
	public ModelAndView performInquiry(@PathVariable int no) {
		Perform perform = new Perform();
		perform.setNo(no);
		
		ModelAndView mv = new ModelAndView("/perform/inquiry");
		Payment paymentValue = new Payment();
		
		try {
			Perform performValue = performService.performInquiry(perform);
			System.out.println("==================");
			System.out.println(performValue);
			System.out.println("==================");
			paymentValue.setNo(performValue.getPaymentNo());
			int missionNo = paymentService.paymentInquiry(paymentValue).getMissionNo();
		System.out.println(missionNo);
		System.out.println("==================");
			mv.addObject("missionNo", missionNo);
			mv.addObject("perform", performValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@PutMapping
	public ModelAndView performModify(Perform perform) {
		ModelAndView mv = null;
		try {
			Payment paymentValue = new Payment();
			paymentValue.setNo(perform.getPaymentNo());
			Mission missionValue = new Mission();

			paymentValue = paymentService.paymentInquiry(paymentValue);
			int missionNo = paymentValue.getMissionNo();

			missionValue.setNo(missionNo);
			missionValue = missionService.missionInquiry(missionValue);

			if (perform.getRegisterDate().isBefore(missionValue.getStartDate())) {

				performService.performModify(perform);

				mv = new ModelAndView(new RedirectView("/perform"));
			} else {
				mv = new ModelAndView(new RedirectView("/perform/" + perform.getNo()));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
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
	public void photoView(Perform perform, HttpServletResponse response) {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";
			String physical = performService.performInquiry(perform).getPhysical();
			String imgPath = path + File.separator + physical;

			File file = new File(imgPath);

			if (file != null) {
				byte[] byteToFile = Files.readAllBytes(file.toPath());

				response.setContentType("image/jpg");
				response.getOutputStream().write(byteToFile);
			}
		} catch (Exception e) {
			/* e.printStackTrace(); */
			
		}
	}
}