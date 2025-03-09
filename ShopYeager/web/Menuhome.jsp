<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductsDTO" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<ProductsDTO> products = (List<ProductsDTO>) request.getAttribute("products");
    if (products == null) {
        products = new ArrayList<>();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ</title>
</head>
<body>
    <h1>Danh sách sản phẩm</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Hình ảnh</th>
        </tr>
        <% for (ProductsDTO product : products) { %>
        <tr>
            <td><%= product.getProductId() %></td>
            <td><%= product.getProductName() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getQuantity() %></td>
            <td><img src="img-product/z6384371496530_f97322e5d8ae2680b72018eec8642c3b.jpg" width="100" height="100"/></td>
        </tr>
        <% } %>
    </table>

    <form action="TrangChu" method="POST">
        <input type="hidden" name="action" value="logout">
        <input type="submit" value="Log out">
    </form>
</body>
</html>
