package org.goal.rgas.donation;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.goal.rgas.charity.Charity;
import org.goal.rgas.charity.CharityMapper;
import org.goal.rgas.member.Member;
import org.goal.rgas.payment.IamportRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DonationServiceImpl implements DonationService {
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private DonationTransferMapper donationTransferMapper;

	@Autowired
	private DonationSaveMapper donationSaveMapper;

	@Autowired
	private CharityMapper charityMapper;

	// 기부금 이체 창 띄우기
	@Override
	public IamportRequest donationTransferProcess(Charity charity, String merchantUid) throws Exception {
		IamportRequest iamportRequest = new IamportRequest();

		charity = charityMapper.select(charity);
		iamportRequest.setMerchantUid("rgas_" + merchantUid);

		// 화원 찾기
		Member member = (Member) httpSession.getAttribute("memberValue");

		iamportRequest.setBuyerName(member.getName());
		iamportRequest.setBuyerEmail(member.getEmail());
		iamportRequest.setPaymentName(charity.getName());
		iamportRequest.setAmount(totalDonationSave());

		return iamportRequest;
	}

	// 기부금 이체 내역 등록
	@Override
	public void donationTransferRegister(DonationTransfer donationTransfer) throws Exception {
		donationTransferMapper.insert(donationTransfer);
	}

	// 기부금 이체 내역 목록 조회
	@Override
	public List<DonationTransfer> donationTransferList(DonationTransfer donationTransfer) throws Exception {
		return donationTransferMapper.list(donationTransfer);
	}

	// 기부금 적립 내역 목록 조회
	@Override
	public List<DonationSave> donationSaveList(DonationSave donationSave) throws Exception {
		return donationSaveMapper.list(donationSave);
	}

	// 기부금 적립 내역 수정
	@Override
	public void donationSaveModify(DonationSave donationSave) throws Exception {
		donationSave.setStatus('Y');
		donationSaveMapper.update(donationSave);
	}

	// 적립된 총 기부금액 계산
	@Override
	public int totalDonationSave() throws Exception {
		int totalAmount = 0;
		DonationSave donationSave = new DonationSave();
		donationSave.setSaveDate(LocalDate.now());

		// 오늘 이전으로 적립된 기부금 목록 조회
		List<DonationSave> donationSaveList = donationSaveMapper.list(donationSave);

		for (DonationSave donationSaveValue : donationSaveList) {
			if (donationSaveValue.getStatus() == 'N') {
				totalAmount += donationSaveValue.getAmount();
			}
		}

		return totalAmount;
	}
}
