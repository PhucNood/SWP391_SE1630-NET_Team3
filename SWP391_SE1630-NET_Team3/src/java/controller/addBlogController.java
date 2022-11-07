/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ImageDAO;
import dao.Image_BlogDAO;
import dao.impl.BlogDAOImpl;
import dao.impl.ImageDAOImpl;
import dao.impl.Image_BlogDAOImpl;
import entity.Account;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author stick
 */
public class addBlogController extends HttpServlet {

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
        try {
            dao.BlogDAO blogDAO = new BlogDAOImpl();
            List<Account> authorList = blogDAO.getAllAuthor();
            request.setAttribute("authorList", authorList);

            HttpSession session = request.getSession();
            session.setAttribute("inPage", "manage");

            request.getRequestDispatcher("view/createBlog.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(addBlogController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method. save new blog to database
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            dao.BlogDAO blogDAO;
            List<Account> authorList = new ArrayList<>();
            blogDAO = new BlogDAOImpl();
            authorList = blogDAO.getAllAuthor();

            String blogTitle = request.getParameter("blogTitle");
            String description = request.getParameter("description");
            String author = request.getParameter("author");
            String img = request.getParameter("imgFile");

            
            ImageDAO ImageDAO = new ImageDAOImpl();
            ImageDAO.addImage("", img);
            String imageId = ImageDAO.getImageID(img);
            blogDAO.addBlog(blogTitle, Integer.parseInt(author), description);
            String BlogId = blogDAO.getNewBlogId();
            Image_BlogDAO Image_BlogDAO = new Image_BlogDAOImpl();
            Image_BlogDAO.addImage_Blog(imageId, BlogId);

            request.setAttribute("messsucc", "Add Blog Success!");
            request.setAttribute("authorList", authorList);
            HttpSession session = request.getSession();
            session.setAttribute("inPage", "manage");
            request.getRequestDispatcher("view/createBlog.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(addBlogController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException ex) {
            Logger.getLogger(addBlogController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(addBlogController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
