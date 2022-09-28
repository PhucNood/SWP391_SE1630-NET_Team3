/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import BasicDaoImpl.AccountDAOImpl;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class login extends HttpServlet {
   
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
            out.println("<title>Servlet login</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String remember = request.getParameter("remember");
        HttpSession session = request.getSession();
        AccountDAOImpl AccD = new AccountDAOImpl();
        Account a = AccD.getAccByEmail(email);
        if (a == null) {
            session.setAttribute("fail", "Incorrect username or password.");
            response.sendRedirect("view/login.jsp");
        } else {
            if (a.getRole() == 0) {
                session.setAttribute("fail", "Your account has been locked.");
                response.sendRedirect("view/login.jsp");
            } else {
                if (a.getPass().equals(pass)) {
                    session.removeAttribute("fail");
                    session.setAttribute("account", a);
                    if (request.getParameter("remember") != null && remember.equals("1")) {
                        session.setAttribute("email", email);
                        session.setAttribute("pass", pass);
                        session.setAttribute("check", remember);
                    } else {
                        session.removeAttribute("email");
                        session.removeAttribute("pass");
                        session.removeAttribute("check");
                    }
                    response.sendRedirect("view/home.jsp");
                } else {
                    session.setAttribute("fail", "Incorrect username or password.");
                    response.sendRedirect("view/login.jsp");
                }
            }
        }
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
