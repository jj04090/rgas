package org.goal.rgas.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.goal.rgas.emailcertification.EmailCertificationServiceImpl;
import org.goal.rgas.mission.Mission;
import org.goal.rgas.mission.MissionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired 
	private HttpSession httpSession;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private MissionServiceImpl missionService;
	 
	@Override
	public void memberRegister(Member member) throws Exception {
		System.out.println(member);
		memberMapper.insert(member);
	}

	@Override
	public List<Member> memberList(Member member) throws Exception {
		//회원 목록을 조회한다.
		List<Member> list = memberMapper.selectAll(member);
		System.out.println(list);
		
		return list;
	}

	@Override
	public Member memberInquiry(Member member) throws Exception {
		//회원정보를 조회한다.
		Member result = memberMapper.select(member);
		
		return result;  
	}

	@Override
	public void memberModify(Member member) throws Exception {
		if ("A".equals((String)(httpSession.getAttribute("auth")))) {
			member.setStatus('S');
			memberMapper.update(member);
		} else {
			member.setStatus('D');
			memberMapper.update(member);
		}
		
		// 회원정보를 조회한다.
//		if (memberMapper.select(member).getNo() != 0) {
//			if (overlapCheck(member)) {
//				memberMapper.update(member);
//			}
//		}
	}

	@Override
	public void memberGradeRenewal(String email) throws Exception {
		Member memberValue = new Member();
		memberValue.setEmail(email);
		Member member = memberMapper.select(memberValue);
		
		int count = missionService.totalSuccessCount(member);
		char grade;

		if (count < 20) {
			grade = 'C';
		} else if (count >= 20 && count < 40) {
			grade = 'B';
		} else if (count >= 40 && count < 60) {
			grade = 'S';
		} else if (count >= 60 && count < 100) {
			grade = 'G';
		} else {
			grade = 'P';
		}

		member.setGrade(grade);

		memberMapper.update(member);
	}

	private boolean overlapCheck(Member member) throws Exception {
		Member memberValue = new Member();
		memberValue.setNickname(member.getNickname());
		//이미 닉네임이 존재한다.
		if(memberMapper.select(memberValue).getNo() != 0) {
			
			return true;
		} else {
			//중복된 닉네임이 존재하지 않는다.
			return false;
		}
	}
}
