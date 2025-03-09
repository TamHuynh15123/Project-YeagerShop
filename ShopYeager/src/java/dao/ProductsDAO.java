/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author HP
 */
public class ProductsDAO implements IDAO<ProductsDTO, String> {

    @Override
    public boolean create(ProductsDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ProductsDTO> readAll() {
        List<ProductsDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            String sql = "SELECT productID, name, price, quantity, active FROM Products WHERE active = 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String id = rs.getString("productID");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                int quantity = rs.getInt("quantity");
                boolean active = rs.getBoolean("active");

                list.add(new ProductsDTO(id, name, price, description, quantity, active));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ProductsDTO readById(String id) {
        return null;

    }

    @Override
    public boolean update(ProductsDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<ProductsDTO> search(String searchTerm) {
        return null;
    }

    public List<ProductsDTO> searchByName(String name) {
        List<ProductsDTO> products = new ArrayList<>();
        String sql = "SELECT id, name, price, description, quantity, active FROM Products WHERE name LIKE ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsDTO product = new ProductsDTO(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getBoolean("active")
                );
                products.add(product);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return products;
    }

    public boolean updateQuantityToZero(int productId) {
        String sql = "UPDATE Products SET quantity = 0 WHERE id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }
}
