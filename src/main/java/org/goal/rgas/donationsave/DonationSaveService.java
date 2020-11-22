package org.goal.rgas.donationsave;

import java.util.List;

public interface DonationSaveService {
	public List<DonationSave> donationSaveList(DonationSave danationSave);
	public void donationSaveModify(DonationSave DonationSave);
}
