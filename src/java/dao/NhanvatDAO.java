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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Anime;
import model.Nhanvat;

public class NhanvatDAO extends DBConnect {

    public ArrayList<Nhanvat> getAllCharacters() {
        ArrayList<Nhanvat> listnv = new ArrayList<>();
        String sql = "SELECT p.*, a.title as anime_title FROM Nhanvat p "
                + "LEFT JOIN Anime a ON p.title = a.animeid";

        try (Statement statement = conn.createStatement(); ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
               
                Nhanvat nhanvat = new Nhanvat();
                nhanvat.setCharacterid(rs.getInt("characterid"));
                nhanvat.setName(rs.getString("name"));
                nhanvat.setTitle(rs.getString("anime_title")); // Thêm setAnimeTitle vào lớp Nhanvat
                listnv.add(nhanvat);
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listnv;
    }
    public int getCount() {
    int count = 0;
    String sql = "SELECT COUNT(*) AS count FROM Nhanvat";

    try (Statement statement = conn.createStatement(); 
            ResultSet rs = statement.executeQuery(sql)) {
        if (rs.next()) {
            count = rs.getInt("count");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return count;
}


    // ... Các phương thức khác
    public void addCharacter(String name, String title) {
        try {
            String sql = "INSERT INTO Nhanvat (name, title) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, name);
            ps.setString(2, title);

            // Thực hiện truy vấn INSERT
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(NhanvatDAO.class.getName()).log(Level.SEVERE, null, ex);
        }


    }
        public void delete(int characterid) {
        try {
            String sql = "delete from Nhanvat where characterid = ? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, characterid);
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(NhanvatDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public void update (int characterid,String name,String title){
        try {
            String  sql = "update Nhanvat set name=?,title=? where characterid=?";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1,name );
            ps.setString(2, title);
            ps.setInt(3,characterid);
           
            ps.execute();
            
                
                
        } catch (SQLException ex) {
            Logger.getLogger(NhanvatDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}

    // ... Các phương thức khác


// Các phương thức khác có thể được thêm vào tùy theo nhu cầu

