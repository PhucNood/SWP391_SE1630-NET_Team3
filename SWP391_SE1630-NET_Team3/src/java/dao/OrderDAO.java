/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Cart;
import entity.Order;
import entity.OrderDetail;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public interface OrderDAO {
    public void addOrder(int accountID, String fullname, String email,
            String phone, String address, String note, Cart cart)
            throws ClassNotFoundException, SQLException ;
    public List<Order> getOrderList(String accountID,String status, String search) throws ClassNotFoundException, SQLException;
    public Order getOrderById(String id) throws ClassNotFoundException, SQLException;
    public void updateStatus(String id, String status) throws ClassNotFoundException, SQLException;
    public List<OrderDetail> getOrderDetailListByOrderId(String orderID) throws ClassNotFoundException, SQLException;
}
