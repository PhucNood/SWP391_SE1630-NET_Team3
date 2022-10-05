/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.CategoryDAO;
import entity.Category;
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
 * @author 84923
 */
public class CategoryDAOImpl extends DBContext implements CategoryDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //get all list category 
    @Override
    public List<Category> getAllCategory() {
        List<Category> listCategory = new ArrayList<>();
        String sql = "SELECT [categoryID]\n"
                + "      ,[title]\n"
                + "      ,[detail]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[category]";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("title"), rs.getString("detail"), rs.getString("created_at"), rs.getString("update_at"));
                listCategory.add(category);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listCategory;
    }

    //get category by productID
    @Override
    public Category getCategoryById(int productID) {
        String sql = "SELECT [categoryID]\n"
                + "      ,[title]\n"
                + "      ,[detail]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[category]"
                + "where categoryID = ?";

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("title"), rs.getString("detail"),
                        rs.getString("created_at"), rs.getString("update_at"));
                return category;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }

    public static void main(String[] args) {
        CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
        Category category = categoryDAO.getCategoryById(2);
        List<Category> listCategory = categoryDAO.getAllCategory();
        System.out.println(category.getTitle());
        for (Category c : listCategory) {
            System.out.println(c.getTitle());
        }
    }
}
