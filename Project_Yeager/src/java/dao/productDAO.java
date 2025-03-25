/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CategoryDTO;
import dto.productDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author dangk
 */
public class productDAO {

    public List<productDTO> searchByName(String searchTerm) {
        List<productDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE productname LIKE ? AND status = 1 ";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productDTO b = new productDTO(
                        rs.getInt("id"),
                        rs.getString("productname"),
                        rs.getString("description"),
                        
                        rs.getInt("Quantity"),
                        rs.getFloat("price"),
                        rs.getBoolean("status"),
                        rs.getString("srcimg")
                );
                result.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    public List<productDTO> searchByNameAD(String searchTerm) {
        List<productDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE productname LIKE ?  ";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productDTO b = new productDTO(
                        rs.getInt("id"),
                        rs.getString("productname"),
                        rs.getString("description"),
                        
                        rs.getInt("Quantity"),
                        rs.getFloat("price"),
                        rs.getBoolean("status"),
                        rs.getString("srcimg")
                );
                result.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    public productDTO readByID(int id) {
        String sql = "SELECT * FROM product WHERE id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                productDTO b = new productDTO(
                        rs.getInt("id"),
                        rs.getString("productname"),
                        rs.getString("description"),
                        
                        rs.getInt("Quantity"),
                        rs.getFloat("price"),
                        rs.getBoolean("status"),
                        rs.getString("srcimg")
                );
                return b;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    public boolean update(productDTO entity) {
        String sql = "UPDATE product SET "
                + " productname=?, description=?, type=?, quantity=?, price=?, status=?, srcimg=? "
                + "  WHERE id=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getProductname());
            ps.setString(2, entity.getDescription());
            
            ps.setInt(3, entity.getQuantity());
            ps.setFloat(4, entity.getPrice());
            ps.setBoolean(5, entity.isStatus());
            ps.setString(6, entity.getSrcimg());
            ps.setInt(7, entity.getId());
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    public boolean add(productDTO entity) {
        String sql = "INSERT INTO product (productname, description, type, quantity, price, status, srcimg) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, entity.getProductname());
            ps.setString(2, entity.getDescription());
            
            ps.setInt(3, entity.getQuantity());
            ps.setFloat(4, entity.getPrice());
            ps.setBoolean(5, entity.isStatus());
            ps.setString(6, entity.getSrcimg());

            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace(); // In ra chi tiết lỗi
        }
        return false;
    }
    public List<CategoryDTO> getAllCategory() {
        List<CategoryDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM Categories";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoryDTO b = new CategoryDTO(
                        rs.getInt("category_id"),
                        rs.getString("category_name")
                        
                );
                result.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }
    
    public List<productDTO> readAll() {
        List<productDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM product";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productDTO b = new productDTO(
                        rs.getInt("id"),
                        rs.getString("productname"),
                        rs.getString("description"),
                        
                        rs.getInt("Quantity"),
                        rs.getFloat("price"),
                        rs.getBoolean("status"),
                        rs.getString("srcimg")
                );
                result.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }
    public List<productDTO> getProductByCate(int cid) {
        List<productDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE category_id = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productDTO b = new productDTO(
                        rs.getInt("id"),
                        rs.getString("productname"),
                        rs.getString("description"),
                        
                        rs.getInt("Quantity"),
                        rs.getFloat("price"),
                        rs.getBoolean("status"),
                        rs.getString("srcimg")
                );
                result.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }
    
    public static void main(String[] args) {
        productDAO dao = new productDAO();
        
        List<CategoryDTO> list = dao.getAllCategory();
        for (CategoryDTO dTO : list) {
            System.out.println(dTO);
        }
    }
}
