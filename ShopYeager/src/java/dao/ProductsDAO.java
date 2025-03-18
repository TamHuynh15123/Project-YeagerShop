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
        String sql = "SELECT * FROM Products WHERE active = 1";
        try {
            Connection conn = DBUtils.getConnection();
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductsDTO p = new ProductsDTO();
                p.setProduct_id(rs.getString("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                p.setActive(true);

                list.add(p);
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
        String sql = "SELECT product_id, product_name, price, description, quantity, active, category_id FROM Products WHERE name LIKE ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsDTO product = new ProductsDTO(
                        
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

    public List<ProductsDTO> getProductsByPage(List<ProductsDTO> list,int start, int end) {
        ArrayList<ProductsDTO> arr = new ArrayList<>();
        for(int i = start; i< end; i++){
            arr.add(list.get(i));
        }
        return arr;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM Products WHERE active = 1";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
