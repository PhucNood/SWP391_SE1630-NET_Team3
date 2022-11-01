/*ShopController
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
import entity.Product;
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
 *get list product follow to filter of user and display them 
 * paging for list product
 * @author admin
 */
public class ShopController extends HttpServlet {

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
            HttpSession session = request.getSession();
            List<Product> listProduct = new ArrayList<>();
            ProductDAO ProductDAO = new ProductDAOImpl();
            BrandDAO BrandDAO = new BrandDAOImpl();
            //get all brand list
            List<Brand> listBrand = BrandDAO.getAllBrand();
            request.setAttribute("listB", listBrand);
            String categoryID = null;
            String brandID = null;
            String filterID = null;
            String sortID = null;
            session.setAttribute("inPage", "shop");
            //if have request search then remove filter
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
                }else categoryID = "0";
            }   //get filter in session
            if (session.getAttribute("brandID") != null) {
                brandID = (String) session.getAttribute("brandID");
            } else {
                brandID = "0";
            }   if (session.getAttribute("filterID") != null) {
                filterID = (String) session.getAttribute("filterID");
            } else {
                filterID = "0";
            }   if (session.getAttribute("sortID") != null) {
                sortID = (String) session.getAttribute("sortID");
            } else {
                sortID = "0";
            }   //get filter in new request
            if (request.getParameter("brandID") != null) {
                brandID = request.getParameter("brandID");
            }   if (request.getParameter("filterID") != null) {
                filterID = request.getParameter("filterID");
            }   if (request.getParameter("sortID") != null) {
                sortID = request.getParameter("sortID");
            }   //get all product with filter
            listProduct = ProductDAO.getProduct(categoryID, brandID, filterID, sortID);
            if (listProduct.isEmpty()) {
                request.setAttribute("emptyP", "Not found!");
            }   //PAGING
            int size = listProduct.size();
            int page, numberpage = 8;
            int number = (size % numberpage == 0 ? (size / numberpage) : ((size / numberpage) + 1));
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }   int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Product> listProductInPage = ProductDAO.getListByPage(listProduct, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", number);
            session.setAttribute("listProduct", listProductInPage);
            session.setAttribute("categoryID", categoryID);
            session.setAttribute("brandID", brandID);
            session.setAttribute("filterID", filterID);
            session.setAttribute("sortID", sortID);
            
            
            
            request.getRequestDispatcher("view/shop.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    }
}
