package org.goal.rgas.member;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

/**
 * @author plusperson@gmail.com
 */
public class Member implements Serializable {
	private int no;
	@Email
	private String email;
	@NotBlank
	private String password;
	@NotBlank
	private String name;
	@NotBlank
	private String nickname;
	@NotBlank
	private String bank;
	@NotBlank
	private String account;
	private char grade;
	private char auth;
	private char status;

	private int itemStart;
	private int itemSizePerPage;

	public Member() {
	}

	public Member(int no, String email, String password, String name, String nickname, String bank, String account,
			char grade, char auth, char status, int itemStart, int itemSizePerPage) {
		this.no = no;
		this.email = email;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.bank = bank;
		this.account = account;
		this.grade = grade;
		this.auth = auth;
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

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return this.password;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBank() {
		return this.bank;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAccount() {
		return this.account;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	public char getGrade() {
		return this.grade;
	}

	public void setAuth(char auth) {
		this.auth = auth;
	}

	public char getAuth() {
		return this.auth;
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
		return "Member [no=" + no + ", email=" + email + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", bank=" + bank + ", account=" + account + ", grade=" + grade + ", auth=" + auth
				+ ", status=" + status + "]";
	}

}