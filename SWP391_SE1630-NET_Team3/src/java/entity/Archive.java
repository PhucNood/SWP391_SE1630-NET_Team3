/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author stick
 */
public class Archive {
    String dateString;
    Date monthYear;
    int totalBlog;

    public Archive() {
    }

    public Archive(String dateString, Date monthYear, int totalBlog) {
        this.dateString = dateString;
        this.monthYear = monthYear;
        this.totalBlog = totalBlog;
    }

    public String getDateString() {
        return dateString;
    }

    public void setDateString(String dateString) {
        this.dateString = dateString;
    }

    public Date getMonthYear() {
        return monthYear;
    }

    public void setMonthYear(Date monthYear) {
        this.monthYear = monthYear;
    }

    public int getTotalBlog() {
        return totalBlog;
    }

    public void setTotalBlog(int totalBlog) {
        this.totalBlog = totalBlog;
    }
    
}
