/*ManageAccountController
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022/10/30      1.0                 NamVH           First Implement
 */
package controller;

import dao.AccountDAO;
import dao.impl.AccountDAOImpl;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *get account list to display for admin can view and edit role of account
 *and can search account by name, email, username follow to request of admin
 * @author admin
 */
public class ManageAccountController extends HttpServlet {

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
            session.setAttribute("inPage", "manage");
            AccountDAO AccountDAO = new AccountDAOImpl();
            String sort = null;
            String gender = null;
            String role = null;
            String search = null;
            List<Account> listAccount = null;
            //get list  account by filter
            if ((request.getParameter("all") != null) && request.getParameter("all").equals("1")) {
                session.removeAttribute("sort");
                session.removeAttribute("gender");
                session.removeAttribute("role");
                session.removeAttribute("text");
                //set filter default
                sort = "0";
                gender = "0";
                role = "0";
                search = "";
                listAccount = AccountDAO.getListAccount(sort, gender, role, search);
            } else {
                //get filter in session, if null then set default
                if (session.getAttribute("text") != null) {
                    search = (String) session.getAttribute("text");
                } else {
                    search = "";
                }
                if (session.getAttribute("sort") != null) {
                    sort = (String) session.getAttribute("sort");
                } else {
                    sort = "0";
                }
                if (session.getAttribute("gender") != null) {
                    gender = (String) session.getAttribute("gender");
                } else {
                    gender = "0";
                }
                if (session.getAttribute("role") != null) {
                    role = (String) session.getAttribute("role");
                } else {
                    role = "0";
                }

                //get filter in request
                if (request.getParameter("sort") != null) {
                    sort = request.getParameter("sort");
                }
                if (request.getParameter("gender") != null) {
                    gender = request.getParameter("gender");
                }
                if (request.getParameter("role") != null) {
                    role = request.getParameter("role");
                }
                if (request.getParameter("text") != null) {
                    search = (String) request.getParameter("text");
                }
                //get account list by filter
                listAccount = AccountDAO.getListAccount(sort, gender, role, search);

            }
            session.setAttribute("text", search);
            session.setAttribute("sort", sort);
            session.setAttribute("gender", gender);
            session.setAttribute("role", role);
            request.setAttribute("listAccount", listAccount);
            request.getRequestDispatcher("view/manageAccount.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ManageAccountController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("view/error.jsp").forward(request, response);
        }
    }
}
