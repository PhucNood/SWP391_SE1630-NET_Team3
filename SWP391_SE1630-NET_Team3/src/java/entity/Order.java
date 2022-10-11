/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.util.Collection;

/**
 *
 * @author ACER
 */
public class Order {

    public final static String APPROVING = "Aprroving";
    public final static String WAITING = "Waiting";
    public final static String PROCESS = "Process";
    public final static String CANCELED = "Canceled";
    public final static String DENIED = "Diened";

    private int orderID, accountID;
    private String name, mail, status, phone, address, note;
    private Date createAt, editAt;
    private Account orderBy;
      private Collection<Product> products;
    public Collection<Product> getProducts() {
        return products;
    }

    public void setProducts(Collection<Product> products) {
        this.products = products;
    }
 

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getEditAt() {
        return editAt;
    }

    public void setEditAt(Date editAt) {
        this.editAt = editAt;
    }

    public Order() {
    }

    public Account getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(Account orderBy) {
        this.orderBy = orderBy;
    }

    public Order(int orderID, int accountID, String name, String mail, String status, String phone, String address, String note, Date createAt, Date editAt, Account orderBy, Collection<Product> products) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.name = name;
        this.mail = mail;
        this.status = status;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.createAt = createAt;
        this.editAt = editAt;
        this.orderBy = orderBy;
        this.products = products;
    }

    
}
