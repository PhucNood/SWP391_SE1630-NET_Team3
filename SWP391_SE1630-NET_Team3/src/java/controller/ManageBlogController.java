/*
 * Copyright(C).
 * Transport and Information Network
 *
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022-10-18      1.0                 LongLH           First Implement
 * 
 */
package controller;

import dao.BlogDAO;
import dao.impl.BlogDAOImpl;
import entity.Account;
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
public class ManageBlogController extends HttpServlet {

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
        BlogDAO blogDAO = new BlogDAOImpl();
        List<Blog> blogList = null;
        List<Archive> archiveList = null;
        List<Account> authorList = null;
        try {
            String searchTitle = request.getParameter("searchTitle");
            if (searchTitle == null || searchTitle.isEmpty()) {
                searchTitle = "";
            }
            searchTitle = searchTitle.trim();

            String curPageString = request.getParameter("page");
            int curPage = 1;
            if (curPageString != null && !curPageString.isEmpty()) {
                curPage = Integer.parseInt(curPageString);
            }
            String searchTime = request.getParameter("searchTime");
            int searchMonth;
            int searchYear;

            if (searchTime == null || searchTime.isEmpty() || searchTime.equals("-1")) {
                searchTime = "-1";
                searchMonth = -1;
                searchYear = -1;
            } else {
                searchMonth = Integer.parseInt(searchTime.split("-")[1]);
                searchYear = Integer.parseInt(searchTime.split("-")[0]);
            }
            String idAuthorStr = request.getParameter("searchAuthor");
            int idAuthor;
            if (idAuthorStr == null || idAuthorStr.isEmpty()) {
                idAuthor = -1;
            } else {
                idAuthor = Integer.parseInt(idAuthorStr);
            }

            blogList = blogDAO.searchBlogPage(searchTitle, searchMonth, searchYear, idAuthor, 5, curPage);
            int totalPage = blogDAO.getTotalSearchPage(searchTitle, searchMonth, searchYear, idAuthor, 5);
            archiveList = blogDAO.getAllArchive();
            authorList = blogDAO.getAllAuthor();

            request.setAttribute("blogList", blogList);
            request.setAttribute("archiveList", archiveList);
            request.setAttribute("authorList", authorList);
            request.setAttribute("curPage", curPage);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("searchTitle", searchTitle);
            request.setAttribute("searchTime", searchTime);
            request.setAttribute("searchAuthorId", idAuthor);

            request.setAttribute("inPage", "manage");
            HttpSession session = request.getSession();
            session.setAttribute("inPage", "manage");
            if(session.getAttribute("messsucc")!=null){
                request.setAttribute("messsucc", session.getAttribute("messsucc"));
            }
            request.getRequestDispatcher("view/manageBlogList.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogListController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);

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
