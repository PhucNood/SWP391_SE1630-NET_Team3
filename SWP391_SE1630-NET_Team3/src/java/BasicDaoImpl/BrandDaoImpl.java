/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BasicDaoImpl;

import entity.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84923
 */
public class BrandDaoImpl extends DBContext {

    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
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
                Brand c = new Brand(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public Brand getBrandById(int id) {
        String sql = "SELECT [brandID]\n"
                + "      ,[title]\n"
                + "      ,[detail]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[brand]"
                +"WHERE brandID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand c = new Brand(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        BrandDaoImpl d = new BrandDaoImpl();
        Brand b = d.getBrandById(1);
        System.out.println(b.getTitle());
    }
}
