package org.goal.rgas.mission;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberServiceImpl;
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
	private MissionServiceImpl missionService;
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("/form")
	public ModelAndView missionRegisterForm() {
		ModelAndView mv = new ModelAndView("/mission/register");
		
		return mv;
	}
	
	@PostMapping
	public ModelAndView missionRegister(@RequestParam("img") MultipartFile file, Mission mission) { 
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		try {
			missionService.missionRegister(file, mission);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv; 
	 }
	
	@GetMapping
	public ModelAndView missionList(Mission mission) {
		List<Mission> missionList = null;
		
		//세션의 이메일로 member객체 가져오기
		String email = (String)httpSession.getAttribute("email");
		Member memberValue = new Member();
		memberValue.setEmail(email);
		
		int memberNo = 0;
		
		try {
			memberNo = memberService.memberInquiry(memberValue).getNo();
			Mission missionValue = new Mission();
			missionValue.setMemberNo(memberNo);
			
			//미션 목록 조회
			missionList = missionService.missionList(missionValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView("/mission/list");
		
		mv.addObject("list", missionList);
		
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
		
		return null;
	}
	
	@DeleteMapping("/{no}")
	public ModelAndView missionDelete(Mission mission) {
		ModelAndView mv = new ModelAndView(new RedirectView("/mission"));
		
		try {
			missionService.missionDelete(mission);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
}
