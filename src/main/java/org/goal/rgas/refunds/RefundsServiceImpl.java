<<<<<<< HEAD
package org.goal.rgas.refunds;

import java.math.BigDecimal;
import java.util.List;

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

	@Override
	public boolean refundsProcess(Mission mission) throws Exception {
		//결제 내역 조회
		Payment payment = new Payment();
		payment.setMissionNo(mission.getNo());
		Payment paymentValue = paymentMapper.select(payment);
		
		//실패 횟수 계산
		Perform perform = new Perform();
		perform.setPaymentNo(payment.getNo());
		int failCount = performMapper.count(perform);
		
		if (paymentValue != null) {
			IamportClient iamportClient = new IamportClient("1722439638143134",
					"tV7DKdiRXz5pX53kU9Ohg7Lb17DIiSUMN2pxfIpdhuCezFzuPnL5vwgwEUfXMaJzc97sRwF91ioBXX5N");
			IamportResponse<com.siot.IamportRestHttpClientJava.response.Payment> iamportResponse = iamportClient
					.cancelPayment(new CancelData(payment.getPaymentCode(), false, new BigDecimal(payment.getDeposit() * 0.07 * failCount)));

			if (200 == iamportResponse.getCode()) {
				paymentMapper.delete(payment);
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
=======
package org.goal.rgas.refunds;

import java.util.List;

import org.goal.rgas.mission.Mission;
import org.goal.rgas.payment.Payment;
import org.goal.rgas.payment.PaymentMapper;
import org.goal.rgas.perform.Perform;
import org.goal.rgas.perform.PerformMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefundsServiceImpl implements RefundsService {

	@Override
	public boolean refundsProcess(Mission mission) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Refunds> refundsList(Refunds refunds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Refunds refundsInquiry(Refunds refunds) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
>>>>>>> refs/remotes/origin/suhyung
