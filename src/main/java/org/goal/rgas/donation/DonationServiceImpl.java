package org.goal.rgas.donation;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.goal.rgas.charity.Charity;
import org.goal.rgas.charity.CharityMapper;
import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberMapper;
import org.goal.rgas.payment.IamportRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DonationServiceImpl implements DonationService {
	@Autowired
	private DonationTransferMapper donationTransferMapper;

	@Autowired
	private DonationSaveMapper donationSaveMapper;
	
	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private CharityMapper charityMapper;
	
	@Autowired
	private HttpSession httpSession;

	//기부금 이체 창 띄우기
	@Override
	public IamportRequest donationTransferProcess(Charity charity, String merchantUid) throws Exception {
		IamportRequest iamportRequest = new IamportRequest();
		if (charity != null) {
			Charity charityValue = charityMapper.select(charity);
			iamportRequest.setMerchantUid("rgas_" + merchantUid);
			
			//화원 찾기
			Member member = new Member();
			member.setEmail((String) httpSession.getAttribute("email"));
			member = memberMapper.select(member);
			
			iamportRequest.setBuyerName(member.getName());
			iamportRequest.setBuyerEmail(member.getEmail());
			iamportRequest.setPaymentName(charityValue.getName());
			
			iamportRequest.setAmount(totalDonationSave());
			return iamportRequest;
		}
		return null;
	}

	//기부금 이체 내역 등록
	@Override
	public void donationTransferRegister(DonationTransfer donationTransfer) throws Exception {
		if (donationTransfer != null) {
			donationTransfer.setTransferDate(LocalDate.now());
			donationTransferMapper.insert(donationTransfer);
		}
	}

	//기부금 이체 내역 목록 조회
	@Override
	public List<DonationTransfer> donationTransferList(DonationTransfer donationTransfer) throws Exception {
		List<DonationTransfer> donationTransferList = donationTransferMapper.list(donationTransfer);
		return donationTransferList;
	}

	//기부금 적립 내역 목록 조회
	@Override
	public List<DonationSave> donationSaveList(DonationSave donationSave) throws Exception {
		List<DonationSave> donationSaveList = donationSaveMapper.list(donationSave);
		return donationSaveList;
	}

	//기부금 적립 내역 수정
	@Override
	public void donationSaveModify(DonationSave donationSave) throws Exception {
		
		if (donationSave != null) {
			donationSave.setSaveDate(LocalDate.now());
			donationSave.setStatus('Y');
			donationSaveMapper.update(donationSave);
		}
	}
	
	//총 기부금 찾기
	public int totalDonationSave() throws Exception {
		int totalAmount = 0;
		DonationSave donationSave = new DonationSave();
		donationSave.setSaveDate(LocalDate.now());
		List<DonationSave> donationSaveList = donationSaveMapper.list(donationSave);

		for (int i = 0; i < donationSaveList.size(); i++) {
			if (donationSaveList.get(i).getStatus() == 'N') {
				totalAmount += donationSaveList.get(i).getAmount();
			}
		}
		return totalAmount;
	}
}
