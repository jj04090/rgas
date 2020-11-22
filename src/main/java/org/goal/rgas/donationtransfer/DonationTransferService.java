package org.goal.rgas.donationtransfer;

import java.util.List;

import org.goal.rgas.charity.Charity;

public interface DonationTransferService {
	public boolean donationTransferProcess(Charity charity);
	public void donationTransferRegister(DonationTransfer donationTransfer);
	public List<DonationTransfer> donationTransferList(DonationTransfer donationTransfer);
}
