<<<<<<< HEAD
package org.goal.rgas.charity;

import java.sql.Date;
import java.io.Serializable;

/**
 * @author plusperson@gmail.com
*/
public class Charity implements Serializable {
    private int no;
    private String name;
    private String bank;
    private String account;

    private int itemStart;
    private int itemSizePerPage;

    public Charity() {
    }

    public Charity(int no, String name, String bank, String account, int itemStart, int itemSizePerPage) {
        this.no = no;
        this.name = name;
        this.bank = bank;
        this.account = account;

        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getNo() {
        return this.no;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
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
=======
package org.goal.rgas.charity;

import java.sql.Date;
import java.io.Serializable;

/**
 * @author plusperson@gmail.com
*/
public class Charity implements Serializable {
    private int no;
    private String name;
    private String bank;
    private String account;

    private int itemStart;
    private int itemSizePerPage;

    public Charity() {
    }

    public Charity(int no, String name, String bank, String account, int itemStart, int itemSizePerPage) {
        this.no = no;
        this.name = name;
        this.bank = bank;
        this.account = account;

        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getNo() {
        return this.no;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
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
>>>>>>> refs/remotes/origin/suhyung
}