/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BasicDaoImpl;

import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84923
 */
public class CategoryDaoImpl extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [categoryID]\n"
                + "      ,[title]\n"
                + "      ,[detail]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT [categoryID]\n"
                + "      ,[title]\n"
                + "      ,[detail]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[category]"
                + "where categoryID = ?" ;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4), rs.getString(5));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        CategoryDaoImpl d = new CategoryDaoImpl();
        Category a = d.getCategoryById(2);
        List<Category> list = d.getAllCategory();
        System.out.println(a.getTitle());
        for(Category c : list){
            System.out.println(c.getTitle());
        }
    }
}
