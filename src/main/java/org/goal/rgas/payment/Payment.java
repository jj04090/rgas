package org.goal.rgas.payment;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author plusperson@gmail.com
 */
public class Payment implements Serializable {
	private int no;
	private String paymentCode;
	private int memberNo;
	private int missionNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate paymentDate;
	private int deposit;

	private int itemStart;
	private int itemSizePerPage;

	public Payment() {
	}

	public Payment(int no, String paymentCode, int memberNo, int missionNo, LocalDate paymentDate, int deposit,
			int itemStart, int itemSizePerPage) {
		super();
		this.no = no;
		this.paymentCode = paymentCode;
		this.memberNo = memberNo;
		this.missionNo = missionNo;
		this.paymentDate = paymentDate;
		this.deposit = deposit;
		this.itemStart = itemStart;
		this.itemSizePerPage = itemSizePerPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getMissionNo() {
		return missionNo;
	}

	public void setMissionNo(int missionNo) {
		this.missionNo = missionNo;
	}

	public LocalDate getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(LocalDate paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getItemStart() {
		return itemStart;
	}

	public void setItemStart(int itemStart) {
		this.itemStart = itemStart;
	}

	public int getItemSizePerPage() {
		return itemSizePerPage;
	}

	public void setItemSizePerPage(int itemSizePerPage) {
		this.itemSizePerPage = itemSizePerPage;
	}

}