/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ACER
 */
public class OrderDetailDAOImpl extends DBContext implements OrderDetailDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public Collection<OrderDetail> getAllOrderDetail() {
        ArrayList<Order> orderDetails = new ArrayList<>();
        String sql = "SELECT  [order_id]\n"
                + "      ,[product_id]\n"
                + "      ,[feedback_id]\n"
                + "      ,[created_at]\n"
                + "      ,[updated_at]\n"
                + "  FROM [SWP391_SE1630_N3].[dbo].[order_detail]";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                  OrderDetail orderDetail = new OrderDetail();
                  
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    @Override
    public Collection<Product> getProductsByOrder(int orderID) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
