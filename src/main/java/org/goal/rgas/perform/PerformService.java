package org.goal.rgas.perform;

import java.util.List;

public interface PerformService {
	public void performRegister(Perform perform);
	public List<Perform> performList(Perform perform);
	public Perform performInquiry(Perform perform);
	public void performModify(Perform perform);
	public void performDelete(Perform perform);
}
