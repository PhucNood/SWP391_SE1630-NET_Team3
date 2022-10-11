/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import entity.Archive;
import entity.Blog;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author stick
 */
public interface BlogDAO {

    public List<Blog> searchBlogPage(String searchTitle, int month, int year, int numPerPage, int curPage) throws SQLException, ClassNotFoundException;

    public int getTotalSearchPage(String searchTitle, int month, int year, int numPerPage) throws SQLException, ClassNotFoundException;

    public Blog getBlogById(int id) throws SQLException, ClassNotFoundException;

    public List<Archive> getAllArchive() throws SQLException, ClassNotFoundException;

}
