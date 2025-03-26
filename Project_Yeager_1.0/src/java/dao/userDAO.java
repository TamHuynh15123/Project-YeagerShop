/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.userDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author dangk
 */
public class userDAO {

    public userDTO readByID(String id) {
        String sql = "SELECT * FROM [user] WHERE username = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userDTO user = new userDTO(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("role"));
                return user;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean update(userDTO entity) {
        String sql = "UPDATE [user] SET "
                + "[password] = ?, "
                + "[fullname] = ?, "
                + "[email] = ? "
                + "WHERE [username] = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getPassword());
            ps.setString(2, entity.getFullname());
            ps.setString(3, entity.getEmail());
            ps.setString(4, entity.getUsername());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<userDTO> readAll() {
        List<userDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM [user] ; ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                userDTO user = new userDTO(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("role"));
                list.add(user);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean create(userDTO user) {
        String sql = "INSERT INTO [user] (username, password, fullname, email, role) VALUES (?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword()); // NÊN HASH PASSWORD ở đây!
            ps.setString(3, user.getFullname());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getRole());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
