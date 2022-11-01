/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ImageDAO;
import dao.Image_ProductDAO;
import dao.ProductDAO;
import dao.impl.BrandDAOImpl;
import dao.impl.CategoryDAOImpl;
import dao.impl.ImageDAOImpl;
import dao.impl.Image_ProductDAOImpl;
import dao.impl.ProductDAOImpl;
import entity.Brand;
import entity.Category;
import entity.Product;
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
 *delete 1 image has been selected of product and 
 * delete link between it and product 
 * @author admin
 */
public class DeleteProductImageController extends HttpServlet {
   
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            //get productID
            String productID = request.getParameter("productID");
            String img = request.getParameter("img");
            ImageDAO ImageDAO = new ImageDAOImpl();
            //get imageID by Image name
            String imageID = ImageDAO.getImageID(img);
            Image_ProductDAO Image_ProductDAO = new Image_ProductDAOImpl();
            //delete connect of product and image
            Image_ProductDAO.deleteImage_Product(imageID, productID);
            ProductDAO ProductDAO = new ProductDAOImpl();
            HttpSession session = request.getSession();
            //get product by id
            Product product = ProductDAO.getProductById(productID);
            
            BrandDAO BrandDAO = new BrandDAOImpl();
            //get all brand list
            List<Brand> listBrand = BrandDAO.getAllBrand();
            session.setAttribute("listBrand", listBrand);
            CategoryDAO CategoryDAO = new CategoryDAOImpl();
            //get alii category list
            List<Category> listCategory = CategoryDAO.getAllCategory();
            session.setAttribute("listCategory",listCategory);
            session.setAttribute("product", product);
            request.getRequestDispatcher("view/editProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DeleteProductImageController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    } 
}
