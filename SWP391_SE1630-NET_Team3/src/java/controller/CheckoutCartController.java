/*CheckoutCartController
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022/10/30      1.0                 NamVH           First Implement
 */
package controller;

import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class CheckoutCartController extends HttpServlet {

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
        String total = request.getParameter("total");
        request.setAttribute("total", total);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("view/checkoutCart.jsp").forward(request, response);
        }
    }
}
