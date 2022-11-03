/*
 * Copyright(C).
 * Transport and Information Network
 *
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022-10-18      1.0                 LongLH           First Implement
 */
package dao;

import entity.Account;
import entity.Archive;
import entity.Blog;
import entity.Image;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author stick
 */
public interface BlogDAO {
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
    public List<Blog> searchBlogPage(String searchTitle, int month, int year, int authorId, int numPerPage, int curPage) throws SQLException, ClassNotFoundException;
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
    public int getTotalSearchPage(String searchTitle, int month, int year, int authorId, int numPerPage) throws SQLException, ClassNotFoundException;
    /**
     * 
     * @param id
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public Blog getBlogById(int id) throws SQLException, ClassNotFoundException;
    /**
     * 
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Account> getAllAuthor() throws SQLException, ClassNotFoundException;
    /**
     * 
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Archive> getAllArchive() throws SQLException, ClassNotFoundException;
    /**
     * 
     * @param blogId
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Image> getBlogImage(int blogId) throws SQLException, ClassNotFoundException;
    /**
     * 
     * @param title
     * @param author
     * @param content
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public void addBlog(String title, int author, String content) throws SQLException, ClassNotFoundException;
    /**
     * 
     * @param id
     * @param title
     * @param author
     * @param content
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public void updateBlog(String id, String title, int author, String content) throws SQLException, ClassNotFoundException;
    /**
     * 
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getNewBlogId() throws SQLException, ClassNotFoundException;
    /**
     * 
     * @param blogID
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public void deleteBlog(String blogID) throws SQLException, ClassNotFoundException;
}
