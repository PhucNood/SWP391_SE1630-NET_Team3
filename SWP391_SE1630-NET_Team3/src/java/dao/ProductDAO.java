/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Product;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public interface ProductDAO {
    public List<Product> getAllProduct()throws ClassNotFoundException, SQLException;
    public List<Product> getProduct(String cid, String bid, String fid, String sid) throws ClassNotFoundException, SQLException; 
    public List<Product> searchListProduct(String text)throws ClassNotFoundException, SQLException;
    public List<Product> getListByPage(List<Product> listProduct,int start, int end)throws ClassNotFoundException, SQLException;
    public Product getProductById(String productID)throws ClassNotFoundException, SQLException;
    public List<Product> getProductListByCategoryID(int categoryID)throws ClassNotFoundException, SQLException;
    public void deleteProduct(String productID)throws ClassNotFoundException, SQLException;
    public void updateProduct(String name, String description,
            String size, String categoryID, String brandID,
            String quantity, String price, String sale, String productID)throws ClassNotFoundException, SQLException;
    public void addProduct(String name, String description, 
            String size, String categoryID, String brandID,
            String quantity, String price, String sale)throws ClassNotFoundException, SQLException;
    public String getIdOfProduct()throws ClassNotFoundException, SQLException;
}
