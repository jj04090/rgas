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
		Member memberValue = new Member();
		memberValue.setEmail(member.getEmail());
		
		if (memberMapper.select(memberValue) == null) {
			memberMapper.insert(member);
		}
	}

	@Override
	public List<Member> memberList(Member member) throws Exception {
		
		return memberMapper.selectAll(member);
	}

	@Override
	public Member memberInquiry(Member member) throws Exception {
		
		return memberMapper.select(member); 
	}

	@Override
	public void memberModify(Member member) throws Exception {
		if ("A".equals((String)(httpSession.getAttribute("auth")))) {
			member.setStatus('S');
			memberMapper.update(member);
		} else if ("C".equals((String)(httpSession.getAttribute("auth")))) {
			if (member.getNickname() != null) {
				memberMapper.update(member);
			} else {
				member.setStatus('D');
				System.out.println(member);
				memberMapper.update(member);
			}
		}
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
}
