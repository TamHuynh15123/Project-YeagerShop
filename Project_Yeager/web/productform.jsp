<%@page import="dto.productDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    productDTO product = (productDTO) request.getAttribute("product");
    String txtQuantityError = (String) request.getAttribute("txtQuantity_error");

    int id = (product != null) ? product.getId() : 0;
    String productname = (product != null) ? product.getProductname() : "";
    String description = (product != null) ? product.getDescription() : "";
    String type = (product != null) ? product.getType() : "";
    int quantity = (product != null) ? product.getQuantity() : 0;
    float price = (product != null) ? product.getPrice() : 0;
    String srcimg = (product != null) ? product.getSrcimg() : "";
    boolean status = (product != null) ? product.isStatus() : true;
%>

<html>
    <head>
        <title>Product Form</title>
    </head>
    <body>
        <h2>Update Product</h2>

        <form action="MainController" method="post">
            <input type="hidden" name="txtid" value="<%= id%>"/>

            <label for="txtproductname">Product Name:</label><br/>
            <input type="text" id="txtproductname" name="txtproductname" value="<%= productname%>" readonly/><br/><br/>

            <label for="txtdescription">Description:</label><br/>
            <textarea id="txtdescription" name="txtdescription" rows="4" cols="50"><%= description%></textarea><br/><br/>

            <label for="txttype">Type:</label><br/>
            <select id="txttype" name="txttype" required>
                <option value="Phụ kiện" <%= "Phụ kiện".equals(type) ? "selected" : ""%>>Phụ kiện</option>
                <option value="Balo/Áo khoác" <%= "Balo/Áo khoác".equals(type) ? "selected" : ""%>>Balo/Áo khoác</option>
                <option value="Mô hình" <%= "Mô hình".equals(type) ? "selected" : ""%>>Mô hình</option>
            </select><br/><br/>

            <label for="txtquantity">Quantity:</label><br/>
            <input type="number" id="txtquantity" name="txtquantity" value="<%= quantity%>" min="0" required/>
            <% if (txtQuantityError != null) {%>
            <span style="color:red;"><%= txtQuantityError%></span>
            <% }%><br/><br/>

            <label for="txtprice">Price:</label><br/>
            <input type="number" id="txtprice" name="txtprice" step="0.01" value="<%= price%>" required/><br/><br/>

            <label for="txtimage">Image URL:</label><br/>
            <input type="text" id="txtimage" name="txtimage" value="<%= srcimg%>"/><br/><br/>

            <label for="txtstatus">Status:</label><br/>
            <select id="txtstatus" name="txtstatus">
                <option value="true" <%= status ? "selected" : ""%>>Active</option>
                <option value="false" <%= !status ? "selected" : ""%>>Inactive</option>
            </select><br/><br/>

            <input type="hidden" name="action" value="update"/>
            <input type="submit" value="Update Product"/>
        </form>


        <br/>
        <a href="MainController?action=search">Back to Product List</a>
    </body>
</html>
