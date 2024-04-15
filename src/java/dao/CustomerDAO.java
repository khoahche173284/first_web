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
import model.Customer;
import model.Nhanvat;
import model.OrderItem;

public class CustomerDAO extends DBConnect {

    public ArrayList<Customer> getAll() {
        ArrayList<Customer> customerList = new ArrayList<>();
        String sql = "SELECT * FROM Customer";
        try (Statement statement = conn.createStatement(); ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                Customer customer = new Customer(rs.getInt("customerId"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getInt("loginid"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }
   

    public void addCus(int customerid, String name, String email, String address) {
        try {
            String sql = "INSERT INTO Customer(customerid ,name, email,address) VALUES (?,?, ?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, customerid);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, address);

            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Customer getByLoginid(int loginid) {

        try {
            String sql = "SELECT * FROM Customer where loginid = ?";

            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, loginid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Customer customer = new Customer();

            customer.setCustomerid(rs.getInt("customerid"));
            customer.setEmail(rs.getString("email"));
            customer.setName(rs.getString("name"));
            customer.setLoginid(rs.getInt("loginid"));
            return customer;

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
