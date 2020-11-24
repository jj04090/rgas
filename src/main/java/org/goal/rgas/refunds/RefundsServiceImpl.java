package org.goal.rgas.refunds;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.MemberServiceImpl;
import org.goal.rgas.mission.Mission;
import org.goal.rgas.payment.Payment;
import org.goal.rgas.payment.PaymentMapper;
import org.goal.rgas.perform.Perform;
import org.goal.rgas.perform.PerformMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siot.IamportRestHttpClientJava.IamportClient;
import com.siot.IamportRestHttpClientJava.request.CancelData;
import com.siot.IamportRestHttpClientJava.response.IamportResponse;

@Service
public class RefundsServiceImpl implements RefundsService {
	@Autowired
	public RefundsMapper refundsMapper;

	@Autowired
	public PaymentMapper paymentMapper;
	
	@Autowired
	public PerformMapper performMapper;
	
	@Autowired
	public HttpSession httpSession;
	
	@Autowired
	public MemberServiceImpl memberServiceImpl;

	@Override
	public boolean refundsProcess(Mission mission) throws Exception {
		//결제 내역 조회
		Payment payment = new Payment();
		payment.setMissionNo(mission.getNo());
		Payment paymentValue = paymentMapper.select(payment);
		
		//총 미션 수행 기간 계산
		Period period = Period.between(mission.getStartDate(), mission.getEndDate());
		int term = period.getDays() + 1;
		
		//미션 성공 횟수 계산
		Perform perform = new Perform();
		perform.setPaymentNo(payment.getNo());
		perform.setStatus('Y');
		int SuccessCount = performMapper.count(perform);
		
		int failCount = term - SuccessCount;
		
		if (paymentValue != null) {
			IamportClient iamportClient = new IamportClient("1722439638143134",
					"tV7DKdiRXz5pX53kU9Ohg7Lb17DIiSUMN2pxfIpdhuCezFzuPnL5vwgwEUfXMaJzc97sRwF91ioBXX5N");
			IamportResponse<com.siot.IamportRestHttpClientJava.response.Payment> iamportResponse = iamportClient
					.cancelPayment(new CancelData(payment.getPaymentCode(), false, new BigDecimal(payment.getDeposit() - (payment.getDeposit() * 0.07 * failCount))));

			if (200 == iamportResponse.getCode()) {
				Refunds refunds = new Refunds();
				refunds.setAmount(iamportResponse.getResponse().getCancelAmount().intValue());
				refunds.setPaymentNo(paymentValue.getNo());
				refunds.setRefundsDate(LocalDate.now());
				
				refundsMapper.insert(refunds);
				String email = (String)httpSession.getAttribute("email");
				//회원 등급갱신
				memberServiceImpl.memberGradeRenewal(email);
				
				return true;
			} else {
				// 결제 실패 시
				return false;
			}
		}
		return false;

	}

	@Override
	public List<Refunds> refundsList(Refunds refunds) throws Exception {
		List<Refunds> refundsList = refundsMapper.list(refunds);
		return refundsList;
	}

	@Override
	public Refunds refundsInquiry(Refunds refunds) throws Exception {
		Refunds refundsValue = refundsMapper.select(refunds);
		return refundsValue;
	}
}