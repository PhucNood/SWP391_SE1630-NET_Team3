/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.sql.SQLException;

/**
 *
 * @author admin
 */
public interface Image_ProductDAO {
    public void addImage_Product(String ImageID, String ProductID)throws ClassNotFoundException, SQLException;
    public void deleteImage_Product(String ImageID, String ProductID)throws ClassNotFoundException, SQLException;
}
