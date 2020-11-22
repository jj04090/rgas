package org.goal.rgas.perform;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * @author plusperson@gmail.com
 */
public class Perform implements Serializable {
	private int no;
	private int paymentNo;
	private LocalDate registerDate;
	private String logical;
	private String physical;
	private char status;

	private int itemStart;
	private int itemSizePerPage;

	public Perform() {
	}

	public Perform(int no, int paymentNo, LocalDate registerDate, String logical, String physical, char status,
			int itemStart, int itemSizePerPage) {
		super();
		this.no = no;
		this.paymentNo = paymentNo;
		this.registerDate = registerDate;
		this.logical = logical;
		this.physical = physical;
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

	public LocalDate getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(LocalDate registerDate) {
		this.registerDate = registerDate;
	}

	public String getLogical() {
		return logical;
	}

	public void setLogical(String logical) {
		this.logical = logical;
	}

	public String getPhysical() {
		return physical;
	}

	public void setPhysical(String physical) {
		this.physical = physical;
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