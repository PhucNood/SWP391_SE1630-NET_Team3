/*AddToCartController
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022/10/30      1.0                 NamVH           First Implement
 */
package controller;

import dao.ProductDAO;
import dao.impl.ProductDAOImpl;
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AddToCartController extends HttpServlet {

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
            ProductDAO d = new ProductDAOImpl();
            List<Product> list = d.getProduct("0", "0", "0", "0");
            Cookie[] arr = request.getCookies();
            String txt = "";
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
            String num = request.getParameter("num");
            String id = request.getParameter("id");
            Product product = d.getProductById(id);
            if (txt.isEmpty()) {
                txt = id + ":" + num;
                request.setAttribute("susscess", "Add successfull!");
            } else {
                if (cart.getQuantityById(Integer.parseInt(id)) >= product.getQuantity()) {
                    txt += "";
                    request.setAttribute("maximum", product.getName() + " is out of stock!");
                } else {
                    txt = txt + "-" + id + ":" + num;
                    request.setAttribute("susscess", "Add successfull!");
                }
            }
            Cookie c = new Cookie("cart", txt.trim());
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);
            int n;
            HttpSession session = request.getSession();
            cart = new Cart(txt, list);
            List<Item> listItem = cart.getItems();
            if (listItem != null) {
                n = listItem.size();
            } else {
                n = 0;
            }
            session.setAttribute("size", n);
            request.getRequestDispatcher("view/shop.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddToCartController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    }

}
