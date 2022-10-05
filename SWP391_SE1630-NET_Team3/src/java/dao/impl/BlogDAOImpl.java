/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import dao.NewInterface;
import entity.Blog;
import entity.Image;
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
 * @author stick
 */
public class BlogDAOImpl extends DBContext implements NewInterface{

    // <editor-fold defaultstate="collapsed" desc="simple get blog arraylist and get image of an blog">
    public List<Blog> searchBlogPage(String searchTitle, int month, int year, int numPerPage, int curPage) throws SQLException {
        List<Blog> list = new ArrayList<>();
        String searchMonth = "";
        String searchYear = "";
        if (month != -1) {
            searchMonth = " AND MONTH(b.created_at)=" + month;
        }
        if (year != -1) {
            searchYear = " AND YEAR(b.created_at)=" + year;
        }
        String sql = "SELECT * FROM (\n"
                + "SELECT ROW_NUMBER() OVER(order by b.id) AS rownum\n"
                + ", b.id, b.author_id, a.full_name, b.title, b.content, b.count_view, b.created_at, b.update_at \n"
                + "FROM blog b \n"
                + "INNER JOIN account a ON a.id = b.author_id\n"
                + "WHERE b.title like ? \n"
                + searchMonth + searchYear + ") sub\n"
                + "WHERE sub.rownum >= ? AND sub.rownum <= ?";
        Connection conn;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int startItem = numPerPage * (curPage - 1) + 1;
        int endItem = startItem + numPerPage - 1;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTitle + "%");
            ps.setInt(2, startItem);
            ps.setInt(3, endItem);
            rs = ps.executeQuery();

            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setIdAuthor(rs.getInt("author_id"));
                b.setAuthorName(rs.getNString("full_name"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getNString("content"));
                b.setCreateAt(rs.getString("created_at"));
                b.setUpdateAt(rs.getString("update_at"));
                b.setListImg(getBlogImage(b.getId()));

                list.add(b);
            }
        } catch (SQLException e) {

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            rs.close();
            ps.close();
        }
        return list;
    }

    public int getTotalSearchPage(String searchTitle, int month, int year, int numPerPage) throws SQLException {
        String searchMonth = "";
        String searchYear = "";
        if (month != -1) {
            searchMonth = " AND MONTH(b.created_at)=" + month;
        }
        if (year != -1) {
            searchYear = " AND YEAR(b.created_at)=" + year;
        }
        String sql = "SELECT COUNT(b.id)as'total' FROM blog b WHERE b.title like ? " + searchMonth + searchYear;
        Connection conn;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalPage = 0;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTitle + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalPage = rs.getInt("total") / numPerPage;
                if (rs.getInt("total") % numPerPage != 0) {
                    totalPage++;
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalPage;
    }

    public List<Image> getBlogImage(int blogId) throws SQLException {
        List<Image> list = new ArrayList<>();
        String sql = "SELECT blog_id,image_id,i.* \n"
                + "FROM image_blog ib\n"
                + "INNER JOIN [image] i ON ib.image_id = i.id\n"
                + "WHERE blog_id = ?";
        Connection conn;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
             ps = conn.prepareStatement(sql);
            ps.setInt(1, blogId);
             rs = ps.executeQuery();
            while (rs.next()) {
                Image img = new Image();
                img.setId(rs.getInt("image_id"));
                img.setImgSource(rs.getString("imageSource"));
                img.setName(rs.getString("name"));
                list.add(img);
            }
        } catch (SQLException e) {
            throw e;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            rs.close();
            ps.close();
        }
        return list;
    }
    //</editor-fold> 

//    public static void main(String[] args) {
//        try {
//            BlogDAOImpl dao = new BlogDAOImpl();
//            List<Blog> blist = dao.searchBlogPage("t",10,2022, 3, 1);
//            for (Blog b : blist) {
//                System.out.println("-------");
//                System.out.println(b.getTitle()+"\n"+b.getContent()+"\n"+b.getCreateAt());
//                for (Image i : b.getListImg()) {
//                    System.out.println(i.getId() + " | " + i.getImgSource() + " | " + i.getName());
//                }
//            }
//            System.out.println("total page:"+dao.getTotalSearchPage("t",-1,-1, 10));
//        } catch (SQLException ex) {
//            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}