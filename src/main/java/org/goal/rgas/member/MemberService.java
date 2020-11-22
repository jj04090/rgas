package org.goal.rgas.member;

import java.util.List;

public interface MemberService {
	public void memberRegister(Member member);
	public List<Member> memberList(Member member);
	public Member memberInquiry(Member member);
	public void memberModify(Member member);
	public void memberGradeRenewal(Member member);
}
