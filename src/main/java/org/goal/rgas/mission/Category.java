package org.goal.rgas.mission;

import java.sql.Date;
import java.io.Serializable;

/**
 * @author plusperson@gmail.com
*/
public class Category implements Serializable {
    private int no;
    private String title;

    private int itemStart;
    private int itemSizePerPage;

    public Category() {
    }

    public Category(int no, String title, int itemStart, int itemSizePerPage) {
        this.no = no;
        this.title = title;

        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getNo() {
        return this.no;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return this.title;
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
}