package org.goal.rgas.donationtransfer;

import java.util.List;

import org.goal.rgas.charity.Charity;
import org.goal.rgas.donationsave.DonationSaveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DonationTransferServiceImpl implements DonationTransferService{
	@Autowired
	DonationTransferMapper donationTransferMapper;
	
	@Autowired
	DonationSaveMapper donationSaveMapper;

	@Override
	public boolean donationTransferProcess(Charity charity) {
		
		return false;
	}

	@Override
	public void donationTransferRegister(DonationTransfer donationTransfer) {
		try {
			donationTransferMapper.insert(donationTransfer);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<DonationTransfer> donationTransferList(DonationTransfer donationTransfer) {
		List<DonationTransfer> donationTransferList = null;
		try {
			donationTransferList = donationTransferMapper.list(donationTransfer);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return donationTransferList;
	}

}
