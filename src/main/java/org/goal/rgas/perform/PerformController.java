package org.goal.rgas.perform;

import java.io.File;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberServiceImpl;
import org.goal.rgas.mission.Mission;
import org.goal.rgas.mission.MissionServiceImpl;
import org.goal.rgas.payment.Payment;
import org.goal.rgas.payment.PaymentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/perform")
public class PerformController {
	@Autowired
	private HttpSession httpSession;

	@Autowired
	private PerformServiceImpl performServiceImpl;

	@Autowired
	private PaymentServiceImpl paymentServiceImpl;

	@Autowired
	private MissionServiceImpl missionServiceImpl;
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;

	// 수행내역 등록 폼
	@GetMapping("/form/{no}")
	public ModelAndView performRegisterForm(Mission mission) {
		ModelAndView mv = new ModelAndView();

		try {
			Payment payment = new Payment();
			payment.setMissionNo(mission.getNo());

			payment = paymentServiceImpl.paymentInquiry(payment);
			mission = missionServiceImpl.missionInquiry(mission);

			if (payment != null) {
				mv.setViewName("/perform/register");

				mv.addObject("paymentNo", payment.getNo());
				mv.addObject("mission", mission);
			} else {
				mv.setViewName("redirect:/mission");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 수행 내역 등록
	@PostMapping
	public ModelAndView performRegister(@RequestParam("img") MultipartFile file, Perform perform) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/mission");

		try {
			if (perform != null) {
				perform.setRegisterDate(LocalDate.now());
				Perform performValue = performServiceImpl.performInquiry(perform);

				if (performValue != null) {
					performServiceImpl.performEdit(file, perform);
				} else {
					performServiceImpl.performRegister(file, perform);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 수행 내역 목록 조회
	@GetMapping
	public ModelAndView performList(Mission mission) {
		ModelAndView mv = new ModelAndView("/perform/list");
		List<Perform> performList = null;

		Perform perform = new Perform();
		Payment payment = new Payment();
		try {
			if (mission.getNo() != 0) {
				mission = missionServiceImpl.missionInquiry(mission);

				payment.setMissionNo(mission.getNo());
				payment = paymentServiceImpl.paymentInquiry(payment);

				perform.setPaymentNo(payment.getNo());
				performList = performServiceImpl.performList(perform);

				mv.addObject("mission", mission);
				mv.addObject("performList", performList);
			} else {
				performList = performServiceImpl.performList(perform);

				List<Mission> missionList = missionServiceImpl.missionList(mission);
				List<Payment> paymentList = paymentServiceImpl.paymentList(payment);
				List<Member> memberList = memberServiceImpl.memberList(new Member());
				
				mv.addObject("memberList", memberList);
				mv.addObject("paymentList", paymentList);
				mv.addObject("missionList", missionList);
				mv.addObject("performList", performList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 수행 내역 상세 조회
	@GetMapping("/{no}")
	public ModelAndView performInquiry(@PathVariable int no) {
		ModelAndView mv = new ModelAndView("/perform/inquiry");
		try {
			// 수행 내역 조회
			Perform perform = new Perform();
			perform.setNo(no);
			perform = performServiceImpl.performInquiry(perform);

			mv.addObject("perform", perform);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 수행 내역 삭제
	@DeleteMapping
	public ModelAndView performDelete(Perform perform) {
		ModelAndView mv = new ModelAndView("/perform");

		try {
			if (perform != null) {
				performServiceImpl.performDelete(perform);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 이미지 출력
	@GetMapping("/photo/{no}")
	public void photoView(Perform perform, HttpServletResponse response) {
		try {
			byte[] byteToFile = performServiceImpl.photoView(perform);

			response.setContentType("image/jpg");
			response.getOutputStream().write(byteToFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}