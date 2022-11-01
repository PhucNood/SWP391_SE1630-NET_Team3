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
import entity.Cart;
import entity.Item;
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
 * get quantity from request to set quantity of product in cart
 *
 * @author admin
 */
public class InputQuantityInCartController extends HttpServlet {

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
            //get all product list
            List<Product> list = d.getProduct("0", "0", "0", "0");
            Cookie[] arr = request.getCookies();
            String txt = "";
            //add product and quantity to cookie
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue().trim();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }
            Cart cart = new Cart(txt, list);
            int id, num = 0;
            String num_raw = request.getParameter("num");
            String id_raw = request.getParameter("id");

            Product p = d.getProductById(id_raw);
            int numStore = p.getQuantity();
            id = Integer.parseInt(id_raw);
            num = Integer.parseInt(num_raw);
            double price = p.getPrice();
            //update quantity of product in cart
            Item t = new Item(p, -cart.getQuantityById(id));
            cart.addItem(t);
            //remove product if quantity < 0
            if (num <= 0) {
                cart.removeItem(id);
            } else {
                if (num > numStore) {
                    num = numStore;
                    request.setAttribute("maximum", "There are "+numStore+" products left in stock");
                    request.setAttribute("OutId", id_raw);
                }
                t = new Item(p, num);
                cart.addItem(t);
            }
            
            //update cart on cookie
            List<Item> items = cart.getItems();
            txt = "";
            if (items.size() > 0) {
                txt = items.get(0).getProduct().getProductID() + ":"
                        + items.get(0).getQuantity();
                for (int i = 1; i < items.size(); i++) {
                    txt += "-" + items.get(i).getProduct().getProductID() + ":"
                            + items.get(i).getQuantity();
                }
            }
            int n;
            if (items != null) {
                n = items.size();
            } else {
                n = 0;
            }
            session.setAttribute("size", n);
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(24 * 2 * 60 * 60);
            response.addCookie(c);
            
            //sort cart by filter
            Cart newCart = cart.sortCartByListPoduct(listProduct);
            session.setAttribute("categoryID", categoryID);
            session.setAttribute("brandID", brandID);
            session.setAttribute("filterID", filterID);
            session.setAttribute("sortID", sortID);
            request.setAttribute("cart", newCart);
            request.getRequestDispatcher("view/cart.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(InputQuantityInCartController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    }

}
