package org.goal.rgas.donation;

import java.util.List;

import org.goal.rgas.charity.Charity;
import org.goal.rgas.payment.IamportRequest;

public interface DonationService {
	public IamportRequest donationTransferProcess(Charity charity, String merchantUid) throws Exception;
	public void donationTransferRegister(DonationTransfer donationTransfer) throws Exception;
	public List<DonationTransfer> donationTransferList(DonationTransfer donationTransfer) throws Exception;
	public List<DonationSave> donationSaveList(DonationSave donationSave) throws Exception;
	public void donationSaveModify(DonationSave donationSave) throws Exception;
}
