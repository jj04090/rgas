package org.goal.rgas.payment;

import java.util.List;

import org.goal.rgas.mission.Mission;

public interface PaymentService {
	public boolean paymentProcess(Mission mission);
	public void paymentRegister(Payment payment);
	public List<Payment> paymentList(Payment payment);
	public Payment paymentInquiry(Payment payment);
	public void paymentCancel(Payment payment);
}
