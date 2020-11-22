package org.goal.rgas.charity;

import java.util.List;

public interface CharityService {
	public void charityRegister(Charity charity);
	public List<Charity> charityList(Charity charity);
	public Charity charityInquiry(Charity charity);
	public void charityModify(Charity charity);
	public void charityDelete(Charity charity);
}
