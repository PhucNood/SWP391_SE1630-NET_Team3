/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author 84923
 */
public class Product {
    private int productID;
    private String name,description,size;
    private int categoryID,brandID,quantity;
    private double price;
    private int sale;
    private String createAt,updateAt;
    private List<Image> list;

    public Product() {
    }


    public Product(int productID, String name, String description, String size, int categoryID, int brandID, int quantity, double price, int sale, String createAt, String updateAt, List<Image> list) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.size = size;
        this.categoryID = categoryID;
        this.brandID = brandID;
        this.quantity = quantity;
        this.price = price;
        this.sale = sale;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.list = list;
    }
    
    
    
    
    
    
    public List<Image> getList() {
        return list;
    }

    public void setList(List<Image> list) {
        this.list = list;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }

    
}
