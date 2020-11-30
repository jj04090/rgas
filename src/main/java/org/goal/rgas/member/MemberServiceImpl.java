package org.goal.rgas.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.goal.rgas.mission.MissionServiceImpl;
import org.goal.rgas.payment.Payment;
import org.goal.rgas.payment.PaymentMapper;
import org.goal.rgas.refunds.Refunds;
import org.goal.rgas.refunds.RefundsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private HttpSession httpSession;

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private PaymentMapper paymentMapper;

	@Autowired
	private RefundsMapper refundsMapper;

	// 회원 가입
	@Override
	public void memberRegister(Member member) throws Exception {
		//동일 이메일로 회원가입 한 적 있는지 확인
		Member memberValue = new Member();
		memberValue.setEmail(member.getEmail());

		if (memberMapper.select(memberValue) == null) {
			memberMapper.insert(member);
		}
	}

	// 회원 목록 조회
	@Override
	public List<Member> memberList(Member member) throws Exception {
		return memberMapper.selectAll(member);
	}

	// 회원 상세 조회
	@Override
	public Member memberInquiry(Member member) throws Exception {
		return memberMapper.select(member);
	}

	// 회원 정보 수정
	@Override
	public void memberModify(Member member) throws Exception {
		if ("A".equals((String) (httpSession.getAttribute("auth")))) {
			member.setStatus('S');
			memberMapper.update(member);
		} else if ("C".equals((String) (httpSession.getAttribute("auth")))) {
			
			if (member.getNickname() != null) {
				memberMapper.update(member);
			} else {
				member.setStatus('D');
				memberMapper.update(member);
			}
		}
	}

	// 회원별 역대 미션 성공 횟수 계산
	@Override
	public int totalSuccessCount(Member member) throws Exception {
		int count = 0;

		// 회원별 생성한 미션리스트
		Payment paymentValue = new Payment();
		paymentValue.setMissionNo(member.getNo());
		List<Payment> paymentsList = paymentMapper.list(paymentValue);

		for (Payment payment : paymentsList) {
			// 수행된 미션에 환급내역 찾기
			Refunds refunds = new Refunds();
			refunds.setPaymentNo(payment.getNo());
			refunds = refundsMapper.select(refunds);

			// 미션 참가비 = 환급금액 (동일 시 100% 성공한 미션으로 간주)
			if (payment.getDeposit() == refunds.getAmount()) {
				count++;
			}
		}

		return count;
	}

	// 회원 등급 갱신
	@Override
	public void memberGradeRenewal() throws Exception {
		// 회원 찾기
		Member member = (Member) httpSession.getAttribute("memberValue");
		int count = totalSuccessCount(member);

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
