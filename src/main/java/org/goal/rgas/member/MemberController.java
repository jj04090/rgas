package org.goal.rgas.member;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private HttpSession httpSession;

	@Autowired
	private MemberServiceImpl memberServiceImpl;

	@Autowired
	private HttpServletResponse httpServletResponse;

	@Autowired
	private Properties properties;
	
	@GetMapping("/form")
	public ModelAndView memberRegisterForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/register");
		return mv;
	}
	
	// 회원가입 처리
	@PostMapping
	public ModelAndView memberRegister(@Valid Member member, Errors errors) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/login");

		if (errors.hasErrors()) {
			return mv;
		}
		try {
			memberServiceImpl.memberRegister(member);

			httpServletResponse.setContentType("text/html; charset=UTF-8");
			PrintWriter out = httpServletResponse.getWriter();
			out.println("<script>alert('계정이 등록 되었습니다'); location.replace('/login');</script>");
			out.flush();

		} catch (Exception e) {
			try {
				httpServletResponse.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				out = httpServletResponse.getWriter();
				out.println("<script>alert('회원가입에 실패했습니다.'); location.replace('/login');</script>");
				out.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}

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

				properties.load(new FileInputStream(new File("src/main/resources/bankcode.properties").getAbsolutePath()));
				mv.addObject("bankName", new String(properties.getProperty(member.getBank()).getBytes("ISO-8859-1"), "utf-8"));
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
