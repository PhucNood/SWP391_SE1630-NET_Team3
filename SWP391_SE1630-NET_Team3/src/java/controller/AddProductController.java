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
 * get request from addProduct.jsp to create new product and add to database
 *
 * @author admin
 */
public class AddProductController extends HttpServlet {

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
            BrandDAO BrandDAO = new BrandDAOImpl();
            //get list brand
            List<Brand> listBrand = BrandDAO.getAllBrand();
            session.setAttribute("listBrand", listBrand);
            CategoryDAO CategoryDAO = new CategoryDAOImpl();
            //get lis category
            List<Category> listCategory = CategoryDAO.getAllCategory();
            session.setAttribute("listCategory", listCategory);
            request.getRequestDispatcher("view/addProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
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
            ProductDAO ProductDAO = new ProductDAOImpl();
            int temp = 0;

            //get information of product from form
            String name = request.getParameter("name");
            String name_temp = name;
            String description = request.getParameter("description");
            String size = request.getParameter("size");
            String categoryID = request.getParameter("category");
            String brandID = request.getParameter("brand");
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String sale = request.getParameter("sale");
            String img = request.getParameter("imgFile");
            
            //split string before charater '.' to compare with integer.max_value
            String price_temp = "";
            if (price.contains(".")) {
                for (int i = 0; i < price.length() - 1; i++) {
                    if (price.charAt(i) != '.') {
                        price_temp += price.charAt(i);
                    } else {
                        break;
                    }
                }

            } else {
                price_temp = price;
            }
            
            BigInteger PriceBig;
            if (price_temp.equals("")) {
                PriceBig = BigInteger.ZERO;
            } else {
                PriceBig = new BigInteger(price_temp);
            }

            //validation data and display message error
            if (name_temp.trim().equals("")) {
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

                

                ImageDAO ImageDAO = new ImageDAOImpl();
                ImageDAO.addImage("", img);
                //get id of image in database
                String imageID = ImageDAO.getImageID(img);
                Image_ProductDAO Image_ProductDAO = new Image_ProductDAOImpl();

                //add product
                ProductDAO.addProduct(name, description, size, categoryID, brandID, quantity, price, sale);
                //get id of new product
                String productID = ProductDAO.getIdOfProduct();
                //add connect img and product
                Image_ProductDAO.addImage_Product(imageID, productID);
                request.setAttribute("choice", 0);
                request.setAttribute("messsucc", "Add product successful.");
                Product product = ProductDAO.getProductById(productID);
                request.setAttribute("product", product);
            } else {
                HttpSession session = request.getSession();
                BrandDAO BrandDAO = new BrandDAOImpl();
                //get list brand
                List<Brand> listBrand = BrandDAO.getAllBrand();
                session.setAttribute("listBrand", listBrand);
                CategoryDAO CategoryDAO = new CategoryDAOImpl();
                //get lis category
                List<Category> listCategory = CategoryDAO.getAllCategory();
                session.setAttribute("listCategory", listCategory);
            }

            request.getRequestDispatcher("view/addProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
