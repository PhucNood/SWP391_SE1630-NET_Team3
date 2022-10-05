/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Product;
import java.util.List;

/**
 *
 * @author admin
 */
public interface ProductDAO1 {
    public List<Product> getAllProduct();
    public List<Product> getProduct(String cid, String bid, String fid, String sid);
    public List<Product> searchListProduct(String text);
}
