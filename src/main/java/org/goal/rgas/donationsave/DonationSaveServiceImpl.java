package org.goal.rgas.donationsave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DonationSaveServiceImpl implements DonationSaveService{
	@Autowired
	public DonationSaveMapper donationSaveMapper;

	@Override
	public List<DonationSave> donationSaveList(DonationSave donationSave) {
		List<DonationSave> donationSaveList = null;
		try {
			donationSaveList = donationSaveMapper.list(donationSave);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return donationSaveList;
	}

	@Override
	public void donationSaveModify(DonationSave donationSave) {
		try {
			donationSaveMapper.update(donationSave);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
