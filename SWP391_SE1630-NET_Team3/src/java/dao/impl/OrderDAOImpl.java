/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.OrderDAO;
import entity.Order;
import entity.Product;
import java.sql.Connection;
import java.sql.Date;
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
public class OrderDAOImpl extends DBContext implements OrderDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public Collection<Order> getOrders() {
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "SELECT  o.[id]\n"
                + "      ,o.[account_id]\n"
                + "      ,o.[full_name]\n"
                + "      ,o.[email]\n"
                + "      ,o.[phone]\n"
                + "      ,o.[address]\n"
                + "	  ,a.email as 'Order Email'\n"
                + "      ,[note]\n"
                + "      ,[status]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [SWP391_SE1630_N3].[dbo].[order] AS o\n"
                + "  JOIN [SWP391_SE1630_N3].[dbo].[account] AS a ON o.account_id = a.id;";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getInt("id"));
                order.setAccountID(rs.getInt("id"));
                order.setOrderBy(new AccountDAOImpl().getAccByEmail(rs.getString("Order Email")));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setNote("note");
                order.setStatus(rs.getString("status"));
                order.setCreateAt(rs.getDate("created_at"));
                order.setEditAt(rs.getDate("update_at"));

                orders.add(order);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    @Override
    public Order getOrderbyID(int id) {
        String sql = "SELECT  o.[id]\n"
                + "      ,o.[account_id]\n"
                + "      ,o.[full_name]\n"
                + "      ,o.[email]\n"
                + "      ,o.[phone]\n"
                + "      ,o.[address]\n"
                + "	  ,a.email as 'Order Email'\n"
                + "      ,[note]\n"
                + "      ,[status]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [SWP391_SE1630_N3].[dbo].[order] AS o\n"
                + "  JOIN [SWP391_SE1630_N3].[dbo].[account] AS a ON o.account_id = a.id\n"
                + "  WHERE  o.[id] =?";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getInt("id"));
                order.setAccountID(rs.getInt("id"));
                order.setOrderBy(new AccountDAOImpl().getAccByEmail(rs.getString("Order Email")));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setNote("note");
                order.setStatus(rs.getString("status"));
                order.setCreateAt(rs.getDate("created_at"));
                order.setEditAt(rs.getDate("update_at"));

            }else{
                throw new NullPointerException();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        OrderDAOImpl dao = new OrderDAOImpl();

        for (Order order : dao.getOrders()) {
            System.out.println(order);
        }
    }

}
