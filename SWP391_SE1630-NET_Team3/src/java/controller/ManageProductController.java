/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BrandDAO;
import dao.ProductDAO;
import dao.impl.BrandDAOImpl;
import dao.impl.ProductDAOImpl;
import entity.Brand;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ManageProductController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageProductController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageProductController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

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
        
        HttpSession session = request.getSession();
        session.setAttribute("inPage", "manage");
        ProductDAO ProductDAO = new ProductDAOImpl();
        
        
        
        List<Product> listProduct = new ArrayList<>();
        BrandDAO BrandDAO = new BrandDAOImpl();

        List<Brand> listBrand = BrandDAO.getAllBrand();
        request.setAttribute("listB", listBrand);
        String categoryID = null, brandID = null, filterID = null, sortID = null;

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
        }
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
        }
        if (request.getParameter("brandID") != null) {
            brandID = request.getParameter("brandID");
        }
        if (request.getParameter("filterID") != null) {
            filterID = request.getParameter("filterID");
        }
        if (request.getParameter("sortID") != null) {
            sortID = request.getParameter("sortID");
        }

        listProduct = ProductDAO.getProduct(categoryID, brandID, filterID, sortID);
        if (listProduct.isEmpty()) {
            request.setAttribute("emptyP", "Not found!");
        }
        int size = listProduct.size();
        int page, numberpage = 5;
        int number = (size % numberpage == 0 ? (size / numberpage) : ((size / numberpage) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numberpage;
        end = Math.min(page * numberpage, size);
        List<Product> listProductInPage = ProductDAO.getListByPage(listProduct, start, end);
        request.setAttribute("page", page);
        request.setAttribute("num", number);
        
        session.setAttribute("productList", listProductInPage);
        session.setAttribute("categoryID", categoryID);
        session.setAttribute("brandID", brandID);
        session.setAttribute("filterID", filterID);
        session.setAttribute("sortID", sortID);

        request.getRequestDispatcher("view/manageProduct.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
