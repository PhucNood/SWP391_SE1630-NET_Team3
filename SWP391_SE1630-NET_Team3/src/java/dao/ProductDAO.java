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
public interface ProductDAO {
    public List<Product> getAllProduct();
    public List<Product> getProduct(String cid, String bid, String fid, String sid);
    public List<Product> searchListProduct(String text);
    public List<Product> getListByPage(List<Product> listProduct,int start, int end);
    public Product getProductById(String productID);
    public List<Product> getProductListByCategoryID(int categoryID);
    public void deleteProductDetail(String productID);
    public void updateProduct(String name, String description,
            String size, String categoryID, String brandID,
            String quantity, String price, String sale, String productID);
}
