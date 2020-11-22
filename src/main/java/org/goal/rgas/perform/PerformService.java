package org.goal.rgas.perform;

import java.util.List;

public interface PerformService {
	public void performRegister(Perform perform) throws Exception;
	public List<Perform> performList(Perform perform) throws Exception;
	public Perform performInquiry(Perform perform) throws Exception;
	public void performModify(Perform perform) throws Exception;
	public void performDelete(Perform perform) throws Exception;
}
