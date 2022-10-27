/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Account;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public interface AccountDAO {
    public List<Account> getListAccount(String sort, String gender, String role, String search) throws ClassNotFoundException, SQLException;
    public Account getAccByEmail(String email) throws ClassNotFoundException, SQLException;
    public void addAccount(String email, String phone, String fullname, String username, String password) throws ClassNotFoundException, SQLException;

    public void updateAccountRole(String email, String role)throws ClassNotFoundException, SQLException;
    public void ChangePass(String email, String password)throws ClassNotFoundException, SQLException;
    public void UpdateInfo(String email, String phone, String fullname, String user)throws ClassNotFoundException, SQLException;

}
