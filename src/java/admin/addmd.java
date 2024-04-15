/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dao.ModelDAO;
import dao.NhanvatDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import java.util.ArrayList;
import model.Nhanvat;

/**
 *
 * @author congkhoa2723
 */
public class addmd extends HttpServlet {

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
            out.println("<title>Servlet addmd</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addmd at " + request.getContextPath() + "</h1>");
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
        NhanvatDAO nhanvatDAO = new NhanvatDAO();
        //set addres
        ArrayList<Nhanvat> nhanvatList = nhanvatDAO.getAllCharacters();
        request.setAttribute("nhanvatList", nhanvatList);

        request.getRequestDispatcher("addmd.jsp").forward(request, response);
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
        String releasedateStr = request.getParameter("releasedate");
        String characterid = request.getParameter("characterid");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String name = request.getParameter("name");
        String priceString = request.getParameter("price");
        String img = request.getParameter("img");

        Double price = null;

        if (priceString != null && !priceString.isEmpty()) {
            try {
                price = Double.parseDouble(priceString);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // hoặc xử lý lỗi khác tùy ý
            }
        }

        // Kiểm tra tính hợp lệ của tham số
        try {
            java.sql.Date releasedate = java.sql.Date.valueOf(releasedateStr);
            // Xử lý logic thêm nhân vật vào cơ sở dữ liệu
            ModelDAO modelDAO = new ModelDAO();
            modelDAO.addModel(name, price, characterid, releasedate, img,quantity);

            // Gửi thông báo thành công và chuyển hướng về trang list
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", "Đã thêm sản phẩm " + name + " vào gian hàng");
            response.sendRedirect("listmd");

        } catch (Exception e) {
            // Xử lý các ngoại lệ khác
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi trong quá trình xử lý yêu cầu.");
            request.getRequestDispatcher("addmd.jsp").forward(request, response);
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
