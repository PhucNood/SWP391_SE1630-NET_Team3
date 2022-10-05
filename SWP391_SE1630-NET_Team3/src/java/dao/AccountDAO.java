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
    public List<Account> getListAccount();
    public Account getAccByEmail(String email);
    public void addAccount(String email, String phone, String fullname, String username, String password);
    
}
