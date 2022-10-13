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
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author admin
 */
public class AddProductImageController extends HttpServlet {

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
            out.println("<title>Servlet AddProductImageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductImageController at " + request.getContextPath() + "</h1>");
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
        String productID = request.getParameter("productID");
        request.setAttribute("productID", productID);
        request.getRequestDispatcher("view/addProductImage.jsp").forward(request, response);
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
            String productID = request.getParameter("productID");
            
            String name = request.getParameter("name");
            ImageDAO ImageDAO = new ImageDAOImpl();

            ServletContext context = request.getServletContext();
            String fullPath = context.getRealPath("/img");
            String partFullPath[] = fullPath.split("\\\\");
            String realPath = "";
            for (int i = 0; i < partFullPath.length; i++) {
                if (partFullPath[i].equalsIgnoreCase("build")) {
                    break;
                } else {
                    realPath += partFullPath[i] + "\\";
                }
            }
            realPath += "web\\view\\images\\";
            System.out.println("file path:" + fullPath);

            
            String img = "";
            if (ServletFileUpload.isMultipartContent(request)) {
                List<FileItem> mulFile = null;
                Map<String, List<FileItem>> mapFile = new ServletFileUpload(new DiskFileItemFactory()).parseParameterMap(request);
                for (Map.Entry<String, List<FileItem>> entry : mapFile.entrySet()) {
                    String key = entry.getKey();
                    mulFile = entry.getValue();
                    for (FileItem fileItem : mulFile) {
                        if (!fileItem.isFormField()) {
                            img = fileItem.getName();
                            System.out.println("place upload: " + realPath + img);
                            fileItem.write(new File(realPath + img));
                        }
                    }
                }
            }
            
            request.setAttribute("test", img);
            ImageDAO.addImage(name, img);
            String getImageID = ImageDAO.getImageID(img);
            Image_ProductDAO Image_ProductDAO = new Image_ProductDAOImpl();
            Image_ProductDAO.addImage_Product(getImageID, productID);

            HttpSession session = request.getSession();
            Product product = ProductDAO.getProductById(productID);

            BrandDAO BrandDAO = new BrandDAOImpl();
            List<Brand> listBrand = BrandDAO.getAllBrand();
            session.setAttribute("listBrand", listBrand);
            CategoryDAO CategoryDAO = new CategoryDAOImpl();
            List<Category> listCategory = CategoryDAO.getAllCategory();
            session.setAttribute("listCategory", listCategory);
            session.setAttribute("product", product);
            request.getRequestDispatcher("view/editProduct.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddProductImageController.class.getName()).log(Level.SEVERE, null, ex);

        }
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
