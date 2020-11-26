package org.goal.rgas.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/member")
public class MemberController {
	@Autowired 
	private HttpSession httpSession;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@GetMapping("/form")
	public ModelAndView memberRegisterForm() {
		ModelAndView mv = new ModelAndView("/member/register");
		
		return mv;
	}
	
	@PostMapping
	public ModelAndView memberRegister(Member member) {
		ModelAndView mv = new ModelAndView(new RedirectView("/login"));

		try {
			memberService.memberRegister(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}

	@GetMapping
	public ModelAndView memberList(Member member) {
		ModelAndView mv = null;
		
		try {
			if ("A".equals(httpSession.getAttribute("auth"))) {
				mv = new ModelAndView("/member/list");
				
				List<Member> memberList = memberService.memberList(new Member());
				mv.addObject("list", memberList);
				
			} else {
				mv = new ModelAndView(new RedirectView("/mission"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@GetMapping(consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Member> memberSearch(Member member) {
		List<Member> list = null;
		try {
			System.out.println(member);
			
			list = memberService.memberList(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@GetMapping("/{no}")
	public ModelAndView memberInquiry(Member member) {
		ModelAndView mv = null;
		
		try {
			Member memberValue = memberService.memberInquiry(member);
			if ("A".equals(httpSession.getAttribute("auth"))) {
				mv = new ModelAndView("/member/inquiry");
				mv.addObject("member", memberValue);
				
			} else {
				mv = new ModelAndView("/member/modify");
				mv.addObject("member", memberValue);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}

	@PutMapping
	public ModelAndView memberModify(Member member) {
		ModelAndView mv = new ModelAndView(new RedirectView("/member"));
		try {
			memberService.memberModify(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
}
