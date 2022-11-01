/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.FilterDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class FilterDAOImpl extends DBContext implements FilterDAO {

    @Override
    public boolean checkUrlWithRole(String url,String id) throws ClassNotFoundException, SQLException {
        String u = url.replaceAll("/", "");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<String> urlList = new ArrayList<>();
        String sql = "SELECT u.[url]\n"
                + "  FROM [role_url] ru inner join [url] u on ru.id_url = u.id\n"
                + "  where (ru.id_role = 0 or ru.id_role = ?) and [url] = ?";
        System.out.println(id);
        try {
            con=getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, u);
            rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilterDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }finally{
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }
        return false;
    }
    
    @Override
    public List<String> urlListForGuest() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<String> urlList = new ArrayList<>();
        String sql = "SELECT u.[url]\n"
                + "  FROM [role_url] ru inner join [url] u on ru.id_url = u.id\n"
                + "  where ru.id_role = 0";
        try {
            con=getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                urlList.add(rs.getString("url"));
            }
            return urlList;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilterDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }finally{
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(con);
        }
    }
    
    public static void main(String[] args) {
        try {
            FilterDAO d = new FilterDAOImpl();
            boolean a = d.checkUrlWithRole("/login", "1");
            System.out.println(a);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilterDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
