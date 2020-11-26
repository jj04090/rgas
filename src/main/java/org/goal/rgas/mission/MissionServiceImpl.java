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
	public Mission missionRegister(MultipartFile file, Mission mission) throws Exception {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";

			new File(path).mkdir();
			
			String logical = file.getOriginalFilename();
			String physical = UUID.randomUUID().toString().substring(0,8) + "_" +  logical;
			
			String filePath = path + File.separator + physical;
			file.transferTo(new File(filePath));
			
			mission.setLogical(logical);
			mission.setPhysical(physical);
			mission.setStatus('N');
			
			String email = (String)httpSession.getAttribute("email");
			Member memberValue = new Member();
			memberValue.setEmail(email);
			
			int memberNo = memberMapper.select(memberValue).getNo();
			mission.setMemberNo(memberNo);
			
			missionMapper.insert(mission);
			return missionMapper.select(mission);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<Mission> missionList(Mission mission) throws Exception {
		
		return missionMapper.list(mission);
	}

	@Override
	public Mission missionInquiry(Mission mission) throws Exception {
		
		return missionMapper.select(mission);
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
		int count = 0;
		int memberNo = member.getNo();
		
		Payment paymentValue = new Payment();
		paymentValue.setMissionNo(memberNo);
		
		List<Payment> payments = paymentMapper.list(paymentValue);
		for (int i = 0; i < payments.size(); i++) {
			Payment payment = payments.get(i);
			int paymentNo = payment.getNo();
			
			Refunds refundsValue = new Refunds();
			refundsValue.setPaymentNo(paymentNo);
			
			Refunds refunds = refundsMapper.select(refundsValue);
			
			if (payment.getDeposit() == refunds.getAmount()) { count++; } 
		}
		
		return count;
	}
}
