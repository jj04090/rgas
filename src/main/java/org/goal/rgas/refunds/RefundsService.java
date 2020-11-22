package org.goal.rgas.refunds;

import java.util.List;

import org.goal.rgas.mission.Mission;

public interface RefundsService {
	public boolean refundsProcess(Mission mission);
	public List<Refunds> refundsList(Refunds refunds);
	public Refunds refundsInquiry(Refunds refunds);
}
