/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Image;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public interface ImageDAO {
    public List<Image> getListByIdProduct(int id)throws ClassNotFoundException, SQLException;
    public String getImageID(String Image)throws ClassNotFoundException, SQLException;
    public void addImage(String name, String Image)throws ClassNotFoundException, SQLException;
}
