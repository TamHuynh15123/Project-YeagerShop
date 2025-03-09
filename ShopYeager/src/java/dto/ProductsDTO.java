/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author HP
 */
public class ProductsDTO {
    private String productId;
    private String productName;
    private double price;
    private String description;
    private int quantity;
    private boolean active;

    public ProductsDTO() {
    }

    public ProductsDTO(String productId, String productName, double price, String description, int quantity, boolean active) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.active = active;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "ProductsDTO{" + "productId=" + productId + ", productName=" + productName + ", price=" + price + ", description=" + description + ", quantity=" + quantity + ", active=" + active + '}';
    }
    
    
}
