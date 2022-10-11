/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import entity.Blog;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ACER
 */
public class HomeDAOImpl extends DBContext implements dao.HomeDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ProductDAOImpl productDAOImpl ;
    CategoryDAOImpl categoryDAOImpl;
    

    public HomeDAOImpl() {
        productDAOImpl = new ProductDAOImpl();
        categoryDAOImpl = new CategoryDAOImpl();
    }

    @Override
    public HashMap<Category, Product> getNewProductsEachCategory() {

        HashMap<Category, Product> lastestProduct = new HashMap<>();
       
        String sql = "SELECT \n"
                + "MAX(productID) as \"Id\",\n"
                + "p.categoryID\n"
                + "FROM SWP391_SE1630_N3.dbo.product as p\n"
                + "Group by p.categoryID";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category newCategory = categoryDAOImpl.getCategoryById(rs.getInt("categoryID"));
                Product newProduct = productDAOImpl.getProductById(rs.getString("Id"));
                lastestProduct.put(newCategory, newProduct);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(HomeDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return lastestProduct;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        HomeDAOImpl dao = new HomeDAOImpl();
//        for (Product product : dao.productDAOImpl.getAllProduct()) {
//            System.out.println(product.getProductID());
//        }
               System.out.println(java.time.LocalDateTime.now());    

    }

}
