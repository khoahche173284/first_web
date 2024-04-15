/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import dao.DangNhapDAO;
import dao.ModelDAO;
import dao.OrderItemDAO;
import dao.OrdersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.DangNhap;
import model.Item;
import model.Model;
import model.Order;

/**
 *
 * @author congkhoa2723
 */
public class checkout extends HttpServlet {

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
            out.println("<title>Servlet checkout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkout at " + request.getContextPath() + "</h1>");
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

        // Lấy đối tượng giỏ hàng từ session
        Order order = (Order) session.getAttribute("order");

        request.getAttribute("model");
//        String username = request.getParameter("username");
//        DangNhapDAO dangnhapDAO = new DangNhapDAO(); 
//        
//        DangNhap dangnhap = dangnhapDAO.getLoginById(username);
//        dangnhap.getLoginid();
//        

        if (order != null && !order.getItems().isEmpty()) {

            // Nếu giỏ hàng không rỗng, chuyển hướng đến trang thanh toán (checkout)
            request.getRequestDispatcher("checkout.jsp").forward(request, response);

        } else {
            // Nếu giỏ hàng rỗng, thông báo cho người dùng và chuyển hướng đến trang sản phẩm
            request.setAttribute("message", "Bạn vẫn chưa chọn sản phẩm nào để mua");
            request.getRequestDispatcher("HomePage").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //  customer 
        int customerid = Integer.parseInt(request.getParameter("customerid"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // orderitem
       
        int orderid = Integer.parseInt(request.getParameter("customerid"));
        String[] modelids = request.getParameterValues("modelid[]");
        String[] quantities = request.getParameterValues("quantity[]");
        String[] totals = request.getParameterValues("total[]");

//        for(int i=0;i<modelid.length;i++){
//            System.out.println("ygigy");
//            System.out.println(modelid[i]);
//            
//        }
//        int modelid = Integer.parseInt(request.getParameter("modelid"));
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        double total = Double.parseDouble(request.getParameter("total"));
        // order
       
        double totalamount = Double.parseDouble(request.getParameter("totalamount"));

        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.addCus(customerid, name, email, address);

        OrdersDAO od = new OrdersDAO();
        od.addOrders(customerid, totalamount);

        OrderItemDAO or = new OrderItemDAO();

        for (int i = 0; i < modelids.length; i++) {
            System.out.println("ygigy");
            System.out.println(modelids[i]);

            int modelid = Integer.parseInt(modelids[i]);
            int quantity = Integer.parseInt(quantities[i]);
            double total = Double.parseDouble(totals[i]);
            or.addCart( modelid, quantity, total);
        }

        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

}
