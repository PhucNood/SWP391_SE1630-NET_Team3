/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BasicDaoImpl;

import entity.Image;
import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84923
 */
public class ProductDaoImpl extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        List<Image> listImg = new ArrayList<>();
        ImageDaoImpl d = new ImageDaoImpl();
        String sql = "Select * from product";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listImg = d.getListByIdProduct(rs.getInt(1));
                Product c = new Product(rs.getInt(1),
                        rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
                        rs.getInt(6), rs.getInt(7), rs.getDouble(8),
                        rs.getInt(9), rs.getString(10), rs.getString(11), listImg);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
//
//    public List<Product> getListProductByCateId(String id){
//        List<Product> list = new ArrayList<>();
//        List<Image> listImg = new ArrayList<>();
//        ImageDaoImpl d = new ImageDaoImpl();
//        String sql = "Select * from product where categoryID ="+id;
//
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                listImg = d.getListByIdProduct(rs.getInt(1));
//                Product c = new Product(rs.getInt(1),
//                        rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
//                        rs.getInt(6), rs.getInt(7), rs.getDouble(8),
//                        rs.getInt(9), rs.getString(10), rs.getString(11), listImg);
//                list.add(c);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }

    public List<Product> getProduct(String cid, String bid, String fid, String sid) {
        List<Product> list = new ArrayList<>();
        List<Image> listImg = new ArrayList<>();
        ImageDaoImpl d = new ImageDaoImpl();
        String sql = "select * from Product where 1=1";
        if (!cid.equals("0")) {
            sql += " and categoryID = " + cid;
            if (!bid.equals("0")) {
                sql += " and brandID = " + bid;
            }
        }

        if (!fid.equals("0")) {
            sql += " and price ";
            switch (fid) {
                case "1":
                    sql += "between 0 and 5000";
                    break;
                case "2":
                    sql += "between 5000 and 10000";
                    break;
                case "3":
                    sql += "between 10000 and 100000";
                    break;
                case "4":
                    sql += "> 100000";
                    break;
            }
        }
        if (!sid.equals("0")) {
            if (sid.equals("1")) {
                sql += " order by price DESC";
            } else if (sid.equals("2")) {
                sql += " order by price ASC";
            } else if (sid.equals("3")) {
                sql += " order by sale DESC";
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listImg = d.getListByIdProduct(rs.getInt(1));
                Product c = new Product(rs.getInt(1),
                        rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
                        rs.getInt(6), rs.getInt(7), rs.getDouble(8),
                        rs.getInt(9), rs.getString(10), rs.getString(11), listImg);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDaoImpl d = new ProductDaoImpl();
//        List<Product> list = d.getListProductByCateId("1");
//        System.out.println(list.get(1).getList().get(0).getImgSource());
    }
}
