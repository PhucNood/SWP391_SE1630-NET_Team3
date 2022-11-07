/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Account;
import java.util.List;

/**
 *
 * @author admin
 */
public interface AccountDAO {
    public List<Account> getListAccount(String sort, String gender, String role, String search);
    public Account getAccByEmail(String email);
    public void addAccount(String email, String phone, String fullname, String username, String password);

    public void updateAccountRole(String email, String role);
    public void ChangePass(String email, String password);
    public void UpdateInfo(String email, String phone, String fullname, String user, String address);

}
