/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BasicDaoImpl;

import entity.Blog;
import entity.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author stick
 */
public class BlogDAOImpl extends DBContext {
    // <editor-fold defaultstate="collapsed" desc="simple get blog arraylist and add new blog">
    public List<Blog> getBlogList(){
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT [brandID]\n"
                + "      ,[title]\n"
                + "      ,[detail]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[brand]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                
            }
        } catch (SQLException e) {
        }
        return list;
    }
    //</editor-fold> 
}
