/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.OrderDAO;
import dao.ProductDAO;
import entity.Cart;
import entity.Item;
import entity.Order;
import entity.OrderDetail;
import entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class OrderDAOImpl extends DBContext implements OrderDAO {

    public List<Order> getOrder(String status, String search) throws ClassNotFoundException, SQLException {
        List<Order> listOrder = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            LocalDate now = LocalDate.now();
            String date = now.toString();
            //insert new order to order table
            String sql = "SELECT *"
                    + "  FROM [dbo].[order] where 1=1 ";
            if(!status.equals("0")){
                sql+= " and status = "+status;
            }
            if(!search.trim().equals("")){
                sql+= "and ( email like '%"+search+"%' "
                        + "or full_name like '%"+search+"%' "
                        + "or phone like '%"+search+"%' "
                        + "or address like '%"+search+"%')";
            }
            
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs= ps.executeQuery();
            while(rs.next()){
                Order oder = new Order(rs.getInt("id"), 
                        rs.getInt("account_id"),
                        rs.getString("full_name"), 
                        rs.getString("email"), 
                        rs.getString("phone"), 
                        rs.getString("address"), 
                        rs.getString("note"), 
                        rs.getString("status"), rs.getString("created_at"), rs.getString("update_at"));
                listOrder.add(oder);
            }
            
            return listOrder;

            

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }
    }

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
            ps.setString(7, "Confirm");
            ps.setString(8, date);
            ps.setString(9, date);
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

    @Override
    public List<Order> getOrderList(String accountID,String status, String search) throws ClassNotFoundException, SQLException {
        List<Order> orderList = new ArrayList<>();
        try {
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String sql = "SELECT *"
                    + "  FROM [dbo].[order] where 1=1 ";
            if(!accountID.equals("")){
                sql += " and account_id = '"+accountID+"' ";
            }
            if (!status.equals("")) {
                sql += " and status = '" + status + "' ";
            }
            if (!search.equals("")) {
                sql += " and (full_name like '%" + search + "%' or email like '%" + search + "%' "
                        + "or phone like '%" + search + "%' or address like '%" + search + "%' or note like '%" + search + "%') ";
            }
            sql+=" order by update_at desc";
            con = getConnection();
            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt("id"),
                        rs.getInt("account_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("note"),
                        rs.getString("status"),
                        rs.getString("created_at"),
                        rs.getString("update_at")
                );
                orderList.add(order);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return orderList;
    }

    @Override
    public Order getOrderById(String id) throws ClassNotFoundException, SQLException {
        try {
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String sql = "SELECT *"
                    + "  FROM [dbo].[order] where id=" + id;
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt("id"),
                        rs.getInt("account_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("note"),
                        rs.getString("status"),
                        rs.getString("created_at"),
                        rs.getString("update_at")
                );
                return order;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return null;
    }

    @Override
    public void updateStatus(String id, String status) throws ClassNotFoundException, SQLException {
        try {
            String sql = "UPDATE [dbo].[order]"
                    + "   SET [status] = ?"
                    + "      ,[update_at] = ?"
                    + " WHERE id = " + id;
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            LocalDate now = LocalDate.now();
            String date = now.toString();
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, date);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    @Override
    public List<OrderDetail> getOrderDetailListByOrderId(String orderID) throws ClassNotFoundException, SQLException {
        List<OrderDetail> orderDetailList = new ArrayList<>();
        try {
            ProductDAO ProductDAO = new ProductDAOImpl();
            String sql = "SELECT [order_id]"
                    + "      ,[product_id]"
                    + "      ,[quantity]"
                    + "      ,[feedback_id]"
                    + "      ,[created_at]"
                    + "      ,[updated_at]"
                    + "  FROM [dbo].[order_detail] where order_id = " + orderID;
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = ProductDAO.getProductById(rs.getString("product_id"));
                OrderDetail orderDetail = new OrderDetail(rs.getInt("order_id"),
                        product, rs.getInt("quantity"),
                        rs.getInt("feedback_id"), rs.getString("created_at"),
                        rs.getString("updated_at"));
                orderDetailList.add(orderDetail);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return orderDetailList;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        OrderDAO d = new OrderDAOImpl();
        List<OrderDetail> list = d.getOrderDetailListByOrderId("1");
        System.out.println(list.size());
//        List<Order> list = d.getAllOrder();
//        System.out.println(list.size());
//        LocalDate now = LocalDate.now();
//        String date = now.toString();
//        System.out.println(date);
//        d.addOrder(2, "vuhoaina,", "sadasd", "032392", "sasdjh", "adad", null);
    }
}
