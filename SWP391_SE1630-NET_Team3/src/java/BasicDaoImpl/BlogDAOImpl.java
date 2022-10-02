/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BasicDaoImpl;

import entity.Blog;
import entity.Brand;
import entity.Image;
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
public class BlogDAOImpl extends DBContext {

    // <editor-fold defaultstate="collapsed" desc="simple get blog arraylist and get image of an blog">
    public List<Blog> getBlogList() throws SQLException {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT b.id,b.author_id,b.title,b.content,b.created_at,b.update_at \n"
                + "FROM blog b";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        try {

            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setIdAuthor(rs.getInt("author_id"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getNString("content"));
                b.setCreateAt(rs.getString("created_at"));
                b.setUpdateAt(rs.getString("update_at"));
                b.setListImg(getBlogImage(b.getId()));

                list.add(b);
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            rs.close();
            ps.close();
        }
        return list;
    }

    public List<Image> getBlogImage(int blogId) throws SQLException {
        List<Image> list = new ArrayList<>();
        String sql = "SELECT blog_id,image_id,i.* \n"
                + "FROM image_blog ib\n"
                + "INNER JOIN [image] i ON ib.image_id = i.id\n"
                + "WHERE blog_id = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, blogId);
        ResultSet rs = ps.executeQuery();
        try {

            while (rs.next()) {
                Image img = new Image();
                img.setId(rs.getInt("image_id"));
                img.setImgSource(rs.getString("imageSource"));
                img.setName(rs.getString("name"));
                list.add(img);
            }
        } catch (SQLException e) {
            throw e;
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
//            List<Image> imList = dao.getBlogImage(1);
//            List<Blog> blist = dao.getBlogList();
//            for (Blog b : blist) {
//                System.out.println("---");
//                System.out.println(b.getTitle()+"\n"+b.getContent()+"\n"+b.getUpdateAt());
//                for (Image i : b.getListImg()) {
//                    System.out.println(i.getId() + " | " + i.getImgSource() + " | " + i.getName());
//                }
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
