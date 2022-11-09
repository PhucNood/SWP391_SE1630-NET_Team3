/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.HomeDAO;
import entity.Image;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ACER
 */
public class HomeDAOImpl extends DBContext implements dao.HomeDAO {

    public HomeDAOImpl() {
    }

    @Override
    public List<Product> getNewProductsEachCategory() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> listProduct = new ArrayList<>();
        List<Image> listImg = new ArrayList<>();
        ImageDAOImpl ImageDAO = new ImageDAOImpl();

        try {
            String sql = "SELECT TOP 1 * FROM [dbo].[Product] WHERE categoryID = ?  order by productID DESC";
            for (int i = 1; i <= 3; i++) {

                con = getConnection();
                ps = con.prepareStatement(sql);
                ps.setInt(1, i);
                rs = ps.executeQuery();
                while (rs.next()) {
                    listImg = ImageDAO.getListByIdProduct(rs.getInt(1));
                    Product product = new Product(rs.getInt("productID"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getString("size"),
                            rs.getInt("categoryID"),
                            rs.getInt("brandID"),
                            rs.getInt("quantity"),
                            rs.getDouble("price"),
                            rs.getInt("sale"),
                            rs.getString("created_at"),
                            rs.getString("update_at"),
                            listImg);
                    listProduct.add(product);
                }

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }

        return listProduct;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        HomeDAO dao = new HomeDAOImpl();
        List<Product> listProduct = new ArrayList<>();
        listProduct = dao.getNewProductsEachCategory();
        System.out.println(listProduct.size());
    }

}
