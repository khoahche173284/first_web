/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;


import dao.AnimeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Anime;


/**
 *
 * @author congkhoa2723
 */
public class update extends HttpServlet {

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
            out.println("<title>Servlet update</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet update at " + request.getContextPath() + "</h1>");
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
    int animeid = Integer.parseInt(request.getParameter("animeid"));
    
    // Tạo đối tượng AnimeDAO
    AnimeDAO animeDAO = new AnimeDAO();
    
    // Gọi phương thức get trên đối tượng animeDAO
    Anime anime = animeDAO.get(animeid);
    request.setAttribute("anime", anime);
    
    // Thực hiện chuyển hướng, chọn một trong hai cách tùy thuộc vào yêu cầu cụ thể
    // Nếu bạn muốn forward:
    request.getRequestDispatcher("update.jsp").forward(request, response);
    
    // Hoặc nếu bạn muốn redirect:
    response.sendRedirect("list");
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
        //request 
         int animeid = Integer.parseInt(request.getParameter("animeid"));
         String title = request.getParameter("title");
         String releasedateStr = request.getParameter("releasedate");
         String genre = request.getParameter("genre");
     
        AnimeDAO animeDAO = new AnimeDAO();
        // chuyển từ String sang date 
        java.sql.Date releasedate = java.sql.Date.valueOf(releasedateStr);
        
        animeDAO.update(animeid,title,releasedate,genre );

        HttpSession session = request.getSession();
        session.setAttribute("msg", "Updated");
         
        response.sendRedirect("list");
         
        
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
