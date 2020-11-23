package org.goal.rgas.mission;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberMapper;
import org.goal.rgas.payment.Payment;
import org.goal.rgas.payment.PaymentMapper;
import org.goal.rgas.refunds.Refunds;
import org.goal.rgas.refunds.RefundsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MissionServiceImpl implements MissionService{
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private MissionMapper missionMapper;
	@Autowired
	private PaymentMapper paymentMapper;
	@Autowired
	private RefundsMapper refundsMapper;
	@Autowired
	private HttpSession httpSession;

	@Override
	public void missionRegister(MultipartFile file, Mission mission) throws Exception {
		try {
			//물리명, 논리명 생성
			String path = "C:\\Users\\suhyu\\rgasPhoto";
			String logical = file.getOriginalFilename();
			String physical = UUID.randomUUID().toString().substring(0,8) + "_" +  logical;
			
			//경로에 사진파일 저장
			String filePath = path + "//" + physical;
			file.transferTo(new File(filePath));
			
			//mission객체에 물리명, 논리명, 상태값부여
			mission.setLogical(logical);
			mission.setPhysical(physical);
			mission.setStatus('N');
			
			//session으로부터 회원이메일(memberEmail) 가져오기
			String email = (String)httpSession.getAttribute("email");
			Member memberValue = new Member();
			memberValue.setEmail(email);
			
			//회원 번호 가져오기
			int memberNo = memberMapper.select(memberValue).getNo();
			mission.setMemberNo(memberNo);
			
			System.out.println(mission);
			
			//미션 등록
			missionMapper.insert(mission);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Mission> missionList(Mission mission) throws Exception {
		List<Mission> list = missionMapper.list(mission);
		
		return list;
	}

	@Override
	public Mission missionInquiry(Mission mission) throws Exception {
		Mission missionValue = missionMapper.select(mission);
		
		return missionValue;
	}

	@Override
	public void missionModify(Mission mission) throws Exception {
		missionMapper.update(mission);
	}

	@Override
	public void missionDelete(Mission mission) throws Exception {
		missionMapper.delete(mission);
	}

	@Override
	public int totalSuccessCount(Member member) throws Exception {
		//인자로 받은 미션 번호를 가진 결제 내역을 조회
		int count = 0;
		int memberNo = member.getNo();
		Payment paymentValue = new Payment();
		paymentValue.setMissionNo(memberNo);
		
		List<Payment> payments = paymentMapper.list(paymentValue);
		for (int i = 0; i < payments.size(); i++) {
			//조회된 결제내역 번호를 가진 환급 내역을 조회
			Payment payment = payments.get(i);
			int paymentNo = payment.getNo();
			
			Refunds refundsValue = new Refunds();
			refundsValue.setPaymentNo(paymentNo);
			
			Refunds refunds = refundsMapper.select(refundsValue);
			
			//둘의 금액을 비교 및 카운트 증가
			
			if (payment.getDeposit() == refunds.getAmount()) { count++; } 
		}
		
		return count;
	}
}
