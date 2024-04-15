/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ModelDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Model;


/**
 *
 * @author congkhoa2723
 */
public class search extends HttpServlet {

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
            out.println("<title>Servlet search</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet search at " + request.getContextPath() + "</h1>");
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
        
    double pricemin = Double.parseDouble(request.getParameter("pricemin"));
    double pricemax = Double.parseDouble(request.getParameter("pricemax"));


    ModelDAO modelDAO = new ModelDAO();
    ArrayList<Model> searchprice = modelDAO.searchprice(pricemin,pricemax);
  

    if (!searchprice.isEmpty())  {
        
        request.setAttribute("searchprice", searchprice);
        request.getRequestDispatcher("listmd.jsp").forward(request, response);
    } else {
       
        
        request.setAttribute("error", "Không có trong cửa hàng");
        request.getRequestDispatcher("listmd.jsp").forward(request, response);
    }

    
        
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
    // "name" từ search của list.jsp
    String name = request.getParameter("name");

    ModelDAO modelDAO = new ModelDAO();
    ArrayList<Model> search = modelDAO.search(name);

    if (!search.isEmpty()) {
        // hợp lệ
        request.setAttribute("search", search);
        request.getRequestDispatcher("listmd.jsp").forward(request, response);
    } else {
        //  không có tên trong danh sách
        
        request.setAttribute("error", "Không có trong cửa hàng");
        request.getRequestDispatcher("listmd.jsp").forward(request, response);
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
