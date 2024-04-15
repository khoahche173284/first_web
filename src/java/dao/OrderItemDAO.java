/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author congkhoa2723
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderItem;

public class OrderItemDAO extends DBConnect {

    public List<OrderItem> getByID(int orderid) {
    List<OrderItem> orderItems = new ArrayList<>();
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        String sql = "SELECT i.*, m.name, m.price FROM OrderItem i " +
                     "JOIN Orders o ON i.orderid = o.orderid " +
                     "JOIN Model m ON i.modelid = m.modelid " +
                     "WHERE i.orderid = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, orderid);

        rs = ps.executeQuery();
        while (rs.next()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setModelid(rs.getInt("modelid"));
            orderItem.setOrderitemid(rs.getInt("orderitemid"));
            orderItem.setOrderid(rs.getInt("orderid"));
            orderItem.setModelid(rs.getInt("modelid"));
            orderItem.setQuantity(rs.getInt("quantity"));
            orderItem.setName(rs.getString("name"));
            orderItem.setPrice(rs.getInt("price"));
            orderItem.setTotal(rs.getInt("total"));
            orderItems.add(orderItem);
        }
    } catch (SQLException ex) {
        Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return orderItems;
}

    public void addCart(int modelid, int quantity, double total) {
        try {
            // Truy vấn để lấy orderid dưới cùng từ bảng Orders
            String getOrderidSQL = "SELECT TOP 1 orderid FROM Orders ORDER BY orderid DESC";
            PreparedStatement getOrderidStatement = conn.prepareStatement(getOrderidSQL);
            ResultSet rs = getOrderidStatement.executeQuery();
            int orderid = -1;
            if (rs.next()) {
                orderid = rs.getInt("orderid");
            }

            // Nếu không có orderid nào được trả về, không thực hiện thêm vào OrderItem
            if (orderid == -1) {
                System.out.println("Không thể lấy orderid từ bảng Orders.");
                return;
            }

            // Chuẩn bị câu lệnh INSERT với orderid vừa lấy được
            String sql = "INSERT INTO OrderItem (orderid, modelid, quantity, total) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderid);
            ps.setInt(2, modelid);
            ps.setInt(3, quantity);
            ps.setDouble(4, total);

            // Thực hiện truy vấn INSERT
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public void addCart(int orderitemid, int orderid,String modelid,String quantity,String total) {
//        try {
//            String sql = "INSERT INTO OrderItem (orderitemid, orderid,modelid,quantity,total) VALUES (?,?,?, ?,?)";
//            PreparedStatement ps = conn.prepareStatement(sql);
//
//           
//            ps.setInt(1, orderitemid);
//            ps.setInt(2, orderid);
//            ps.setString(3, modelid);
//            ps.setString(4, quantity);
//            ps.setString(5, total);
//            
//            // Thực hiện truy vấn INSERT
//            ps.execute();
//            ps.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }
}
