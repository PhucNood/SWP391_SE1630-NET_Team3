/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BlogDAO;
import dao.impl.BlogDAOImpl;
import entity.Archive;
import entity.Blog;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author stick
 */
public class BlogListController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAOImpl blogDAO = new BlogDAOImpl();

        List<Blog> blogList = null;
        List<Archive> archiveList = null;
        try {
            String searchTitle = request.getParameter("searchTitle");
            if (searchTitle == null || searchTitle.isEmpty()) {
                searchTitle = "";
            }
            String curPageString = request.getParameter("page");
            int curPage = 1;
            if (curPageString != null && !curPageString.isEmpty()) {
                curPage = Integer.parseInt(curPageString);
            }
            String searchTime = request.getParameter("searchTime");
            int searchMonth;
            int searchYear;
            if (searchTime == null || searchTime.isEmpty()) {
                searchTime = "";
                searchMonth = -1;
                searchYear = -1;
            } else {
                searchMonth = Integer.parseInt(searchTime.split("-")[1]);
                searchYear = Integer.parseInt(searchTime.split("-")[0]);;

            }
            System.out.println(">" + searchMonth + "|" + searchYear);
            blogList = blogDAO.searchBlogPage(searchTitle, searchMonth, searchYear, 3, curPage);
            int totalPage = blogDAO.getTotalSearchPage(searchTitle, searchMonth, searchYear, 3);
            System.out.println("total page:" + totalPage);

            archiveList = blogDAO.getAllArchive();

            request.setAttribute("blogList", blogList);
            request.setAttribute("archiveList", archiveList);
            request.setAttribute("curPage", curPage);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("searchTitle", searchTitle);
            request.setAttribute("searchTime", searchTime);
            request.setAttribute("inPage", "blogList");
            HttpSession session = request.getSession();
            session.setAttribute("inPage", "blog");
            request.setAttribute(searchTime, this);

            request.getRequestDispatcher("view/blogList.jsp").forward(request, response);
//        response.sendRedirect("view/blog.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogListController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
