package org.goal.rgas.report;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

/**
 * @author plusperson@gmail.com
*/
public class Report implements Serializable {
    private int no;
    private int memberNo;
    private int performNo;
    @NotBlank
    private String note;
    private LocalDate reportDate;	
    private char status;

    private int itemStart;
    private int itemSizePerPage;

    public Report() {
    }

    public Report(int no, int memberNo, int performNo, String note, LocalDate reportDate, char status, int itemStart, int itemSizePerPage) {
        this.no = no;
        this.memberNo = memberNo;
        this.performNo = performNo;
        this.note = note;
        this.reportDate = reportDate;
        this.status = status;

        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getNo() {
        return this.no;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public int getMemberNo() {
        return this.memberNo;
    }

    public void setPerformNo(int performNo) {
        this.performNo = performNo;
    }

    public int getPerformNo() {
        return this.performNo;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getNote() {
        return this.note;
    }

    public void setReportDate(LocalDate reportDate) {
        this.reportDate = reportDate;
    }

    public LocalDate getReportDate() {
        return this.reportDate;
    }

    public void setStatus(char status) {
        this.status = status;
    }

    public char getStatus() {
        return this.status;
    }

    public void setItemStart(int itemStart) {
        this.itemStart = itemStart;
    }

    public int getItemStart() {
        return this.itemStart;
    }

    public void setItemSizePerPage(int itemSizePerPage) {
        this.itemSizePerPage = itemSizePerPage;
    }

    public int getItemSizePerPage() {
        return this.itemSizePerPage;
    }

	@Override
	public String toString() {
		return "Report [no=" + no + ", memberNo=" + memberNo + ", performNo=" + performNo + ", note=" + note
				+ ", reportDate=" + reportDate + ", status=" + status + "]";
	}
    
}