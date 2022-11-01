/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class OrderDetail {
    private int orderID;
    private int productID;
    private int quantitY;
    private int feedbackID;
    private String createAt;
    private String updateAt;

    public OrderDetail() {
    }

    public OrderDetail(int orderID, int productID, int quantitY, int feedbackID, String createAt, String updateAt) {
        this.orderID = orderID;
        this.productID = productID;
        this.quantitY = quantitY;
        this.feedbackID = feedbackID;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

   

    
    
    public int getOrderID() {
        return orderID;
    }

    public int getProductID() {
        return productID;
    }

    public int getQuantitY() {
        return quantitY;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public String getCreateAt() {
        return createAt;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setQuantitY(int quantitY) {
        this.quantitY = quantitY;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }
}
