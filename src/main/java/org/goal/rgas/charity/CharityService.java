package org.goal.rgas.charity;

import java.util.List;

public interface CharityService {
	public void charityRegister(Charity charity) throws Exception;

	public List<Charity> charityList(Charity charity) throws Exception;

	public Charity charityInquiry(Charity charity) throws Exception;

	public void charityModify(Charity charity) throws Exception;

	public void charityDelete(Charity charity) throws Exception;
}
