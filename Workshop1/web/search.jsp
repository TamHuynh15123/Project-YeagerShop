<%-- 
    Document   : search
    Created on : Mar 4, 2025, 10:16:26 PM
    Author     : dangk
--%><%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-16WWW">
        <title>JSP Page</title>
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
        </style>

    </head>
    <body> 

        <% if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO) session.getAttribute("user");
        %>
        <h1>Welcome <%=user.getName()%></h1>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="logout">
            <button type="submit">Logout</button>
        </form>

        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <div style="color: red"><%=message%></div>
        <%
                session.removeAttribute("message");
            }
        %>

        <%
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>

        <% if (user.getRole().equals("Founder")) {%>
        <form action="MainController">
            <input type="hidden" name="action" value="search"/>
            <label for="searchInput">Search Project:</label>
            <input type="text" id="searchInput" name="searchTerm" value="<%=searchTerm%>" class="search-input" placeholder="Enter project name"/>
            <input type="submit" value="Search" class="search-btn"/>
        </form>

        <form action="project.jsp" method="get" style="margin-top: 10px;">
            <button type="submit" style="background-color: green; color: white; padding: 10px 15px; border: none; cursor: pointer; font-size: 16px; border-radius: 5px;">
                Add Project
            </button>
        </form>
        <% } %>

        <%
            if (request.getAttribute("projects") != null) {
                List<ProjectDTO> projects = (List<ProjectDTO>) request.getAttribute("projects");
        %>

        <table>
            <thead>
                <tr>
                    <th>Project ID</th>
                    <th>Project Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Estimated Launch</th>
                    <th>Active</th> <!-- Thêm cột Active -->
                        <% if (user.getRole().equals("Founder")) { %>
                    <th>Action</th>
                        <% } %>
                </tr>
            </thead>
            <tbody>
                <% for (ProjectDTO p : projects) {%>
                <tr>
                    <td><%= p.getProjectId()%></td>
                    <td><%= p.getProjectName()%></td>
                    <td><%= p.getDescription()%></td>
                    <td><%= p.getStatus()%></td>
                    <td><%= p.getEstimatedLaunch()%></td>
                    <td><%= p.getActive() == 1 ? "Yes" : "No"%></td> 

                    <% if (user.getRole().equals("Founder")) {%>
                    <td>
                        <!-- Update Button -->
                        <form action="update.jsp" method="get" style="display: inline;">
                            <input type="hidden" name="projectId" value="<%= p.getProjectId()%>">
                            <button type="submit" class="update-btn">Update</button>
                        </form>
                    </td>
                    <% } %>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% } %>
        <% }%>
    </body>
</html>
