/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.Image_BlogDAO;
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
public class Image_BlogDAOImpl extends DBContext implements Image_BlogDAO{
    //add connect of pro and imag in database
    @Override
    public void addImage_Blog(String ImageID, String BlogID) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "INSERT INTO [dbo].[image_blog]"
                + "           ([blog_id]"
                + "           ,[image_id])"
                + "     VALUES"
                + "           (?"
                + "           ,?)";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, BlogID);
            ps.setString(2, ImageID);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ImageDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }
    }

    
    //delete connect of pro and imag in database
    @Override
    public void deleteImage_Blog(String BlogID) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "DELETE FROM [dbo].[image_blog]"
                + "      WHERE blog_id = ? ";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, BlogID);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ImageDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }
    }
}
