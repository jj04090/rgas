package org.goal.rgas.mission;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

/**
 * @author plusperson@gmail.com
*/
@Component
public class Mission implements Serializable {
    private int no;
    private int memberNo;
	@NotEmpty
    private String title;
	@NotEmpty
    private String note;
    private int entryFee;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;
    @NotNull
    @DateTimeFormat(pattern = "hh:mm:ss")
    private String certifiedStartTime;
    @NotNull
    @DateTimeFormat(pattern = "hh:mm:ss")
    private String certifiedEndTime;
    private int categoryNo;
    private String logical;
    private String physical;
    private char status;

    private int itemStart;
    private int itemSizePerPage;

    public Mission() {
    }

	public Mission(int no, int memberNo, String title, String note, int entryFee, LocalDate startDate, LocalDate endDate, String certifiedStartTime, String certifiedEndTime, int categoryNo, String logical, String physical, char status, int itemStart, int itemSizePerPage) {
        this.no = no;
        this.memberNo = memberNo;
        this.title = title;
        this.note = note;
        this.entryFee = entryFee;
        this.startDate = startDate;
        this.endDate = endDate;
        this.certifiedStartTime = certifiedStartTime;
        this.certifiedEndTime = certifiedEndTime;
        this.categoryNo = categoryNo;
        this.logical = logical;
        this.physical = physical;
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

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return this.title;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getNote() {
        return this.note;
    }

    public void setEntryFee(int entryFee) {
        this.entryFee = entryFee;
    }

    public int getEntryFee() {
        return this.entryFee;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getStartDate() {
        return this.startDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public LocalDate getEndDate() {
        return this.endDate;
    }

    public void setCertifiedStartTime(String certifiedStartTime) {
        this.certifiedStartTime = certifiedStartTime;
    }

    public String getCertifiedStartTime() {
        return this.certifiedStartTime;
    }

    public void setCertifiedEndTime(String certifiedEndTime) {
        this.certifiedEndTime = certifiedEndTime;
    }

    public String getCertifiedEndTime() {
        return this.certifiedEndTime;
    }

    public void setCategoryNo(int categoryNo) {
        this.categoryNo = categoryNo;
    }

    public int getCategoryNo() {
        return this.categoryNo;
    }

    public void setLogical(String logical) {
        this.logical = logical;
    }

    public String getLogical() {
        return this.logical;
    }

    public void setPhysical(String physical) {
        this.physical = physical;
    }

    public String getPhysical() {
        return this.physical;
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
    	return "Mission [no=" + no + ", memberNo=" + memberNo + ", title=" + title + ", note=" + note + ", entryFee="
    			+ entryFee + ", startDate=" + startDate + ", endDate=" + endDate + ", certifiedStartTime="
    			+ certifiedStartTime + ", certifiedEndTime=" + certifiedEndTime + ", categoryNo=" + categoryNo
    			+ ", logical=" + logical + ", physical=" + physical + ", status=" + status + "]";
    }
}