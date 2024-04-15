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
import java.util.logging.Level;
import java.util.logging.Logger;

import model.DangNhap;
import model.Nhanvat;

public class DangNhapDAO extends DBConnect {

    public DangNhap getLoginByUsername(String username, String password) throws SQLException {

        String sql = "SELECT * FROM DangNhap WHERE username = ? and password=?";
        PreparedStatement ps;
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            DangNhap dangnhap = new DangNhap();
            dangnhap.setLoginid(rs.getInt("loginid"));
            dangnhap.setUsername(rs.getString("username"));
            dangnhap.setPassword(rs.getString("password"));
            return dangnhap;
        }

        return null;
    }
     public DangNhap getLoginById (String username) throws SQLException {

        String sql = "SELECT * FROM DangNhap WHERE username = ? ";
        PreparedStatement ps;
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            DangNhap dangnhap = new DangNhap();
            dangnhap.setLoginid(rs.getInt("loginid"));
            dangnhap.setUsername(rs.getString("username"));
            dangnhap.setPassword(rs.getString("password"));
            return dangnhap;
        }

        return null;
    }
    public void add(String username, String password) {
        try {
            String sql = "INSERT INTO DangNhap(username, password) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(DangNhapDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Nhanvat get(int characterid){
       
        try {
            String sql = "SELECT n.*, a.title as anime_title FROM Nhanvat n \n" +
        "LEFT JOIN Anime a ON n.title = a.animeid where characterid = ?";

            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, characterid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Nhanvat nhanvat = new Nhanvat();
            nhanvat.setCharacterid(rs.getInt("characterid"));
            nhanvat.setName(rs.getString("name"));
            nhanvat.setTitle(rs.getString("anime_title"));
            
            return nhanvat;
 
        } catch (SQLException ex) {
            Logger.getLogger(NhanvatDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
}
