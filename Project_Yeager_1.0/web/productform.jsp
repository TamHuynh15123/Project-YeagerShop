<%@page import="dto.productDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    productDTO product = (productDTO) request.getAttribute("product");
    String txtQuantityError = (String) request.getAttribute("txtQuantity_error");

    int id = (product != null) ? product.getId() : 0;
    String productname = (product != null) ? product.getProductname() : "";
    String description = (product != null) ? product.getDescription() : "";
    int quantity = (product != null) ? product.getQuantity() : 0;
    float price = (product != null) ? product.getPrice() : 0;
    String srcimg = (product != null) ? product.getSrcimg() : "";
    boolean status = (product != null) ? product.isStatus() : true;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white flex items-center justify-center h-screen">
    <div class="bg-gray-800 p-8 rounded-lg shadow-lg w-96">
        <h2 class="text-2xl font-bold mb-4 text-center">Update Product</h2>
        <form action="MainController" method="post" class="space-y-4">
            <input type="hidden" name="txtid" value="<%= id%>"/>

            <label class="block">Product Name:</label>
            <input type="text" name="txtproductname" value="<%= productname%>" class="w-full p-2 rounded bg-gray-700 text-white" readonly/>

            <label class="block">Description:</label>
            <textarea name="txtdescription" rows="4" class="w-full p-2 rounded bg-gray-700 text-white"><%= description%></textarea>

            <label class="block">Quantity:</label>
            <input type="number" name="txtquantity" value="<%= quantity%>" min="0" required class="w-full p-2 rounded bg-gray-700 text-white"/>
            <% if (txtQuantityError != null) { %>
                <span class="text-red-500"><%= txtQuantityError%></span>
            <% } %>

            <label class="block">Price:</label>
            <input type="number" name="txtprice" step="0.01" value="<%= price%>" required class="w-full p-2 rounded bg-gray-700 text-white"/>

            <label class="block">Image URL:</label>
            <input type="text" name="txtimage" value="<%= srcimg%>" class="w-full p-2 rounded bg-gray-700 text-white"/>

            <% if (!srcimg.isEmpty()) { %>
                <img src="<%= srcimg%>" alt="Product Image" class="w-full h-40 object-cover rounded mt-2"/>
            <% } %>

            <label class="block">Status:</label>
            <select name="txtstatus" class="w-full p-2 rounded bg-gray-700 text-white">
                <option value="true" <%= status ? "selected" : "" %>>Active</option>
                <option value="false" <%= !status ? "selected" : "" %>>Inactive</option>
            </select>

            <input type="hidden" name="action" value="update"/>
            <button type="submit" class="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Update Product</button>
        </form>
        <a href="MainController?action=search" class="block text-center text-gray-400 mt-4 hover:text-white">Back to Home</a>
    </div>
</body>
</html>
