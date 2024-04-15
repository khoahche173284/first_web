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
import model.Model;

public class ModelDAO extends DBConnect {

    public ArrayList<Model> getAllModels() {
        ArrayList<Model> modelList = new ArrayList<>();
        String sql = "SELECT m.* , c.name as namemodel  FROM Model m\n"
                + "              LEFT JOIN Nhanvat c ON m.characterid = c.characterid"
                + " ORDER BY price ASC";
        try (Statement statement = conn.createStatement(); ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                Model model = new Model();
                model.setModelid(rs.getInt("modelid"));
                model.setName(rs.getString("name"));
                model.setPrice(rs.getDouble("price"));
                model.setReleasedate(rs.getDate("releasedate"));
                model.setCharacterid(rs.getString("namemodel"));
                model.setQuantity(rs.getInt("quantity"));
                model.setImg(rs.getString("img"));
                modelList.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelList;
    }

    public ArrayList<Model> getAllModelsss() {
        ArrayList<Model> modelList = new ArrayList<>();
        String sql = "SELECT m.* , c.name as namemodel,a.title as namett  FROM Model m\n"
                + "                LEFT JOIN Nhanvat c ON m.characterid = c.characterid\n"
                + "                LEFT JOIN Anime a ON c.title = a.animeid"
                + "                ORDER BY price ASC";

        try (Statement statement = conn.createStatement(); ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                Model model = new Model();
                model.setModelid(rs.getInt("modelid"));
                model.setName(rs.getString("name"));
                model.setPrice(rs.getDouble("price"));
                model.setReleasedate(rs.getDate("releasedate"));
                model.setCharacterid(rs.getString("namemodel"));
                model.setAnimeid(rs.getString("namett"));
                model.setImg(rs.getString("img"));
                model.setQuantity(rs.getInt("quantity"));
                modelList.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelList;
    }

    public ArrayList<Model> getAllModelss() {
        ArrayList<Model> modelList = new ArrayList<>();
        String sql = "SELECT m.* , c.name as namemodel,a.title as namett  FROM Model m\n"
                + "                LEFT JOIN Nhanvat c ON m.characterid = c.characterid\n"
                + "                LEFT JOIN Anime a ON c.title = a.animeid";

        try (Statement statement = conn.createStatement(); ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                Model model = new Model();
                model.setModelid(rs.getInt("modelid"));
                model.setName(rs.getString("name"));
                model.setPrice(rs.getDouble("price"));
                model.setReleasedate(rs.getDate("releasedate"));
                model.setCharacterid(rs.getString("namemodel"));
                model.setAnimeid(rs.getString("namett"));
                model.setImg(rs.getString("img"));
                model.setQuantity(rs.getInt("quantity"));
                modelList.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelList;
    }

    public void addModel(String name, Double price, String characterid, Date releasedate, String img, int quantity) {
        try {
            String sql = "INSERT INTO Model (name, price,quantity ,characterid,releasedate,img) VALUES (?, ?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, quantity);
            ps.setString(4, characterid);
            ps.setDate(5, releasedate);
            ps.setString(6, img);

            // Thực hiện truy vấn INSERT
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ModelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void delete(int modelid) {
        try {
            String sql = "delete from Model where modelid =? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, modelid);
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ModelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Model getModelById(int modelid) {
        try {
            String sql = "SELECT * FROM Model "
                    + "WHERE modelid = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, modelid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Model model = new Model();
                model.setModelid(rs.getInt("modelid"));
                model.setQuantity(rs.getInt("quantity"));
                model.setName(rs.getString("name"));
                model.setPrice(rs.getDouble("price"));
                model.setImg(rs.getString("img"));
                return model;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null; // Trả về null nếu không tìm thấy model có id tương ứng
    }

    public Model get(int modelid) {

        try {
            String sql = "SELECT m.* , c.name as namemodel  FROM Model m\n"
                    + " LEFT JOIN Nhanvat c ON m.characterid = c.characterid where modelid = ?";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, modelid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Model model = new Model();
            model.setModelid(rs.getInt("modelid"));
            model.setQuantity(rs.getInt("quantity"));
            model.setName(rs.getString("name"));
            model.setPrice(rs.getDouble("price"));
            model.setReleasedate(rs.getDate("releasedate"));
            model.setCharacterid(rs.getString("namemodel"));
            model.setImg(rs.getString("img"));
            return model;

        } catch (SQLException ex) {
            Logger.getLogger(ModelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(int modelid, String name, Double price, Date releasedate, String characterid, String img, int quantity) {
        try {
            String sql = "update Model set name = ?,price =?,releasedate=?,characterid=?,img = ?,quantity = ? where modelid=?";

            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setDate(3, releasedate);
            ps.setString(4, characterid);
            ps.setString(5, img);
            ps.setInt(6, quantity);
            ps.setInt(7, modelid);

            ps.execute();

        } catch (SQLException ex) {
            Logger.getLogger(ModelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Model> search(String name) {
        try {
            String sql = "SELECT m.* , c.name as namemodel  FROM Model m\n"
                    + "  LEFT JOIN Nhanvat c ON m.characterid = c.characterid where m.name like ?";

            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();

            ArrayList<Model> search = new ArrayList<>();

            while (rs.next()) {
                Model model = new Model();
                model.setModelid(rs.getInt("modelid"));
                model.setName(rs.getString("name"));
                model.setPrice(rs.getDouble("price"));
                model.setReleasedate(rs.getDate("releasedate"));
                model.setCharacterid(rs.getString("namemodel"));
                model.setImg(rs.getString("img"));
                search.add(model);

            }
            return search;

        } catch (SQLException ex) {
            Logger.getLogger(ModelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new ArrayList<>();
    }

    public ArrayList<Model> searchprice(double pricemin, double pricemax) {
        try {
            String sql = "SELECT m.*, c.name AS namemodel FROM Model m "
                    + "LEFT JOIN Nhanvat c ON m.characterid = c.characterid "
                    + "WHERE m.price BETWEEN ? AND ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, pricemin);
            ps.setDouble(2, pricemax);
            ResultSet rs = ps.executeQuery();

            ArrayList<Model> searchprice = new ArrayList<>();

            while (rs.next()) {
                Model model = new Model();
                model.setModelid(rs.getInt("modelid"));
                model.setName(rs.getString("name"));
                model.setPrice(rs.getDouble("price"));
                model.setReleasedate(rs.getDate("releasedate"));
                model.setCharacterid(rs.getString("namemodel"));
                model.setImg(rs.getString("img"));
                searchprice.add(model);
            }
            return searchprice;

        } catch (SQLException ex) {
            Logger.getLogger(ModelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new ArrayList<>();
    }

}
