package org.goal.rgas.mission;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberServiceImpl;
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
@RequestMapping("/mission")
public class MissionController {
	@Autowired
	private MissionServiceImpl missionService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private PaymentServiceImpl paymentServiceImpl; 
	
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("/form")
	public ModelAndView missionRegisterForm() {
		
		return new ModelAndView("/mission/register");
	}
	
	@PostMapping
	public ModelAndView missionRegister(@RequestParam("img") MultipartFile file, Mission mission, @RequestParam("merchantUid") String merchantUid) { 
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		
		try {
			missionService.missionRegister(file, mission);
			paymentServiceImpl.paymentRegister(mission, merchantUid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv; 
	 }
	
	@GetMapping
	public ModelAndView missionList(Mission mission) {
		String email = (String)httpSession.getAttribute("email");
		
		Member memberValue = new Member();
		memberValue.setEmail(email);
		
		ModelAndView mv = new ModelAndView("/mission/list");
		
		try {
			int memberNo = memberService.memberInquiry(memberValue).getNo();
			Mission missionValue = new Mission();
			missionValue.setMemberNo(memberNo);
			
			List<Mission> missionList = missionService.missionList(missionValue);
			List<Member> memberList = memberService.memberList(new Member());
			
			mv.addObject("missionList", missionList);
			mv.addObject("memberList", memberList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@GetMapping("/{no}")
	public ModelAndView missionInquiry(Mission mission) {
		ModelAndView mv = new ModelAndView("/mission/inquiry");
		
		try {
			Mission missionValue = missionService.missionInquiry(mission);
			mv.addObject("mission", missionValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@PutMapping
	public ModelAndView missionModify(Mission mission) {
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		try {
			missionService.missionModify(mission);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@DeleteMapping
	public ModelAndView missionDelete(Mission mission) {
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		
		Mission missionValue = new Mission();
		missionValue.setNo(mission.getNo());
		
		try {
			Payment payment = new Payment();
			payment.setMissionNo(mission.getNo());
			paymentServiceImpl.paymentCancel(payment);
			
			missionService.missionDelete(missionValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@GetMapping("/photo/{no}")
	public void photoView(Mission mission, HttpServletResponse response) {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";
			String physical = missionService.missionInquiry(mission).getPhysical();
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
