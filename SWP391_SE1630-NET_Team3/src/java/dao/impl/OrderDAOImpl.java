/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.OrderDAO;
import entity.Account;
import entity.Cart;
import entity.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class OrderDAOImpl extends DBContext implements OrderDAO {

    @Override
    public void addOrder(int accountID, String fullname, String email,
            String phone, String address, String note, Cart cart)
            throws ClassNotFoundException, SQLException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            LocalDate now = LocalDate.now();
            String date = now.toString();
            //insert new order to order table
            String insertOrder = "INSERT INTO [dbo].[order]"
                    + "           ([account_id]"
                    + "           ,[full_name]"
                    + "           ,[email]"
                    + "           ,[phone]"
                    + "           ,[address]"
                    + "           ,[note]"
                    + "           ,[status]"
                    + "           ,[created_at]"
                    + "           ,[update_at])"
                    + "     VALUES"
                    + "           (?,?,?,?,?,?,?,?,?)";
            con = getConnection();
            ps = con.prepareStatement(insertOrder);
            ps.setInt(1, accountID);
            ps.setString(2, fullname);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, note);
            ps.setString(7, "1");
            ps.setString(8, date);
            ps.setString(9, null);
            ps.executeUpdate();

            //get id of new order
            String getNewID = "SELECT TOP 1 id"
                    + "  FROM [dbo].[order]"
                    + "  ORDER BY id DESC";
            ps = con.prepareStatement(getNewID);
            rs = ps.executeQuery();

            if (rs.next()) {
                int newID = rs.getInt("id");
                for (Item item : cart.getItems()) {
                    String insertDetail = "INSERT INTO [dbo].[order_detail]"
                            + "           ([order_id]"
                            + "           ,[product_id]"
                            + "           ,[quantity]"
                            + "           ,[feedback_id]"
                            + "           ,[created_at]"
                            + "           ,[updated_at])"
                            + "     VALUES (?,?,?,?,?,?)";
                    con = getConnection();
                    ps = con.prepareStatement(insertDetail);
                    ps.setInt(1, newID);
                    ps.setInt(2, item.getProduct().getProductID());
                    ps.setInt(3, item.getQuantity());
                    ps.setString(4, null);
                    ps.setString(5, date);
                    ps.setString(6, null);
                    ps.executeUpdate();

                    // update quantiy of product
                    String updateQuantity = "UPDATE [dbo].[product]"
                            + "   SET [quantity] = [quantity] - ?"
                            + "      ,[update_at] = ?"
                            + " WHERE productID = ?";
                    con = getConnection();
                    ps = con.prepareStatement(updateQuantity);
                    ps.setInt(1, item.getQuantity());
                    ps.setString(2, date);
                    ps.setInt(3, item.getProduct().getProductID());
                    ps.executeUpdate();
                }
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        OrderDAO d = new OrderDAOImpl();
//        LocalDate now = LocalDate.now();
//        String date = now.toString();
//        System.out.println(date);
//        d.addOrder(2, "vuhoaina,", "sadasd", "032392", "sasdjh", "adad", null);
    }
}
