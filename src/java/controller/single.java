/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ModelDAO;
import dao.NhanvatDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Model;
import model.Nhanvat;

/**
 *
 * @author congkhoa2723
 */
public class single extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet single</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet single at " + request.getContextPath() + "</h1>");
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
        
        int modelid = Integer.parseInt(request.getParameter("modelid"));
    
    // Tạo đối tượng AnimeDAO
    ModelDAO modelDAO = new ModelDAO();
      NhanvatDAO nhanvatDAO = new NhanvatDAO();
        //set addres
        ArrayList<Nhanvat> nhanvatList = nhanvatDAO.getAllCharacters();
        request.setAttribute("nhanvatList", nhanvatList);
    
    // Gọi phương thức get trên đối tượng animeDAO
    Model model = modelDAO.get(modelid);
    request.setAttribute("model", model);
    
    // Thực hiện chuyển hướng, chọn một trong hai cách tùy thuộc vào yêu cầu cụ thể
    // Nếu bạn muốn forward:
    request.getRequestDispatcher("single-product.jsp").forward(request, response);
    
    // Hoặc nếu bạn muốn redirect:
   
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
