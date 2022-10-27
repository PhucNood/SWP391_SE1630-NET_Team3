/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Category;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public interface CategoryDAO {
    public List<Category> getAllCategory()throws ClassNotFoundException, SQLException;
    public Category getCategoryById(int id)throws ClassNotFoundException, SQLException;
    
}
