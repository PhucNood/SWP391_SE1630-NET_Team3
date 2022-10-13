/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.Image_ProductDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class Image_ProductDAOImpl extends DBContext implements Image_ProductDAO {

    
    //add connect of pro and imag in database
    @Override
    public void addImage_Product(String ImageID, String ProductID) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "INSERT INTO [dbo].[image_product]\n"
                + "           ([product_id]\n"
                + "           ,[image_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, ProductID);
            ps.setString(2, ImageID);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ImageDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeResultSet(rs);
        closePrepareState(ps);
        closeConnection(con);
    }

    
    //delete connect of pro and imag in database
    @Override
    public void deleteImage_Product(String ImageID, String ProductID) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "DELETE FROM [dbo].[image_product]\n"
                + "      WHERE product_id = ? and image_id = ?";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, ProductID);
            ps.setString(2, ImageID);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ImageDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeResultSet(rs);
        closePrepareState(ps);
        closeConnection(con);
    }

    public static void main(String[] args) {
        Image_ProductDAO d = new Image_ProductDAOImpl();
//        d.addImage_Product("30", "29");
        d.deleteImage_Product("30", "29");
    }
}
