package org.goal.rgas.refunds;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.goal.rgas.donation.DonationSave;
import org.goal.rgas.donation.DonationSaveMapper;
import org.goal.rgas.member.MemberServiceImpl;
import org.goal.rgas.mission.Mission;
import org.goal.rgas.mission.MissionMapper;
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
	private RefundsMapper refundsMapper;

	@Autowired
	private MissionMapper missionMapper;

	@Autowired
	private PaymentMapper paymentMapper;

	@Autowired
	private PerformMapper performMapper;
	
	@Autowired
	private DonationSaveMapper donationSaveMapper;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private MemberServiceImpl memberServiceImpl;

	@Override
	public boolean refundsProcess(Mission mission) throws Exception {
		// 미션 정보 조회
		mission = missionMapper.select(mission);
		System.out.println(mission.getNo());
		// 결제 내역 조회
		Payment payment = new Payment();
		payment.setMissionNo(mission.getNo());
		payment = paymentMapper.select(payment);
		System.out.println(payment.getPaymentCode());

		// 총 미션 수행 기간 계산
		Period period = Period.between(mission.getStartDate(), mission.getEndDate());

		int term = period.getDays() + 1;

		// 미션 성공 횟수 계산
		Perform perform = new Perform();
		perform.setPaymentNo(payment.getNo());
		perform.setStatus('Y');
		int SuccessCount = performMapper.count(perform);
		int failCount = term - SuccessCount;
		int refundAmount = (int) (payment.getDeposit() - (payment.getDeposit() * 0.07 * failCount));
		
		if (payment != null) {
			IamportClient iamportClient = new IamportClient("1722439638143134", "tV7DKdiRXz5pX53kU9Ohg7Lb17DIiSUMN2pxfIpdhuCezFzuPnL5vwgwEUfXMaJzc97sRwF91ioBXX5N");
			IamportResponse<com.siot.IamportRestHttpClientJava.response.Payment> iamportResponse = iamportClient
					.cancelPayment(new CancelData(payment.getPaymentCode(), false,
							new BigDecimal(refundAmount)));
			System.out.println("실행");
			if (0 == iamportResponse.getCode()) {
				System.out.println("성공");
				
				Refunds refunds = new Refunds();
				refunds.setAmount(iamportResponse.getResponse().getCancelAmount().intValue());
				refunds.setPaymentNo(payment.getNo());
				refunds.setRefundsDate(LocalDate.now());

				//환급 내역 등록
				refundsMapper.insert(refunds);
				
				//기부금 적립 내역 등록
				if (refundAmount != payment.getDeposit()) {
					DonationSave donationSave = new DonationSave();
					donationSave.setAmount(refundAmount);
					donationSave.setPaymentNo(payment.getNo());
					donationSave.setSaveDate(LocalDate.now());
					donationSaveMapper.insert(donationSave);
				}
				
				// 회원 등급갱신
				String email = (String) httpSession.getAttribute("email");
				memberServiceImpl.memberGradeRenewal(email);

				return true;
			} else {

				System.out.println("실패" + iamportResponse.getMessage() + "##" + iamportResponse.getCode() + "##"
						+ iamportResponse.getResponse());
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