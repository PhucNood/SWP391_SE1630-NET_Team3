/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.ImageDAO;
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
 * @author admin
 */
public class ImageDAOImpl extends DBContext implements ImageDAO {

    //getlist image by productID 
    @Override
    public List<Image> getListByIdProduct(int id) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Image> listImg = new ArrayList<>();
        String sql = "Select img.*\n"
                + "From image_product imp inner join product p on p.productID = imp.product_id\n"
                + "			inner join [image] img on imp.image_id = img.id\n"
                + "WHERE p.productID =" + id;

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Image image = new Image(rs.getInt("id"),
                        rs.getString("name"), 
                        rs.getString("imageSource"),
                        rs.getString("created_at"),
                        rs.getString("update_at"));
                listImg.add(image);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ImageDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }

        return listImg;
    }

    //add image of product
    @Override
    public void addImage(String name, String Image) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String getIdExist = getImageID(Image);
        if (getIdExist == null) {
            String sql = "INSERT INTO [dbo].[image]\n"
                    + "           ([name]\n"
                    + "           ,[imageSource])\n"
                    + "     VALUES(?,?)";
            try {
                con = getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, Image);
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

    //get ID of image
    @Override
    public String getImageID(String Image) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from [dbo].[image] where imageSource = ?";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, Image);
            rs = ps.executeQuery();
            if (rs.next()) {
                String ImageID = String.valueOf(rs.getInt("id"));
                return ImageID;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ImageDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }
        return null;
    }
    
   

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        ImageDAOImpl d = new ImageDAOImpl();
        List<Image> listImg = d.getListByIdProduct(1);
        System.out.println(listImg.get(0).getImgSource());
//        d.addImage("name","nam.jpg");
        System.out.println(d.getImageID("AG-201.jpg"));
    }
}
