package org.goal.rgas.perform;

import java.io.File;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.goal.rgas.charity.Charity;
import org.goal.rgas.mission.Mission;
import org.goal.rgas.mission.MissionServiceImpl;
import org.goal.rgas.payment.Payment;
import org.goal.rgas.payment.PaymentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
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
	private PerformServiceImpl performServiceImpl;
	
	@Autowired
	private PaymentServiceImpl paymentServiceImpl;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private MissionServiceImpl missionServiceImpl;
	
	//수행내역 등록 폼
	@GetMapping("/form/{no}")
	public ModelAndView performRegisterForm(Mission mission) {
		ModelAndView mv =  new ModelAndView();
		
		Payment paymentValue = new Payment();
		paymentValue.setMissionNo(mission.getNo());
		Payment payment = null;
		
		try {
			payment = paymentServiceImpl.paymentInquiry(paymentValue);
			mission = missionServiceImpl.missionInquiry(mission);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (payment != null) {
			mv.setViewName("/perform/register");
			String email = (String)httpSession.getAttribute("email");
			
			mv.addObject("paymentNo", payment.getNo());
			mv.addObject("mission", mission);
			mv.addObject("memberEmail", email);
			
			return mv;
		} else {
			
			return new ModelAndView(new RedirectView("/mission"));
		}
	}
	
	//수행 내역 등록
	@PostMapping
	public ModelAndView performRegister(@RequestParam("img") MultipartFile file, Perform perform) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/mission");
		
		try {
			if (file == null || file.isEmpty()) {
				mv.setViewName("redirect:/mission");
				
				return mv;
			}
			LocalDate today = LocalDate.now();
			perform.setRegisterDate(today);
			Perform performValue = performServiceImpl.performInquiry(perform);
			
			if (performValue != null) {
				performServiceImpl.performEdit(file, perform);
			} else {
				performServiceImpl.performRegister(file, perform);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//수행 내역 목록 조회
	@GetMapping
	public ModelAndView performList(Mission mission) {
		ModelAndView mv = new ModelAndView("/perform/list");
		List<Perform> performList = null;
		
		Perform perform = new Perform();
		Payment payment = new Payment();
		
		if (mission.getNo() != 0) {
			try {
				Mission missionValue = missionServiceImpl.missionInquiry(mission);
				
				payment.setMissionNo(missionValue.getNo());
				payment = paymentServiceImpl.paymentInquiry(payment);
				
				perform.setPaymentNo(payment.getNo());
				performList = performServiceImpl.performList(perform);
				
				mv.addObject("mission", missionValue);
				mv.addObject("performList", performList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				performList = performServiceImpl.performList(perform);
				
				List<Mission> missionList = missionServiceImpl.missionList(mission);
				List<Payment> paymentList = paymentServiceImpl.paymentList(payment);
				
				mv.addObject("paymentList", paymentList);
				mv.addObject("missionList", missionList);
				mv.addObject("performList", performList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	//수행 내역 상세 조회
	@GetMapping("/{no}")
	public ModelAndView performInquiry(@PathVariable int no) {
		Perform perform = new Perform();
		perform.setNo(no);
		
		ModelAndView mv = new ModelAndView("/perform/inquiry");
		Payment paymentValue = new Payment();
		
		try {
			Perform performValue = performServiceImpl.performInquiry(perform);
			
			paymentValue.setNo(performValue.getPaymentNo());
			int missionNo = paymentServiceImpl.paymentInquiry(paymentValue).getMissionNo();
		
			mv.addObject("missionNo", missionNo);
			mv.addObject("perform", performValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//수행 내역 수정
	@PutMapping
	public ModelAndView performModify(Perform perform) {
		ModelAndView mv = new ModelAndView();
		try {
			Payment paymentValue = new Payment();
			paymentValue.setNo(perform.getPaymentNo());
			Mission missionValue = new Mission();

			paymentValue = paymentServiceImpl.paymentInquiry(paymentValue);
			int missionNo = paymentValue.getMissionNo();

			missionValue.setNo(missionNo);
			missionValue = missionServiceImpl.missionInquiry(missionValue);

			if (perform.getRegisterDate().isBefore(missionValue.getStartDate())) {
				performServiceImpl.performModify(perform);

				mv.setViewName("redirect:/perform");
			} else {
				mv.setViewName("redirect:/perform" + perform.getNo());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
	
	//수행 내역 삭제
	@DeleteMapping
	public ModelAndView performDelete(Perform perform) {
		ModelAndView mv = new ModelAndView("/perform");
		
		try {
			performServiceImpl.performDelete(perform);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//이미지 출력
	@GetMapping("/photo/{no}")
	public void photoView(Perform perform, HttpServletResponse response) {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";
			String physical = performServiceImpl.performInquiry(perform).getPhysical();
			String imgPath = path + File.separator + physical;

			File file = new File(imgPath);

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