package org.goal.rgas.member;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.goal.rgas.charity.Charity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.Errors;
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
	private MemberServiceImpl memberServiceImpl;

	// 회원 가입 폼
	@GetMapping("/form")
	public ModelAndView memberRegisterForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/register");

		return mv;
	}

	// 회원가입 처리
	@PostMapping
	public ModelAndView memberRegister(@Valid Member member, Errors errors) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/login");

		if (errors.hasErrors()) {
			mv.setViewName("redirect:/member/form");

			return mv;
		}
		try {
			memberServiceImpl.memberRegister(member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 회원 목록 조회
	@GetMapping
	public ModelAndView memberList() {
		ModelAndView mv = new ModelAndView();

		try {
			if ("A".equals(httpSession.getAttribute("auth"))) {
				mv.setViewName("/member/list");

				List<Member> memberList = memberServiceImpl.memberList(new Member());
				mv.addObject("list", memberList);
			} else {
				mv.setViewName("redirect:/mission");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 회원 검색
	@GetMapping(consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Member> memberSearch(Member member) {
		List<Member> list = null;

		try {
			list = memberServiceImpl.memberList(member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 회원 상세 조회
	@GetMapping("/{no}")
	public ModelAndView memberInquiry(Member member) {
		ModelAndView mv = new ModelAndView();

		try {
			if (member != null) {
				member = memberServiceImpl.memberInquiry(member);
				Member memberValue = (Member) httpSession.getAttribute("memberValue");

				if ("A".equals(httpSession.getAttribute("auth"))) {
					mv.addObject("member", member);
					mv.setViewName("/member/inquiry");
					
				} else if (memberValue.getEmail().equals(member.getEmail())) {
					mv.addObject("member", member);
					mv.setViewName("/member/modify");
					
				} else {
					mv.setViewName("/mission");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 회원 정보 수정
	@PutMapping
	public ModelAndView memberModify(Member member) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/member");

		try {
			if (member != null) {
				memberServiceImpl.memberModify(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
}
