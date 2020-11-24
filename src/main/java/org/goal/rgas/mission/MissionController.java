package org.goal.rgas.mission;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberServiceImpl;
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
	private MissionServiceImpl missionService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private PaymentServiceImpl paymentServiceImpl; 
	
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("/form")
	public ModelAndView missionRegisterForm() {
		ModelAndView mv = new ModelAndView("/mission/register");
		
		return mv;
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
		List<Mission> missionList = null;
		List<Member> memberList = null;
		//세션의 이메일로 member객체 가져오기
		String email = (String)httpSession.getAttribute("email");
		Member memberValue = new Member();
		memberValue.setEmail(email);
		
		ModelAndView mv = new ModelAndView("/mission/list");
		
		int memberNo = 0;
		
		try {
			memberNo = memberService.memberInquiry(memberValue).getNo();
			Mission missionValue = new Mission();
			missionValue.setMemberNo(memberNo);
			
			/*미션 목록 조회*/
			
			missionList = missionService.missionList(missionValue);
			
			memberList = memberService.memberList(new Member());
			
			mv.addObject("list", missionList);
			mv.addObject("memberList", memberList);
			
			System.out.println(memberList.get(1).getName());
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
			missionService.missionDelete(missionValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@GetMapping("/loadimage")
	public String displayPhoto(@RequestParam(value="photo") String photo, Mission mission, HttpServletResponse response)throws Exception{
		String path = "C:\\Users\\suhyu\\rgasPhoto";
		 
		//DB에 저장된 파일 정보를 불러오기
		String physical = missionService.missionInquiry(mission).getPhysical();
		
		response.setContentType("image/jpg");
	    ServletOutputStream bout = response.getOutputStream();
	    //파일의 경로
	    String imgpath = path + File.separator + physical;
	    System.out.println(imgpath);
	    FileInputStream f = new FileInputStream(imgpath);
	   
	    int length;
	    byte[] buffer = new byte[10];
	    while((length=f.read(buffer)) != -1){
	    	bout.write(buffer,0,length);
	    }
	    
	    return null;
	}
}
