/*
 * Copyright(C).
 * Transport and Information Network
 *
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022-10-18      1.0                 LongLH           First Implement
 */
package dao.impl;

import dao.BlogDAO;
import entity.Account;
import entity.Archive;
import entity.Blog;
import entity.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *  preform method create update delete select blog in the database
 * @author stick
 */
public class BlogDAOImpl extends DBContext implements BlogDAO {

    // <editor-fold defaultstate="collapsed" desc="simple get blog arraylist and get image of an blog">
    /**
     *
     * @param searchTitle
     * @param month
     * @param year
     * @param authorId
     * @param numPerPage
     * @param curPage
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    @Override
    public List<Blog> searchBlogPage(String searchTitle, int month, int year, int authorId, int numPerPage, int curPage) throws SQLException, ClassNotFoundException {
        List<Blog> list = new ArrayList<>();
        String searchMonth = "";
        String searchYear = "";
        String searchAuthor = "";

        if (month != -1) {
            searchMonth = " AND MONTH(b.created_at)=" + month;
        }
        if (year != -1) {
            searchYear = " AND YEAR(b.created_at)=" + year;
        }
        if (authorId != -1) {
            searchAuthor = " AND b.author_id=" + authorId;
        }
        String sql = "SELECT * FROM (\n"
                + "SELECT ROW_NUMBER() OVER(order by b.id) AS rownum\n"
                + ", b.id, b.author_id, a.full_name, b.title, b.content, b.count_view, b.created_at, b.update_at \n"
                + "FROM blog b \n"
                + "INNER JOIN account a ON a.id = b.author_id\n"
                + "WHERE b.title like ? \n"
                + searchMonth + searchYear + searchAuthor + ") sub\n"
                + "WHERE sub.rownum >= ? AND sub.rownum <= ?";
        Connection conn = null;
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
        } catch (SQLException | ClassNotFoundException ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
        return list;
    }

    /**
     *
     * @param searchTitle
     * @param month
     * @param year
     * @param authorId
     * @param numPerPage
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    @Override
    public int getTotalSearchPage(String searchTitle, int month, int year, int authorId, int numPerPage) throws SQLException, ClassNotFoundException {
        String searchMonth = "";
        String searchYear = "";
        String searchAuthor = "";

        if (month != -1) {
            searchMonth = " AND MONTH(b.created_at)=" + month;
        }
        if (year != -1) {
            searchYear = " AND YEAR(b.created_at)=" + year;
        }
        if (authorId != -1) {
            searchAuthor = " AND b.author_id=" + authorId;
        }
        String sql = "SELECT COUNT(b.id)as'total' FROM blog b WHERE b.title like ? " + searchMonth + searchYear + searchAuthor;
        Connection conn = null;
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
        return totalPage;
    }

    /**
     *
     * @return @throws SQLException
     * @throws ClassNotFoundException
     */
    @Override
    public List<Archive> getAllArchive() throws SQLException, ClassNotFoundException {
        List<Archive> resultList = new ArrayList<>();

        String sql = " SELECT COUNT(b.id)as'total', "
                + " MONTH(b.created_at) AS month_created, "
                + " YEAR(b.created_at) AS year_created, "
                + " FORMAT(b.created_at, 'MMM yyyy') AS sqlDate "
                + " FROM blog b "
                + " GROUP BY MONTH(b.created_at),YEAR(b.created_at), FORMAT(b.created_at, 'MMM yyyy')";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Archive a = new Archive();
                a.setMonthYear(rs.getString("sqlDate"));
                a.setSearchValue(rs.getString("year_created") + "-" + rs.getString("month_created"));
                a.setTotalBlog(rs.getInt("total"));
                resultList.add(a);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
        return resultList;
    }

    /**
     *
     * @return @throws SQLException
     * @throws ClassNotFoundException
     */
    @Override
    public List<Account> getAllAuthor() throws SQLException, ClassNotFoundException {
        List<Account> resultList = new ArrayList<>();
        String sql = "SELECT a.id,a.full_name FROM blog b "
                + " INNER JOIN account a ON b.author_id = a.id GROUP BY a.id, a.full_name";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setFullname(rs.getNString("full_name"));
                a.setId(rs.getInt("id"));
                resultList.add(a);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
        return resultList;
    }

    /**
     *
     * @param id
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    @Override
    public Blog getBlogById(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT b.*,a.full_name FROM blog b "
                + " INNER JOIN account a ON a.id = b.author_id "
                + " WHERE b.id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Blog resultBlog = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                resultBlog = new Blog();
                resultBlog.setId(rs.getInt("id"));
                resultBlog.setIdAuthor(rs.getInt("author_id"));
                resultBlog.setAuthorName(rs.getNString("full_name"));
                resultBlog.setTitle(rs.getString("title"));
                resultBlog.setContent(rs.getNString("content"));
                resultBlog.setCreateAt(rs.getString("created_at"));
                resultBlog.setUpdateAt(rs.getString("update_at"));
                resultBlog.setListImg(getBlogImage(id));
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
        return resultBlog;
    }

    /**
     *
     * @param blogId
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    @Override
    public List<Image> getBlogImage(int blogId) throws SQLException, ClassNotFoundException {
        List<Image> list = new ArrayList<>();
        String sql = "SELECT blog_id,image_id,i.* "
                + " FROM image_blog ib "
                + " INNER JOIN [image] i ON ib.image_id = i.id "
                + " WHERE blog_id = ? ";
        Connection conn = null;
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
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
        return list;
    }
    /**
     * 
     * @param title
     * @param author
     * @param content
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    @Override
    public void addBlog(String title, int author, String content) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO [dbo].[blog]"
                + "           ([author_id]"
                + "           ,[title]"
                + "           ,[content]"
                + "           ,[count_view]"
                + "           ,[created_at]"
                + "           ,[update_at])"
                + "     VALUES"
                + "           (?"
                + "           ,?"
                + "           ,?"
                + "           ,0"
                + "           ,?"
                + "           ,null)";
        LocalDate now = LocalDate.now();
        String date = now.toString();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, author);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setString(4, date);
            ps.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
    }
    /**
     * 
     * @param id
     * @param title
     * @param author
     * @param content
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    @Override
    public void updateBlog(String id, String title, int author, String content) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE [dbo].[blog]"
                + "   SET [author_id] = ?"
                + "      ,[title] = ?"
                + "      ,[content] = ?"
                + "      ,[update_at] = ?"
                + " WHERE id = ?";
        LocalDate now = LocalDate.now();
        String date = now.toString();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, author);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setString(4, date);
            ps.setString(5, id);
            ps.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
    }
    /**
     * 
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    @Override
    public String getNewBlogId() throws SQLException, ClassNotFoundException {
        String sql = "SELECT TOP 1 [id]"
                + "  FROM [dbo].[blog]"
                + "  ORDER BY id DESC";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                String id = rs.getString("id");
                return id;
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
        return "";
    }
    /**
     * 
     * @param blogID
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    @Override
    public void deleteBlog(String blogID) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM [image_blog] "
                + " WHERE blog_id = " + blogID
                + " DELETE FROM [dbo].[blog]"
                + "      WHERE id = " + blogID;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePrepareState(ps);
            closeConnection(conn);
        }
    }

    //</editor-fold> 
    public static void main(String[] args) {
        try {
            BlogDAOImpl dao = new BlogDAOImpl();
            dao.deleteBlog("2");
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BlogDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
