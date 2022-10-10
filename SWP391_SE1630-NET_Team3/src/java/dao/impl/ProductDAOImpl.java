/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.ProductDAO;
import entity.Image;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.catalina.connector.Connector;

/**
 *
 * @author 84923
 */
public class ProductDAOImpl extends DBContext implements ProductDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Get All Product in DataBase
    @Override
    public List<Product> getAllProduct() {
        List<Product> listProduct = new ArrayList<>();
        List<Image> listImg = new ArrayList<>();
        ImageDAOImpl ImageDAO = new ImageDAOImpl();
        String sql = "SELECT [productID]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[size]\n"
                + "      ,[categoryID]\n"
                + "      ,[brandID]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[sale]\n"
                + "      ,[created_at]\n"
                + "      ,[update_at]\n"
                + "  FROM [dbo].[product]";

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listImg = ImageDAO.getListByIdProduct(rs.getInt("productID"));
                Product product = new Product(rs.getInt("productID"),
                        rs.getString("name"), rs.getString("description"), rs.getString("size"), rs.getInt("categoryID"),
                        rs.getInt("brandID"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getInt("sale"), rs.getString("created_at"), rs.getString("update_at"), listImg);
                listProduct.add(product);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listProduct;
    }

    //Get list product base: category, brand, filter, sort type
    @Override
    public List<Product> getProduct(String categoryID, String brandID, String filterID, String sortID) {
        List<Product> listProduct = new ArrayList<>();
        List<Image> listImg = new ArrayList<>();
        ImageDAOImpl ImageDAO = new ImageDAOImpl();
        String sql = "select * from Product where 1=1";
        //get category
        if (!categoryID.equals("0")) {
            sql += " and categoryID = " + categoryID;
        }
        //get brand
        if (!brandID.equals("0")) {
            sql += " and brandID = " + brandID;
        }
        //get filter
        if (!filterID.equals("0")) {
            sql += " and price*(100-sale)/100 ";
            switch (filterID) {
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
        //get sort type
        if (!sortID.equals("0")) {
            switch (sortID) {
                case "1":
                    sql += " order by (price*(100-sale)/100) DESC";
                    break;
                case "2":
                    sql += " order by (price*(100-sale)/100) ASC";
                    break;
                case "3":
                    sql += " order by sale DESC";
                    break;
                default:
                    break;
            }
        }

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listImg = ImageDAO.getListByIdProduct(rs.getInt(1));
                Product product = new Product(rs.getInt("productID"),
                        rs.getString("name"), rs.getString("description"), rs.getString("size"), rs.getInt("categoryID"),
                        rs.getInt("brandID"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getInt("sale"), rs.getString("created_at"), rs.getString("update_at"), listImg);
                listProduct.add(product);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listProduct;
    }

    //get list product after search by text
    @Override
    public List<Product> searchListProduct(String text) {
        List<Product> listProduct = new ArrayList<>();
        List<Image> listImg = new ArrayList<>();
        ImageDAOImpl ImageDAO = new ImageDAOImpl();
        String sql = "select * from Product p inner join brand b on p.brandID = b.brandID\n"
                + "			inner join category c on p.categoryID = c.categoryID\n"
                + "where 1=1\n"
                + " and (p.name like '%" + text + "%' or b.title like '%" + text + "%' or c.title like '%" + text + "%')";
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listImg = ImageDAO.getListByIdProduct(rs.getInt(1));
                Product product = new Product(rs.getInt("productID"),
                        rs.getString("name"), rs.getString("description"), rs.getString("size"), rs.getInt("categoryID"),
                        rs.getInt("brandID"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getInt("sale"), rs.getString("created_at"), rs.getString("update_at"), listImg);
                listProduct.add(product);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;

    }

    //get product by productID
    @Override
    public Product getProductById(String productID) {
        List<Image> listImg = new ArrayList<>();
        ImageDAOImpl ImageDAO = new ImageDAOImpl();
        String sql = "select * from Product where productID = " + productID;
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listImg = ImageDAO.getListByIdProduct(rs.getInt(1));
                Product product = new Product(rs.getInt("productID"),
                        rs.getString("name"), rs.getString("description"), rs.getString("size"), rs.getInt("categoryID"),
                        rs.getInt("brandID"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getInt("sale"), rs.getString("created_at"), rs.getString("update_at"), listImg);
                return product;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //get product list In one page
    @Override
    public List<Product> getListByPage(List<Product> listProduct,
            int start, int end) {
        ArrayList<Product> listInPage = new ArrayList<>();
        for (int i = start; i < end; i++) {
            listInPage.add(listProduct.get(i));
        }
        return listInPage;
    }

    //get list product by category
    @Override
    public List<Product> getProductListByCategoryID(int categoryID) {
        List<Product> listProduct = new ArrayList<>();
        List<Image> listImg = new ArrayList<>();
        ImageDAOImpl ImageDAO = new ImageDAOImpl();
        String sql = "select * from Product where categoryID = " + categoryID;
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listImg = ImageDAO.getListByIdProduct(rs.getInt(1));
                Product product = new Product(rs.getInt("productID"),
                        rs.getString("name"), rs.getString("description"), rs.getString("size"), rs.getInt("categoryID"),
                        rs.getInt("brandID"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getInt("sale"), rs.getString("created_at"), rs.getString("update_at"), listImg);
                listProduct.add(product);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

    @Override
    public void deleteProductDetail(String productID) {
        String sql = "DELETE FROM [dbo].[image_product]\n"
                + "       WHERE product_id = " + productID
                + "\nDELETE FROM [dbo].[product]\n"
                + "       WHERE productID = " + productID;

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(String name, String description,
            String size, String categoryID, String brandID,
            String quantity, String price, String sale, String productID) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[size] = ?\n"
                + "      ,[categoryID] = ?\n"
                + "      ,[brandID] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[sale] = ?\n"
                + " WHERE productID = ?";
        
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, size);
            ps.setInt(4, Integer.parseInt(categoryID));
            ps.setInt(5, Integer.parseInt(brandID));
            ps.setInt(6, Integer.parseInt(quantity));
            ps.setFloat(7, Float.parseFloat(price));
            ps.setInt(8, Integer.parseInt(sale));
            ps.setInt(9, Integer.parseInt(productID));
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public static void main(String[] args) {
        ProductDAOImpl d = new ProductDAOImpl();
//        List<Product> listProduct = d.searchListProduct("mit");
//        System.out.println(listProduct.get(1));
//
//        Product p = d.getProductById("1");
//        System.out.println(p.getName());

        d.deleteProductDetail("1");
        //System.out.println(d.getProductById("1"));
    }
}
