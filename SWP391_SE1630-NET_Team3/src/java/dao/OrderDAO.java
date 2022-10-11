/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Order;
import entity.Product;
import java.util.Collection;

/**
 *
 * @author ACER
 */
public interface OrderDAO {
    public Collection<Order> getOrders();
    public Order getOrderbyID(int id);

}
