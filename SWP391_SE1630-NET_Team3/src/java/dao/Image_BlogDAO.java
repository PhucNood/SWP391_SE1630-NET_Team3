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
public interface Image_BlogDAO {
    public void addImage_Blog(String ImageID, String BlogID)throws ClassNotFoundException, SQLException;
    public void deleteImage_Blog( String BlogID)throws ClassNotFoundException, SQLException;
}
