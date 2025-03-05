<%-- 
    Document   : project
    Created on : Mar 4, 2025, 10:32:18 PM
    Author     : dangk
--%>
<%@page import="dto.ProjectDTO"%>
<%@page import="dto.UserDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                flex-direction: column;
            }
            .container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                text-align: center;
            }
            h1 {
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            label {
                font-weight: bold;
                margin-top: 10px;
                display: block;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }
            .error-message {
                color: red;
                font-size: 12px;
                margin-top: 5px;
            }
            input[type="submit"], input[type="reset"] {
                margin-top: 15px;
                padding: 10px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            input[type="submit"] {
                background-color: #28a745;
                color: white;
            }
            input[type="reset"] {
                background-color: #dc3545;
                color: white;
            }
            input[type="submit"]:hover {
                background-color: #218838;
            }
            input[type="reset"]:hover {
                background-color: #c82333;
            }
            .back-link {
                display: block;
                margin-top: 15px;
                text-decoration: none;
                color: blue;
            }
        </style>

    </head>
    <body>
        <% if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO) session.getAttribute("user");
                if (user.getRole().equals("Founder")) {
        %>
        <%
            ProjectDTO project = (ProjectDTO) request.getAttribute("project");
            if (project == null) {
                project = new ProjectDTO();
            }

            // Lấy lỗi từ request
            String txtProjectID_error = (String) request.getAttribute("txtProjectID_error");
            String txtProjectName_error = (String) request.getAttribute("txtProjectName_error");
            String txtEstimatedLaunch_error = (String) request.getAttribute("txtEstimatedLaunch_error");

            // Tránh lỗi null bằng cách thay thế bằng chuỗi rỗng
            txtProjectID_error = (txtProjectID_error == null) ? "" : txtProjectID_error;
            txtProjectName_error = (txtProjectName_error == null) ? "" : txtProjectName_error;
            txtEstimatedLaunch_error = (txtEstimatedLaunch_error == null) ? "" : txtEstimatedLaunch_error;

            // Lấy giá trị nhập trước đó
            String projectID = (String) request.getAttribute("txtProjectID");
            String projectName = (String) request.getAttribute("txtProjectName");
            String description = (String) request.getAttribute("txtDescription");
            String status = (String) request.getAttribute("txtStatus");
            String estimatedLaunch = (String) request.getAttribute("txtEstimatedLaunch");

            projectID = (projectID == null) ? "" : projectID;
            projectName = (projectName == null) ? "" : projectName;
            description = (description == null) ? "" : description;
            status = (status == null) ? "" : status;
            estimatedLaunch = (estimatedLaunch == null) ? "" : estimatedLaunch;
        %>

        <h1>Project Information</h1>
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <div style="color: red"><%=message%></div>
        <%
                session.removeAttribute("message");
            }
        %>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="add"/>

            <label for="txtProjectID">Project ID:</label>
            <input type="text" id="txtProjectID" name="txtProjectID" value="<%=projectID%>"/><br/>
            <% if (!txtProjectID_error.isEmpty()) {%>
            <div class="error-message"><%=txtProjectID_error%></div>
            <% }%>

            <label for="txtProjectName">Project Name:</label>
            <input type="text" id="txtProjectName" name="txtProjectName" value="<%=projectName%>"/><br/>
            <% if (!txtProjectName_error.isEmpty()) {%>
            <div class="error-message"><%=txtProjectName_error%></div>
            <% }%>

            <label for="txtDescription">Description:</label>
            <input type="text" id="txtDescription" name="txtDescription" value="<%=description%>"/><br/>


            <label for="status">Status:</label>
            <select id="status" name="txtStatus">
                <option value="Ideation" <%= status.equals("Ideation") ? "selected='selected'" : ""%>>Ideation</option>
                <option value="Development" <%= status.equals("Development") ? "selected='selected'" : ""%>>Development</option>
                <option value="Scaling" <%= status.equals("Scaling") ? "selected='selected'" : ""%>>Scaling</option>
                <option value="Launch" <%= status.equals("Launch") ? "selected='selected'" : ""%>>Launch</option>
            </select> <br/>


            <label for="txtEstimatedLaunch">Estimated Launch:</label>
            <input type="date" id="txtEstimatedLaunch" name="txtEstimatedLaunch" value="<%=estimatedLaunch%>"/><br/>
            <% if (!txtEstimatedLaunch_error.isEmpty()) {%>
            <div class="error-message"><%=txtEstimatedLaunch_error%></div>
            <% } %>

            <input type="submit" value="Save" />
            <input type="reset" value="Reset"/>

        </form>
        <a href="MainController?action=search" class="back-link">Back to List</a>

        <%} else {%>

        <h1>403 Error</h1>
        <p>You do not have permission to access this content!</p>
        <a href="MainController?action=search" class="back-link">Back to List</a>

        <%}
        } else {%>

        <h1>Access Denied</h1>
        <p>Please log in to access this page.</p>
        <a href="login.jsp" class="back-link">Go to Login</a>

        <%}%>
        
    </body>
</html>
