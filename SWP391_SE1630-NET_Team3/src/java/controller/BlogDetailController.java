/*
 * Copyright(C).
 * Transport and Information Network
 *
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022-10-18      1.0                 LongLH           First Implement
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author stick
 */
public class BlogDetailController extends HttpServlet {

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
        Blog blogDetail = null;
        List<Archive> archiveList = null;

        try {
            String idString = request.getParameter("id");
            if (idString == null || idString.isEmpty()) {
                throw new Exception("Error not found id");
            }
            int id = Integer.parseInt(idString);
            blogDetail = blogDAO.getBlogById(id);
            archiveList = blogDAO.getAllArchive();

            request.setAttribute("blog", blogDetail);
            request.setAttribute("archiveList", archiveList);

            request.getRequestDispatcher("view/blogDetail.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(BlogDetailController.class.getName()).log(Level.SEVERE, null, ex);
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
