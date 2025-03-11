<%-- 
    Document   : search
    Created on : Mar 4, 2025, 10:16:26 PM
    Author     : dangk
--%>
<%@page import="dto.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search Projects</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 0;
                padding: 20px;
            }
            h1 {
                color: #333;
            }
            form {
                margin-bottom: 15px;
            }
            .search-input {
                padding: 8px;
                width: 250px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }
            .search-btn {
                padding: 8px 12px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .search-btn:hover {
                background-color: #0056b3;
            }
            table {
                width: 90%;
                max-width: 1000px;
                border-collapse: collapse;
                background-color: white;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            .update-btn {
                color: white;
                background-color: #28a745;
                font-weight: bold;
                cursor: pointer;
                border: none;
                padding: 6px 12px;
                border-radius: 5px;
                text-decoration: none;
                display: inline-block;
            }
            .update-btn:hover {
                background-color: #218838;
            }
            .logout-btn {
                padding: 8px 12px;
                background-color: #dc3545;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
            }
            .logout-btn:hover {
                background-color: #c82333;
            }
            .message {
                color: red;
                margin-bottom: 10px;
            }
        </style>
    </head>

    <body> 

        <%-- Check if user is logged in --%>
        <%
            UserDTO user = (UserDTO) session.getAttribute("user");
            if (user != null) {
        %>

        <h1>Welcome, <%=user.getName()%></h1>

        <%-- Logout Form --%>
        <form action="TrangChu" method="post">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="logout-btn">Logout</button>
        </form>

        <%-- Display message if available --%>
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
            <div class="message"><%= message %></div>
        <%
                session.removeAttribute("message");
            }
        %>

        <%-- Search form --%>
        <%
            String searchTerm = (String) request.getAttribute("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
        %>

        <form action="TrangChu" method="post">
            <input type="hidden" name="action" value="search"/>
            <label for="searchInput">Search Project:</label>
            <input type="text" id="searchInput" name="searchName" value="<%=searchTerm%>" class="search-input" placeholder="Enter project name"/>
            <input type="submit" value="Search" class="search-btn"/>
        </form>

        <%-- Product List --%>
        <%
            List<ProductsDTO> products = (List<ProductsDTO>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
        %>

            <table>
                <thead>
                    <tr>
                        <th>Project ID</th>
                        <th>Project Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <% if (user.getRoleID().equals("admin")) { %>
                            <th>Action</th>
                        <% } %>
                    </tr>
                </thead>
                <tbody>
                    <% for (ProductsDTO p : products) { %>
                        <tr>
                            <td><%= p.getProductId() %></td>
                            <td><%= p.getProductName() %></td>
                            <td><%= p.getDescription() %></td>
                            <td><%= p.getPrice() %></td>
                            <td><%= p.getQuantity() %></td>
                            <% if (user.getRoleID().equals("admin")) { %>
                                <td>
                                    <form action="update.jsp" method="get">
                                        <input type="hidden" name="projectId" value="<%= p.getProductId() %>">
                                        <button type="submit" class="update-btn">Update</button>
                                    </form>
                                </td>
                            <% } %>
                        </tr>
                    <% } %>
                </tbody>
            </table>

        <%-- No projects found --%>
        <% } else { %>
            <div>No projects found!</div>
        <% } %>

        <%-- If user is not logged in, redirect or show login message --%>
        <% } else { %>
            <h2>You are not logged in. Please <a href="login.jsp">login</a>.</h2>
        <% } %>

    </body>
</html>
