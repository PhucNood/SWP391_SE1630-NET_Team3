/*ShowCartController
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022/10/30      1.0                 NamVH           First Implement
 */

package controller;

import dao.BrandDAO;
import dao.ProductDAO;
import dao.impl.BrandDAOImpl;
import dao.impl.ProductDAOImpl;
import entity.Brand;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
 *show cart to checkout
 * @author admin
 */
public class ShowCartController extends HttpServlet {
   

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
            HttpSession session = request.getSession();
            session.setAttribute("inPage", "cart");
            ProductDAO ProductDAO = new ProductDAOImpl();
            List<Product> listProduct = new ArrayList<>();
            BrandDAO BrandDAO = new BrandDAOImpl();
            //get brand list
            List<Brand> listBrand = BrandDAO.getAllBrand();
            request.setAttribute("listB", listBrand);
            String categoryID = null, brandID = null, filterID = null, sortID = null;
            //if request of category not null then remove filter
            if ((String) request.getParameter("categoryID") != null) {
                categoryID = (String) request.getParameter("categoryID");
                session.removeAttribute("doSearch");
                session.removeAttribute("text");
                session.removeAttribute("brandID");
                session.removeAttribute("filterID");
                session.removeAttribute("sortID");
            } else {
                if (session.getAttribute("categoryID") != null) {
                    categoryID = (String) session.getAttribute("categoryID");
                } else {
                    categoryID = "0";
                }
            }   //get filter in session,if null then set default
            if (session.getAttribute("brandID") != null) {
                brandID = (String) session.getAttribute("brandID");
            } else {
                brandID = "0";
            }
            if (session.getAttribute("filterID") != null) {
                filterID = (String) session.getAttribute("filterID");
            } else {
                filterID = "0";
            }
            if (session.getAttribute("sortID") != null) {
                sortID = (String) session.getAttribute("sortID");
            } else {
                sortID = "0";
            }   //get filter in new request
            if (request.getParameter("brandID") != null) {
                brandID = request.getParameter("brandID");
            }
            if (request.getParameter("filterID") != null) {
                filterID = request.getParameter("filterID");
            }
            if (request.getParameter("sortID") != null) {
                sortID = request.getParameter("sortID");
            }
            //get product list with filter
            listProduct = ProductDAO.getProduct(categoryID, brandID, filterID, sortID);
            
            
            
            ProductDAO d = new ProductDAOImpl();
            List<Product> list = d.getProduct("0", "0", "0", "0");
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt, list);
            
            Cart newCart = cart.sortCartByListPoduct(listProduct);
            session.setAttribute("categoryID", categoryID);
            session.setAttribute("brandID", brandID);
            session.setAttribute("filterID", filterID);
            session.setAttribute("sortID", sortID);
            request.setAttribute("cart", newCart);
            request.getRequestDispatcher("view/cart.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ShowCartController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    } 


}
