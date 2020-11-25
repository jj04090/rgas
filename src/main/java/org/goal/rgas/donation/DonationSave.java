package org.goal.rgas.donation;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author plusperson@gmail.com
*/
public class DonationSave implements Serializable {
    private int no;
    private int paymentNo;
    private int amount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate saveDate;
    private char status;
    private int itemStart;
    private int itemSizePerPage;

    public DonationSave() {
    }

	public DonationSave(int no, int paymentNo, int amount, LocalDate saveDate, char status, int itemStart,
			int itemSizePerPage) {
		this.no = no;
		this.paymentNo = paymentNo;
		this.amount = amount;
		this.saveDate = saveDate;
		this.status = status;
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

	public LocalDate getSaveDate() {
		return saveDate;
	}

	public void setSaveDate(LocalDate saveDate) {
		this.saveDate = saveDate;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
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