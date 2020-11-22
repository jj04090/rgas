package org.goal.rgas.donationtransfer;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * @author plusperson@gmail.com
 */
public class DonationTransfer implements Serializable {
	private int no;
	private int charityNo;
	private int amount;
	private LocalDate transferDate;

	private int itemStart;
	private int itemSizePerPage;

	public DonationTransfer() {
	}

	public DonationTransfer(int no, int charityNo, int amount, LocalDate transferDate, int itemStart,
			int itemSizePerPage) {
		super();
		this.no = no;
		this.charityNo = charityNo;
		this.amount = amount;
		this.transferDate = transferDate;
		this.itemStart = itemStart;
		this.itemSizePerPage = itemSizePerPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCharityNo() {
		return charityNo;
	}

	public void setCharityNo(int charityNo) {
		this.charityNo = charityNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public LocalDate getTransferDate() {
		return transferDate;
	}

	public void setTransferDate(LocalDate transferDate) {
		this.transferDate = transferDate;
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