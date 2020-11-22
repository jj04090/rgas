package org.goal.rgas.refunds;

import java.util.List;

import org.goal.rgas.mission.Mission;

public interface RefundsService {
	public boolean refundsProcess(Mission mission) throws Exception;
	public List<Refunds> refundsList(Refunds refunds) throws Exception;
	public Refunds refundsInquiry(Refunds refunds) throws Exception;
}
