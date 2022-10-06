/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.AccountDAO;
import entity.Account;
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
public class AccountDAOImpl extends DBContext implements AccountDAO{

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    public List<Account> getListAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[full_name]\n"
                + "      ,[gender]\n"
                + "      ,[password]\n"
                + "      ,[user]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[image_id]\n"
                + "      ,[address]\n"
                + "      ,[role]\n"
                + "      ,[create_at]\n"
                + "      ,[updated_at]\n"
                + "  FROM [dbo].[account]";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("full_name"), rs.getInt("gender"),
                        rs.getString("password"), rs.getString("user"), rs.getString("email"), rs.getString("phone"),
                        rs.getInt("image_id"), rs.getString("address"), rs.getInt("role"), rs.getString("create_at"), rs.getString("updated_at"));
                list.add(a);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Account getAccByEmail(String email) {
        String sql = "SELECT [id]\n"
                + "      ,[full_name]\n"
                + "      ,[gender]\n"
                + "      ,[password]\n"
                + "      ,[user]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[image_id]\n"
                + "      ,[address]\n"
                + "      ,[role]\n"
                + "      ,[create_at]\n"
                + "      ,[updated_at]\n"
                + "  FROM [dbo].[account]"
                + "  Where email = ?";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("full_name"), rs.getInt("gender"),
                        rs.getString("password"), rs.getString("user"), rs.getString("email"), rs.getString("phone"),
                        rs.getInt("image_id"), rs.getString("address"), rs.getInt("role"), rs.getString("create_at"), rs.getString("updated_at"));
                return a;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public void addAccount(String email, String phone, String fullname, String username, String password) {
        String sql = "INSERT INTO [dbo].[account]\n"
                + "           ([full_name]\n"
                + "           ,[password]\n"
                + "           ,[user]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           , ?\n"
                + "           , ?\n"
                + "           , ?\n"
                + "           , ?\n"
                + "           ,3)";

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, password);
            ps.setString(3, username);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        AccountDAOImpl d = new AccountDAOImpl();
        List<Account> list = d.getListAccount();
        Account a = d.getAccByEmail("quochung123@gmail.com");
        System.out.println(a.getPass());
        System.out.println(list.get(1).getFullname());
    }
}
