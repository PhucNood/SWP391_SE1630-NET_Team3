/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Category;
import entity.Product;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author ACER
 */
public interface HomeDAO {
    public List<Product> getNewProductsEachCategory();
}
