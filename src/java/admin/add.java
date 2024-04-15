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



/**
 *
 * @author congkhoa2723
 */
public class add extends HttpServlet {

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
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
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

        //set addres
        request.getRequestDispatcher("add.jsp").forward(request, response);
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
        String title = request.getParameter("title");
        String releasedateStr = request.getParameter("releasedate");
        String genre = request.getParameter("genre");

        // Kiểm tra tính hợp lệ của tham số
        if (title == null || title.trim().isEmpty() || releasedateStr == null || releasedateStr.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin.");
            request.getRequestDispatcher("add.jsp").forward(request, response);
            return;
        }
        
        try {
            // Chuyển đổi chuỗi thành java.sql.Date
            java.sql.Date releasedate = java.sql.Date.valueOf(releasedateStr);
                
            AnimeDAO animeDAO = new AnimeDAO();
            animeDAO.add(title, releasedate,genre);

            // Gửi thông báo thành công và chuyển hướng về trang list
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", "Đã thêm " + title + " vào cơ sở dữ liệu.");
            response.sendRedirect("list");

        } catch (IllegalArgumentException e) {
            // Xử lý lỗi chuyển đổi chuỗi thành java.sql.Date
            e.printStackTrace();
            request.setAttribute("error", "Định dạng ngày không hợp lệ. Vui lòng sử dụng định dạng yyyy-MM-dd.");
            request.getRequestDispatcher("add.jsp").forward(request, response);
        } catch (Exception e) {
            // Xử lý các ngoại lệ khác
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi trong quá trình xử lý yêu cầu.");
            request.getRequestDispatcher("add.jsp").forward(request, response);
        }
    }

//protected void doPost(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException {
//    String title = request.getParameter("title");
////title trước tự đặt
////title sau từ add.jsp , nó là yêu cầu nhập vào
//    try {
//        // Chuyển đổi chuỗi thành đối tượng java.sql.Date
//        String releaseDateStr = request.getParameter("releaseDate");
//        java.sql.Date releaseDate = java.sql.Date.valueOf(releaseDateStr);
//        // Giả sử định dạng chuỗi là "yyyy-MM-dd"
//
//        if ("".equals(title)) {
//            request.setAttribute("mmsg", "nhap lai");
//            request.getRequestDispatcher("add.jsp").forward(request, response);
//            return;
//        }
//
//        AnimeDAO animeDAO = new AnimeDAO();
//        animeDAO.add(title, releaseDate);
//
//        HttpSession session = request.getSession();
//        session.setAttribute("namel", "da add " + title);
//        response.sendRedirect("list");
//
//    } catch (Exception e) {
//        e.printStackTrace();
//        // Xử lý ngoại lệ hoặc thông báo lỗi tùy thuộc vào yêu cầu của bạn
//    }
//}
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
