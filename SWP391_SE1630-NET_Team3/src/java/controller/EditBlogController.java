/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BlogDAO;
import dao.ImageDAO;
import dao.Image_BlogDAO;
import dao.impl.BlogDAOImpl;
import dao.impl.ImageDAOImpl;
import dao.impl.Image_BlogDAOImpl;
import entity.Account;
import entity.Blog;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class EditBlogController extends HttpServlet {

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
            List<Account> authorList = new ArrayList<>();
            String blogID = request.getParameter("blogID");
            BlogDAO BlogDAO = new BlogDAOImpl();
            authorList = BlogDAO.getAllAuthor();
            Blog blog = BlogDAO.getBlogById(Integer.parseInt(blogID));
            request.setAttribute("authorList", authorList);
            request.setAttribute("blog", blog);
            request.getRequestDispatcher("view/editBlog.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EditBlogController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            String blogID = request.getParameter("blogID");
            BlogDAO BlogDAO = new BlogDAOImpl();
            Blog blog = BlogDAO.getBlogById(Integer.parseInt(blogID));
            String oldImg = String.valueOf(blog.getListImg().get(0).getId());

            dao.BlogDAO blogDAO;
            List<Account> authorList = new ArrayList<>();
            blogDAO = new BlogDAOImpl();
            authorList = blogDAO.getAllAuthor();

            String blogTitle = request.getParameter("blogTitle");
            String description = request.getParameter("description");
            String author = request.getParameter("author");
            String img = request.getParameter("imgFile");
            if(img!=null){
                img=oldImg;
            }

            ImageDAO ImageDAO = new ImageDAOImpl();
            String imageId = ImageDAO.getImageID(img);
            blogDAO.updateBlog(blogID, blogTitle, Integer.parseInt(author), description);
            Image_BlogDAO Image_BlogDAO = new Image_BlogDAOImpl();
            Image_BlogDAO.deleteImage_Blog( blogID);
            Image_BlogDAO.addImage_Blog(imageId, blogID);

            request.setAttribute("messsucc", "Update Blog Success!");
            request.setAttribute("authorList", authorList);
            HttpSession session = request.getSession();
            session.setAttribute("inPage", "manage");
            request.getRequestDispatcher("view/editBlog.jsp").forward(request, response);

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
