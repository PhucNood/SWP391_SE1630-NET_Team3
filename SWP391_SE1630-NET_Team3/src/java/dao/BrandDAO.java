/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Brand;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public interface BrandDAO {
    public List<Brand> getAllBrand()throws ClassNotFoundException, SQLException;
    public Brand getBrandById(int id)throws ClassNotFoundException, SQLException;
    
}
