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

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.Orders;

public class OrdersDAO extends DBConnect {

   public ArrayList<Orders> getAll() {
        ArrayList<Orders> orderList = new ArrayList<>();
        String sql = "SELECT o.* ,c.name as namecus  FROM Orders o"
                + " LEFT JOIN Customer c ON o.customerid = c.customerid";
        try (Statement statement = conn.createStatement(); 
            ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                Orders orders = new Orders();
                orders.setOrderid(rs.getInt("orderid"));
                orders.setCustomerid(rs.getString("customerid"));
                orders.setName(rs.getString("namecus"));
                orders.setTotalamount(rs.getDouble("totalamount"));
               
               
                orderList.add(orders);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }
    public List<Orders> getByID(int customerid) {
    List<Orders> listorderName = new ArrayList<>();
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        String sql = "SELECT * FROM Orders " +
                     
                     "WHERE customerid = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, customerid);

        rs = ps.executeQuery();
        while (rs.next()) {
           Orders orders = new Orders();
           orders.setName(rs.getString("name"));
           orders.setTotalamount(rs.getInt("totalamount"));
            
        }
    } catch (SQLException ex) {
        Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return listorderName;
}

    public void addOrders(int customerid, double totalamount) {
        try {
            String sql = "INSERT INTO Orders ( customerid, totalamount) VALUES ( ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, customerid);
            ps.setDouble(2, totalamount);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
