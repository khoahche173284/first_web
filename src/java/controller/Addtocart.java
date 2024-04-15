/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ModelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Item;
import model.Model;
import model.Order;

/**
 *
 * @author congkhoa2723
 */
@WebServlet(urlPatterns = {"/addtoCart"})
public class Addtocart extends HttpServlet {

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
            out.println("<title>Servlet Addtocart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Addtocart at " + request.getContextPath() + "</h1>");
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
        int quantity = 1;
       
        if (request.getParameter("modelid") != null) {

            int modelid = Integer.parseInt(request.getParameter("modelid"));
            ModelDAO modelDAO = new ModelDAO();
            System.out.println(modelid);

            Model model = modelDAO.getModelById(modelid);

            System.out.println(model.getName());

            if (model != null) {

                if (request.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                HttpSession session = request.getSession();
                
                // nếu chưa có trong giỏ hàng thì thêm vào mới

                if (model.getQuantity() != 0) {

                    if (session.getAttribute("order") == null) {

                        Order order = new Order();
                        List<Item> listItems = new ArrayList<Item>();
                        Item item = new Item();
                        item.setQuantity(quantity);
                        item.setModel(model);
                        item.setPrice((int) model.getPrice());
                        listItems.add(item);
                        order.setItems(listItems);
                        session.setAttribute("order", order);
                    } else {
                        // nếu tồn tại thì tăng số lượng
                        Order order = (Order) session.getAttribute("order");
                        List<Item> listItems = order.getItems();
                        boolean check = false;
                        for (Item item : listItems) {
                            if (item.getModel().getModelid() == model.getModelid() && item.getQuantity() < model.getQuantity()) {
                                item.setQuantity(item.getQuantity() + quantity);
                                check = true;
                            }
                        }
                        // còn nếu không thì add vào
                        if (check == false) {

                            Item item = new Item();
                            item.setQuantity(quantity);
                            item.setModel(model);
                            item.setPrice((int) model.getPrice());
                            listItems.add(item);
                        }
                        session.setAttribute("order", order);
                    }
                } else {
                   
                    request.setAttribute("errorquantity", "Sản Phẩm " + model.getName() + " Tạm Hết Hàng!");
                    
                    
                }

                request.getRequestDispatcher("Cart").forward(request, response);

            }
        } else {
            request.getRequestDispatcher("single-product.jsp").forward(request, response);
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
