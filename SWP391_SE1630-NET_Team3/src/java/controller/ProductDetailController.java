/*ProductDetailController
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022/10/30      1.0                 NamVH           First Implement
 */

package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.impl.CategoryDAOImpl;
import dao.impl.ProductDAOImpl;
import entity.Category;
import entity.Image;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *get information of product to display detail in new page
 * @author admin
 */
public class ProductDetailController extends HttpServlet {
   
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
            String productID = request.getParameter("productID");
            ProductDAO ProductDAO = new ProductDAOImpl();
            //get product by productID
            Product product = ProductDAO.getProductById(productID);
            //get Image List of product
            List<Image> listImg = product.getList();
            
            CategoryDAO CategoryDAO = new CategoryDAOImpl();
            //get category of product
            Category category = CategoryDAO.getCategoryById(product.getCategoryID());
            //get product list of category
            List<Product> listProductInCategory = ProductDAO.getProductListByCategoryID(product.getCategoryID());
            //remove product in product list of category
            for(Product item : listProductInCategory){
                if(item.getProductID() == product.getProductID()){
                    listProductInCategory.remove(item);
                    break;
                }
            }
            request.setAttribute("listProduct", listProductInCategory);
            request.setAttribute("category", category);
            request.setAttribute("listImg", listImg);
            request.setAttribute("product", product);
            request.getRequestDispatcher("view/productDetail.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDetailController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    } 
}
