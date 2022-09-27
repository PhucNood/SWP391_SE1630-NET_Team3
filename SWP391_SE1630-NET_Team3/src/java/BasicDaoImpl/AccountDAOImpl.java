/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class AccountDAO extends DBContext{
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
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getInt(3), 
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), rs.getString(12));
                list.add(a);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        AccountDAO d = new AccountDAO();
        List<Account> list = d.getListAccount();
        System.out.println(list.get(1).getFullname());
    }
}
