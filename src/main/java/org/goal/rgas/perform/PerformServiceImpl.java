package org.goal.rgas.perform;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class PerformServiceImpl implements PerformService{
	@Autowired
	public PerformMapper performMapper;

	@Override
	public void performRegister(Perform perform) {
		
		
	}

	@Override
	public List<Perform> performList(Perform perform) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Perform performInquiry(Perform perform) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void performModify(Perform perform) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void performDelete(Perform perform) {
		// TODO Auto-generated method stub
		
	}
}
