package org.goal.rgas.member;

import java.util.List;

public interface MemberService {
	public void memberRegister(Member member) throws Exception;
	public List<Member> memberList(Member member) throws Exception;
	public Member memberInquiry(Member member) throws Exception;
	public void memberModify(Member member) throws Exception;
	public void memberGradeRenewal(Member member) throws Exception;
}
