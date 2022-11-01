/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public interface FilterDAO {
    public boolean checkUrlWithRole(String url,String id) throws ClassNotFoundException, SQLException;
    public List<String> urlListForGuest() throws ClassNotFoundException, SQLException;
}
