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
public class ShopController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
        HttpSession session = request.getSession();
        List<Product> list = new ArrayList<>();
        ProductDAO d = new ProductDAOImpl();
        BrandDAO bd = new BrandDAOImpl();

        List<Brand> listBrand = bd.getAllBrand();
        request.setAttribute("listB", listBrand);
        String categoryID = null, brandID = null, filterID = null, sortID = null;
        session.setAttribute("inPage", "shop");
        if ((String) session.getAttribute("categoryID") != null) {
            categoryID = (String) session.getAttribute("categoryID");
            if (categoryID.equals("0") || categoryID.equals("1") || categoryID.equals("2") || categoryID.equals("3")) {
                session.removeAttribute("doSearch");
                session.removeAttribute("text");
                session.removeAttribute("brandID");
                session.removeAttribute("filterID");
                session.removeAttribute("sortID");
            }
        } else {
            categoryID = "0";
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

        if (request.getParameter("categoryID") != null) {
            categoryID = request.getParameter("categoryID");
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
       
        list = d.getProduct(categoryID, brandID, filterID, sortID);
        if (list.isEmpty()) {
            request.setAttribute("emptyP", "Not found!");
        }


        session.setAttribute("listProduct", list);
        session.setAttribute("categoryID", categoryID);
        session.setAttribute("brandID", brandID);
        session.setAttribute("filterID", filterID);
        session.setAttribute("sortID", sortID);
        request.getRequestDispatcher("view/shop.jsp").forward(request, response);
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
