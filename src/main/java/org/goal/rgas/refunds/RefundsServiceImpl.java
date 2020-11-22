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
