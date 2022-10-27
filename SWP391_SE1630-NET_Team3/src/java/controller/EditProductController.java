/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.impl.BrandDAOImpl;
import dao.impl.CategoryDAOImpl;
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
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *get data from form to update information of product in database
 * @author admin
 */
public class EditProductController extends HttpServlet {

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
            String productID = request.getParameter("productID");
            ProductDAO ProductDAO = new ProductDAOImpl();
            //get product by id
            Product product = ProductDAO.getProductById(productID);

            BrandDAO BrandDAO = new BrandDAOImpl();
            //get all brand list
            List<Brand> listBrand = BrandDAO.getAllBrand();
            session.setAttribute("listBrand", listBrand);
            CategoryDAO CategoryDAO = new CategoryDAOImpl();
            //get all category list
            List<Category> listCategory = CategoryDAO.getAllCategory();
            session.setAttribute("listCategory", listCategory);
            session.setAttribute("product", product);
            request.getRequestDispatcher("view/editProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EditProductController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
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
        try {
            int temp = 0;
            ProductDAO ProductDAO = new ProductDAOImpl();
            //get data from form 
            String productID = request.getParameter("productID");
            String name = request.getParameter("name").trim();
            String description = request.getParameter("description");
            String size = request.getParameter("size");
            String categoryID = request.getParameter("category");
            String brandID = request.getParameter("brand");
            String price = request.getParameter("price");
            //split string before charater '.' to compare with integer.max_value
            String price_temp = "";
            if (price.contains(".")) {
                for (int i = 0; i <  price.length() - 1; i++) {
                    if (price.charAt(i) != '.') {
                        price_temp+=price.charAt(i);
                    } else {
                        break;
                    }
                }
               
            } else {
                price_temp = price;
            }
            BigInteger PriceBig;
            if(price_temp.equals("")){
                PriceBig = BigInteger.ZERO;
            }else PriceBig = new BigInteger(price_temp);
            String quantity = request.getParameter("quantity");
            String sale = request.getParameter("sale");
            
            //validation data and display message error
            if (name.equals("")) {
                temp = 1;
                request.setAttribute("name", name);
                request.setAttribute("NameNull", "Name is not null!");
            }
            BigInteger max = new BigInteger(String.valueOf(Integer.MAX_VALUE));
            if (new BigInteger(size).compareTo(max) == 1) {
                temp = 1;
                request.setAttribute("size", size);
                request.setAttribute("SizeInfinity", "Number is Infinity!");
            }
            if (PriceBig.compareTo(max) == 1) {
                temp = 1;
                request.setAttribute("price", price);
                request.setAttribute("PriceInfinity", "Number is Infinity!");
            }
            if (new BigInteger(quantity).compareTo(max) == 1) {
                temp = 1;
                request.setAttribute("quantity", quantity);
                request.setAttribute("QuantityInfinity", "Number is Infinity!");
            }
            if (temp == 0) {
                ProductDAO.updateProduct(name, description, size, categoryID, brandID, quantity, price, sale, productID);
                request.setAttribute("choice", 0);
                request.setAttribute("messsucc", "Update product successful.");
                Product product = ProductDAO.getProductById(productID);
                request.setAttribute("product", product);
            }
            request.getRequestDispatcher("view/editProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(EditProductController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    }

}
