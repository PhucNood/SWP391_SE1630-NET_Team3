/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Category;
import java.util.List;

/**
 *
 * @author admin
 */
public interface CategoryDAO {
    public List<Category> getAllCategory();
    public Category getCategoryById(int id);
    
}
