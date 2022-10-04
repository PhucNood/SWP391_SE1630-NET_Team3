/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
 * @author admin
 */
public class SignupController extends HttpServlet {

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
            out.println("<title>Servlet SignupController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupController at " + request.getContextPath() + "</h1>");
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
        session.setAttribute("inPage", "signup");
        request.getRequestDispatcher("view/signup.jsp").forward(request, response);
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
        
        String passPattern = "(?=.*[A-Z]).{8,20}$";
        Pattern pas = Pattern.compile(passPattern);
        String phonePattern = "^[0-9]{10}";
        Pattern pho = Pattern.compile(phonePattern);

        HttpSession session = request.getSession();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String username = request.getParameter("fullname").trim();
        String user = request.getParameter("username").trim();
        String password = request.getParameter("pass").trim();
        String repass = request.getParameter("repass").trim();

        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("username", user);
        session.setAttribute("fullname", username);

        Matcher matpas = pas.matcher(password);
        Matcher matpho = pho.matcher(phone);

        //check cac dieu kien thoa man
        if (!matpho.matches()) {
            request.setAttribute("messPhone", "Phone must have 10 character!");
        } else if (!matpas.matches()) {
            request.setAttribute("messPass", "Password have at least 8 character contain at least one uppercase!");
        } else if (!password.equals(repass)) {
            request.setAttribute("messRePass", "Incorrect password, please re-enter!");
        } else {

            AccountDAOImpl accD = new AccountDAOImpl();
            Account a = accD.getAccByEmail(email);

            if (a == null) {
                session.setAttribute("pass", password);
                accD.addAccount(email, phone, username, user, password);
                request.setAttribute("messSuc", "Create account successful, You can login!");

            } else {
                request.setAttribute("messMail", "Email is already exist!");
            }

        }
        request.getRequestDispatcher("view/signup.jsp").forward(request, response);
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
