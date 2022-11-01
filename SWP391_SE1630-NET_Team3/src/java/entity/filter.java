/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class filter {
    int roleID ;
    List<String> listURL;

    public filter(int roleID, List<String> listURL) {
        this.roleID = roleID;
        this.listURL = listURL;
    }

    public filter() {
        listURL = new ArrayList<>();
    }

    
    
    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public List<String> getListURL() {
        return listURL;
    }

    public void setListURL(List<String> listURL) {
        this.listURL = listURL;
    }
    
    
}
