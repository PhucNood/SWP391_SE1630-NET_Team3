/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author stick
 */
public class Archive {
    String searchValue;
    String monthYear;
    int totalBlog;

    public Archive() {
    }

    public Archive(String searchValue, String monthYear, int totalBlog) {
        this.searchValue = searchValue;
        this.monthYear = monthYear;
        this.totalBlog = totalBlog;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    

    public String getMonthYear() {
        return monthYear;
    }

    public void setMonthYear(String monthYear) {
        this.monthYear = monthYear;
    }

    public int getTotalBlog() {
        return totalBlog;
    }

    public void setTotalBlog(int totalBlog) {
        this.totalBlog = totalBlog;
    }

}
