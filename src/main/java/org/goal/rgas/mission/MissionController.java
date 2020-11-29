package org.goal.rgas.mission;

import java.io.File;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberServiceImpl;
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
@RequestMapping("/mission")
public class MissionController {
	@Autowired
	private MissionServiceImpl missionServiceImpl;
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@Autowired
	private PaymentServiceImpl paymentServiceImpl; 
	
	@Autowired
	private HttpSession httpSession;
	
	//미션 등록 폼
	@GetMapping("/form")
	public ModelAndView missionRegisterForm() {
		
		return new ModelAndView("/mission/register");
	}
	
	//미션 등록 처리
	@PostMapping
	public ModelAndView missionRegister(@RequestParam("img") MultipartFile file, Mission mission, @RequestParam("merchantUid") String merchantUid) { 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/mission");
		
		try {
			mission = missionServiceImpl.missionRegister(file, mission);
			paymentServiceImpl.paymentRegister(mission, merchantUid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv; 
	 }
	
	//미션 목록 조회
	@GetMapping
	public ModelAndView missionList(Mission mission) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mission/list");
		
		String email = (String)httpSession.getAttribute("email");
		Member memberValue = new Member();
		memberValue.setEmail(email);
		
		try {
			int memberNo = memberServiceImpl.memberInquiry(memberValue).getNo();
			Mission missionValue = new Mission();
			missionValue.setMemberNo(memberNo);
			
			List<Mission> missionList = missionServiceImpl.missionList(missionValue);
			List<Member> memberList = memberServiceImpl.memberList(new Member());
			
			mv.addObject("missionList", missionList);
			mv.addObject("memberList", memberList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("ss");
		return mv;
	}
	
	//미션 상세 조회
	@GetMapping("/{no}")
	public ModelAndView missionInquiry(Mission mission) {
		ModelAndView mv = new ModelAndView("/mission/inquiry");
		
		try {
			Mission missionValue = missionServiceImpl.missionInquiry(mission);
			mv.addObject("mission", missionValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//미션 정보 수정
	@PutMapping
	public ModelAndView missionModify(Mission mission) {
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		try {
			missionServiceImpl.missionModify(mission);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("여기다");
		return mv;
	}
	
	//미션 삭제
	@DeleteMapping
	public ModelAndView missionDelete(Mission mission) {
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		
		Mission missionValue = new Mission();
		missionValue.setNo(mission.getNo());
		
		try {
			Payment payment = new Payment();
			payment.setMissionNo(mission.getNo());
			paymentServiceImpl.paymentCancel(payment);
			
			missionServiceImpl.missionDelete(missionValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//이미지 출력
	@GetMapping("/photo/{no}")
	public void photoView(Mission mission, HttpServletResponse response) {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";
			String physical = missionServiceImpl.missionInquiry(mission).getPhysical();
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
