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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author FPT SHOP DOAN HUNG
 */
public class ChangeInformationController extends HttpServlet {
   
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
            out.println("<title>Servlet ChangeInformationController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeInformationController at " + request.getContextPath () + "</h1>");
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
        String phonePattern = "^[0-9]{10}";
        Pattern pho = Pattern.compile(phonePattern);
        Account a = (Account) session.getAttribute("account");
        String email = a.getEmail();
        String phone = request.getParameter("phone").trim();
        String name = request.getParameter("fullname").trim();
        String user = request.getParameter("username").trim();

        Matcher matpho = pho.matcher(phone);
        AccountDAO accD = new AccountDAOImpl();
        if (!matpho.matches()) {
            request.setAttribute("phone", phone);
            request.setAttribute("username", user);
            request.setAttribute("fullname", name);
            request.setAttribute("mess1", "Phone must have 10 character");
            request.getRequestDispatcher("information.jsp").forward(request, response);
        } else {
            accD.UpdateInfo(email, phone, name, user);
            a = accD.getAccByEmail(email);
            session.setAttribute("account", a);
            request.setAttribute("success", "Change information successful.");
            request.getRequestDispatcher("information.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
