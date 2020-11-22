package org.goal.rgas.refunds;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author plusperson@gmail.com
 */
public class Refunds implements Serializable {
	private int no;
	private int paymentNo;
	private int amount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate refundsDate;

	private int itemStart;
	private int itemSizePerPage;

	public Refunds() {
	}

	public Refunds(int no, int paymentNo, int amount, LocalDate refundsDate, int itemStart, int itemSizePerPage) {
		super();
		this.no = no;
		this.paymentNo = paymentNo;
		this.amount = amount;
		this.refundsDate = refundsDate;
		this.itemStart = itemStart;
		this.itemSizePerPage = itemSizePerPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public LocalDate getRefundsDate() {
		return refundsDate;
	}

	public void setRefundsDate(LocalDate refundsDate) {
		this.refundsDate = refundsDate;
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