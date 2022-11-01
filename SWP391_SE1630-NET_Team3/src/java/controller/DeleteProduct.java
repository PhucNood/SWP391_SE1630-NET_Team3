/*DeleteProductController
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022/10/30      1.0                 NamVH           First Implement
 */

package controller;

import dao.ProductDAO;
import dao.impl.ProductDAOImpl;
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
 *get ID of product and perform delete link between product and image,
 * after, delete product in database
 * @author admin
 */
public class DeleteProduct extends HttpServlet {
   

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
            //get product id to delete
            String productID = request.getParameter("productID");
            ProductDAO ProductDAO = new ProductDAOImpl();
            //delete product
            ProductDAO.deleteProduct(productID);
            request.setAttribute("messSuccess", "Delete Succesfully");
            HttpSession session = request.getSession();
            session.setAttribute("inPage", "manageProduct");
            //get all product list
            List<Product> productList = ProductDAO.getAllProduct();
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("view/manageProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    } 
}
