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

public class AnimeDAO extends DBConnect {

    public void add(String title,Date releasedate,String genre) {
        try {
            String sql = "INSERT INTO Anime(title, releasedate,genre) VALUES (?, ?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, title);
            ps.setDate(2, releasedate);
            ps.setString(3, genre);
            

            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Anime> getAllAnime() {
        try {
                String sql = "SELECT * FROM Anime";
                
                PreparedStatement ps;
                ps = conn.prepareStatement(sql);
                
                ResultSet rs = ps.executeQuery();
                
                ArrayList<Anime> list = new ArrayList<>(); 
            while (rs.next()) {
                Anime anime = new Anime();
                anime.setAnimeid(rs.getInt("animeid"));
                anime.setTitle(rs.getString("title"));
                anime.setReleasedate(rs.getDate("releasedate"));
                anime.setGenre(rs.getString("genre"));
                list.add(anime);
            }
            
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Các phương thức khác có thể được thêm vào tùy theo nhu cầu
    public void delete(int animeid) {
        try {
            String sql = "delete from Anime where animeid =? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, animeid);
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    public Anime get(int animeid){
       
        try {
            String  sql = "select * from Anime where animeid = ?";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, animeid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Anime anime = new Anime();
            anime.setAnimeid(rs.getInt("animeid"));
            anime.setTitle(rs.getString("title"));
            anime.setReleasedate(rs.getDate("releasedate"));
            anime.setGenre(rs.getString("genre"));
            return anime;
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void update(int animeid,String title,Date  releasedate,String genre){
        try {
            String  sql = "update Anime set title = ?,releasedate=?,genre=? where animeid=?";
            
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1,title );
            ps.setDate(2, releasedate);
            ps.setString(3,genre);
            ps.setInt(4,animeid);
            ps.execute();
            
                
                
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}

