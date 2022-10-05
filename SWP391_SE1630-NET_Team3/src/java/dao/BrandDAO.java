/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Brand;
import java.util.List;

/**
 *
 * @author admin
 */
public interface BrandDAO {
    public List<Brand> getAllBrand();
    public Brand getBrandById(int id);
    
}
