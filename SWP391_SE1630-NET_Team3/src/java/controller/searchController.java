/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import BasicDaoImpl.BrandDaoImpl;
import BasicDaoImpl.ProductDaoImpl;
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
public class searchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        String text = "";
        if(request.getParameter("text")!= null){
            text = request.getParameter("text");
            session.setAttribute("doSearch", "1");
            session.removeAttribute("bid");
            session.removeAttribute("fid");
            session.removeAttribute("sid");
        }
        else {
            text = (String) session.getAttribute("text");
        }
        ProductDaoImpl d = new ProductDaoImpl();
        List<Product> sList = d.searchListProduct(text);
        List<Product> list = new ArrayList<>();
        BrandDaoImpl bd = new BrandDaoImpl();

        List<Brand> listBrand = bd.getAllBrand();
        request.setAttribute("listB", listBrand);
        String cid = null, bid = null, fid = null, sid = null;
        session.setAttribute("inPage", "shop");
        cid = "0";
        if (session.getAttribute("bid") != null) {
            bid = (String) session.getAttribute("bid");
        } else {
            bid = "0";
        }
        if (session.getAttribute("fid") != null) {
            fid = (String) session.getAttribute("fid");
        } else {
            fid = "0";
        }
        if (session.getAttribute("sid") != null) {
            sid = (String) session.getAttribute("sid");
        } else {
            sid = "0";
        }

        if (request.getParameter("bid") != null) {
            bid = request.getParameter("bid");
        }
        if (request.getParameter("fid") != null) {
            fid = request.getParameter("fid");
        }
        if (request.getParameter("sid") != null) {
            sid = request.getParameter("sid");
        }
        List<Product> newList = new ArrayList<>();
        list = d.getProduct(cid, bid, fid, sid);
        if (list.isEmpty()) {
            request.setAttribute("emptyP", "Not found!");
        } else {
            for (Product item : list) {
                if(checkInSearchList(item, sList)) newList.add(item);
            }
        }
        
        session.setAttribute("listProduct", newList);
        session.removeAttribute("cid");
        session.setAttribute("text", text);
        session.setAttribute("bid", bid);
        session.setAttribute("fid", fid);
        session.setAttribute("sid", sid);
        
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
        processRequest(request, response);

    }

    public boolean checkInSearchList(Product item, List<Product> sList) {
        for (Product p : sList) {
            if (item.getProductID() == p.getProductID()) {
                return true;
            }
        }
        return false;
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
