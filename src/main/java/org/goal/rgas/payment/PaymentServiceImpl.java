package org.goal.rgas.payment;

import java.util.ArrayList;
import java.util.List;

import org.goal.rgas.mission.Mission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	public PaymentMapper paymentMapper;

	@Override
	public boolean paymentProcess(Mission mission) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void paymentRegister(Payment payment) {
		if (payment != null) {
			try {
				paymentMapper.insert(payment);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Payment> paymentList(Payment payment) {
		List<Payment> list = new ArrayList<Payment>();
		try {
			list = paymentMapper.list(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Payment paymentInquiry(Payment payment) {
		Payment result = null;
		try {
			result = paymentMapper.select(payment);
			System.out.println(result.getPaymentDate());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void paymentCancel(Payment payment) {
		try {
			paymentMapper.delete(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
