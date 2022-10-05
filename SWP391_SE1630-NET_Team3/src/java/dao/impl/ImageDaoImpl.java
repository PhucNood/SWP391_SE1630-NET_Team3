/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

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
public class ImageDaoImpl extends DBContext {
    Connection conn;
    public List<Image> getListByIdProduct(int id) {
        List<Image> list = new ArrayList<>();
        String sql = "Select img.*\n"
                + "From image_product imp inner join product p on p.productID = imp.product_id\n"
                + "			inner join [image] img on imp.image_id = img.id\n"
                + "WHERE p.productID =" + id;

        try {
            conn = getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image c = new Image(rs.getInt(1),
                        rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ImageDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        ImageDaoImpl d = new ImageDaoImpl();
        List<Image> list = d.getListByIdProduct(1);
        System.out.println(list.get(0).getImgSource());
    }
}
