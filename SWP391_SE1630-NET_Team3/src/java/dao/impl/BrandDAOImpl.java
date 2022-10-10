/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;


import dao.BrandDAO;
import entity.Brand;
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

public class BrandDAOImpl extends DBContext implements BrandDAO{

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    
    //get all list brand 
    @Override
    public List<Brand> getAllBrand() {
        List<Brand> listBrand = new ArrayList<>();

        String sql = "SELECT [brandID]\n"
                + "      ,[title]\n"
                + "      ,[detail]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[brand]";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt("brandID"), rs.getString("title"), 
                        rs.getString("detail"), rs.getString("created_at"), rs.getString("update_at"));
                listBrand.add(brand);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listBrand;
    }

    
    //get brand info with brandID
    @Override
    public Brand getBrandById(int id) {
        String sql = "SELECT [brandID]\n"
                + "      ,[title]\n"
                + "      ,[detail]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[brand]"
                + "WHERE brandID = ?";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Brand brand = new Brand(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return brand;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static void main(String[] args) {
        BrandDAOImpl brandDAO = new BrandDAOImpl();
        Brand brand = brandDAO.getBrandById(1);
        System.out.println(brand.getTitle());
    }
}