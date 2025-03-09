/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
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
 * @author HP
 */
public class UserDAO implements IDAO<UserDTO, String> {

    @Override
    public boolean create(UserDTO entity) {
        String sql = "INSERT INTO Users(username, email, password, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, entity.getUsername());
            ps.setString(2, entity.getEmail());
            ps.setString(3, entity.getPassword());
            ps.setString(4, entity.getRoleID());
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<UserDTO> readAll() {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblUsers";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UserDTO user = new UserDTO(
                        rs.getString("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("roleID"));
                list.add(user);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public UserDTO readById(String email) {
        String sql = "SELECT * FROM Users WHERE email = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new UserDTO(
                            rs.getString("id"),
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("roleID"));
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(UserDTO entity) {
        String sql = "UPDATE tblUsers SET username = ?, email = ?, password = ?, roleID = ? WHERE id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, entity.getUsername());
            ps.setString(2, entity.getEmail());
            ps.setString(3, entity.getPassword());
            ps.setString(4, entity.getRoleID());
            ps.setString(5, entity.getId());

            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM tblUsers WHERE id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<UserDTO> search(String searchTerm) {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblUsers WHERE username LIKE ? OR email LIKE ? OR roleID LIKE ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            String searchPattern = "%" + searchTerm + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    UserDTO user = new UserDTO(
                            rs.getString("id"),
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("roleID"));
                    list.add(user);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
