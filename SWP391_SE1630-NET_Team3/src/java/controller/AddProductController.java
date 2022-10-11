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
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
public class AddProductController extends HttpServlet {
   
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
            out.println("<title>Servlet AddProductController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductController at " + request.getContextPath () + "</h1>");
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
        BrandDAO BrandDAO = new BrandDAOImpl();
        List<Brand> listBrand = BrandDAO.getAllBrand();
        session.setAttribute("listBrand", listBrand);
        CategoryDAO CategoryDAO = new CategoryDAOImpl();
        List<Category> listCategory = CategoryDAO.getAllCategory();
        session.setAttribute("listCategory",listCategory);
        request.getRequestDispatcher("view/addProduct.jsp").forward(request, response);
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
        ProductDAO ProductDAO = new ProductDAOImpl();
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String size = request.getParameter("size");
        String categoryID = request.getParameter("category");
        String brandID = request.getParameter("brand");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String sale = request.getParameter("sale");
        String imgFile = request.getParameter("imgFile");
        ImageDAO ImageDAO = new ImageDAOImpl();
        String imageID = ImageDAO.getImageID(imgFile);
        Image_ProductDAO Image_ProductDAO = new Image_ProductDAOImpl();
        

        ProductDAO.addProduct(name, description, size, categoryID, brandID, quantity, price, sale);
        String productID = ProductDAO.getIdOfProduct();
        Image_ProductDAO.addImage_Product(imageID, productID);
        request.setAttribute("choice", 0);
        request.setAttribute("messsucc", "Add product successful.");
        Product product = ProductDAO.getProductById(productID);
        request.setAttribute("product", product);
        request.getRequestDispatcher("view/addProduct.jsp").forward(request, response);
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
