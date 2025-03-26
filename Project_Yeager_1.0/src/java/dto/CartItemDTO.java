package dto;

public class CartItemDTO {
    private int id;
    private String productName;
    private int quantity;
    private float price;
    private String image;

    public CartItemDTO(int id, String productName, int quantity, float price, String image) {
        this.id = id;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
    }

    public int getId() { return id; }
    public String getProductName() { return productName; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public float getPrice() { return price; }
    public String getImage() { return image; }

    public float getTotalPrice() {
        return price * quantity;
    }
}
