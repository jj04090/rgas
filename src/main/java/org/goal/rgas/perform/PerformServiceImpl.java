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
	public List<Perform> performList(Perform perform) throws Exception {
		List<Perform> list = performMapper.list(perform);
		
		return list;
	}

	@Override
	public Perform performInquiry(Perform perform) throws Exception {
		Perform performValue = performMapper.select(perform);
		
		return performValue;
	}

	@Override
	public void performModify(Perform perform) throws Exception {
		performMapper.update(perform);
	}

	@Override
	public void performDelete(Perform perform) {
		
	}
}