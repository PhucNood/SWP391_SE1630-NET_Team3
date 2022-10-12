/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.OrderDetail;
import entity.Product;
import java.util.Collection;

/**
 *
 * @author ACER
 */
public interface OrderDetailDAO {
    
        public Collection<OrderDetail> getAllOrderDetail();
        public Collection<Product> getProductsByOrder(int orderID);
}
