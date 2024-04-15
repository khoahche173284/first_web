/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dao.AnimeDAO;
import dao.NhanvatDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Anime;
import model.Nhanvat;

/**
 *
 * @author congkhoa2723
 */
public class updatesp extends HttpServlet {

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
            out.println("<title>Servlet updatesp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updatesp at " + request.getContextPath() + "</h1>");
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
          int characterid = Integer.parseInt(request.getParameter("characterid"));
      AnimeDAO animeDAO = new AnimeDAO();
        //set addres
        ArrayList<Anime> animeList = animeDAO.getAllAnime();
        request.setAttribute("animeList", animeList);
    // Tạo đối tượng AnimeDAO
    NhanvatDAO nhanvatDAO = new NhanvatDAO();
    
    // Gọi phương thức get trên đối tượng animeDAO
    Nhanvat nhanvat = nhanvatDAO.get(characterid);
    request.setAttribute("nhanvat", nhanvat);
    
    // Thực hiện chuyển hướng, chọn một trong hai cách tùy thuộc vào yêu cầu cụ thể
    // Nếu bạn muốn forward:
    request.getRequestDispatcher("updatesp.jsp").forward(request, response);
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
      
        int characterid = Integer.parseInt(request.getParameter("characterid"));
         String name = request.getParameter("name");
         String title = request.getParameter("title");
         
     
        NhanvatDAO nhanvatDAO = new NhanvatDAO();
        // chuyển từ String sang date 
       
        
         nhanvatDAO.update(characterid,name,title);

         HttpSession session = request.getSession();
         session.setAttribute("msg", "Updated");
         
         response.sendRedirect("listsp");
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
