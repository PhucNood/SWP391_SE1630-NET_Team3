/*SearchInManageController
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
 *used to search product by name, brand, categories follow to request of admin
 * @author admin
 */
public class SearchInManageController extends HttpServlet {

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
            String text = "";
            //if have request search then remove filter to get all search list
            if(request.getParameter("text")!= null){
                text = request.getParameter("text");
                request.setAttribute("textSearch", text);
                session.setAttribute("doSearch", "1");
                session.removeAttribute("brandID");
                session.removeAttribute("filterID");
                session.removeAttribute("sortID");
            }
            else {
                text = (String) session.getAttribute("text");
            }   ProductDAO ProductDAO = new ProductDAOImpl();
            //get all product list after search
            List<Product> sList = ProductDAO.searchListProduct(text);
            List<Product> list = new ArrayList<>();
            BrandDAO BrandDAO = new BrandDAOImpl();
            //get all brand list
            List<Brand> listBrand = BrandDAO.getAllBrand();
            request.setAttribute("listB", listBrand);
            String categoryID = null, brandID = null, filterID = null, sortID = null;
            session.setAttribute("inPage", "manageProduct");
            categoryID = "0";
            //get filter in session
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
            }   //creat list to add general product from listProductByFilter and listProductBySearch
            List<Product> newList = new ArrayList<>();
            //get all product with filter
            list = ProductDAO.getProduct(categoryID, brandID, filterID, sortID);
            if (list.isEmpty()) {
                request.setAttribute("emptyP", "Not found!");
            } else {
                for (Product item : list) {
                    if(checkInSearchList(item, sList)) newList.add(item);
                }
            }   //PAGING
            int size = newList.size();
            int page, numberpage = 5;
            int number = (size % numberpage == 0 ? (size / numberpage) : ((size / numberpage) + 1));
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }   int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Product> listProductInPage = ProductDAO.getListByPage(newList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", number);
            session.setAttribute("productList", listProductInPage);
            session.removeAttribute("categoryID");
            session.setAttribute("text", text);
            session.setAttribute("brandID", brandID);
            session.setAttribute("filterID", filterID);
            session.setAttribute("sortID", sortID);
            request.getRequestDispatcher("view/manageProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SearchInManageController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    } 
    
    public boolean checkInSearchList(Product item, List<Product> sList) {
        for (Product p : sList) {
            if (item.getProductID() == p.getProductID()) {
                return true;
            }
        }
        return false;
    }
}
