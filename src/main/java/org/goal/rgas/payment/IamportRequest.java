package org.goal.rgas.payment;

import java.io.Serializable;

public class IamportRequest implements Serializable {
	private String merchantUid;
	private String paymentName;
	private int amount;
	private String buyerEmail;
	private String buyerName;
	private int missionNo;

	public IamportRequest() {
	}

	public IamportRequest(String merchantUid, String paymentName, int amount, String buyerEmail, String buyerName,
			int missionNo) {
		super();
		this.merchantUid = merchantUid;
		this.paymentName = paymentName;
		this.amount = amount;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.missionNo = missionNo;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public int getMissionNo() {
		return missionNo;
	}

	public void setMissionNo(int missionNo) {
		this.missionNo = missionNo;
	}
}
