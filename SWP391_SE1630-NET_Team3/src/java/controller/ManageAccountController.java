/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.impl.AccountDAOImpl;
import entity.Account;
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
public class ManageAccountController extends HttpServlet {

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
            out.println("<title>Servlet ManageAccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageAccountController at " + request.getContextPath() + "</h1>");
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
        session.setAttribute("inPage", "manage");
        AccountDAO AccountDAO = new AccountDAOImpl();
        String sort = null;
        String gender = null;
        String role = null;
        String search = null;
        List<Account> listAccount = null;
        if ((request.getParameter("all") != null) && request.getParameter("all").equals("1")) {
            session.removeAttribute("sort");
            session.removeAttribute("gender");
            session.removeAttribute("role");
            session.removeAttribute("text");
            sort = "0";
            gender = "0";
            role = "0";
            search = "";
            listAccount = AccountDAO.getListAccount(sort, gender, role, search);
        } else {
            if (session.getAttribute("text") != null) {
                search = (String) session.getAttribute("text");
            }else search = "";
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

            listAccount = AccountDAO.getListAccount(sort, gender, role, search);

        }
        session.setAttribute("text", search);
        session.setAttribute("sort", sort);
        session.setAttribute("gender", gender);
        session.setAttribute("role", role);
        request.setAttribute("listAccount", listAccount);
        request.getRequestDispatcher("view/manageAccount.jsp").forward(request, response);
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
