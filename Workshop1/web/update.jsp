<%-- 
    Document   : update
    Created on : Mar 5, 2025, 10:30:16 AM
    Author     : dangk
--%>
<%@page import="dao.ProjectDAO"%>
<%@page import="dto.ProjectDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("projectId");
    ProjectDAO dao = new ProjectDAO();
    ProjectDTO project = dao.readbyID(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Project</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }
            h2 {
                color: #333;
            }
            form {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: left;
            }
            label {
                font-weight: bold;
                display: block;
                margin-top: 10px;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px;
                font-size: 16px;
                cursor: pointer;
                border-radius: 5px;
                margin-top: 15px;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            span {
                font-size: 12px;
                color: red;
            }
            p {
                font-size: 14px;
                margin-top: 10px;
            }
        </style>

    </head>
    <body>
        <h2>Update Project</h2>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="updateProject">
            <input type="hidden" name="projectId" value="<%= project.getProjectId()%>">

            Project Name: <input type="text" name="projectName" value="<%= project.getProjectName()%>">
            <span style="color: red;"><%= request.getAttribute("projectName_error") != null ? request.getAttribute("projectName_error") : ""%></span>
            <br>

            Description: <input type="text" name="description" value="<%= project.getDescription()%>">
            <br>

            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="Ideation" <%= project.getStatus().equals("Ideation") ? "selected" : ""%>>Ideation</option>
                <option value="Development" <%= project.getStatus().equals("Development") ? "selected" : ""%>>Development</option>
                <option value="Scaling" <%= project.getStatus().equals("Scaling") ? "selected" : ""%>>Scaling</option>
                <option value="Launch" <%= project.getStatus().equals("Launch") ? "selected" : ""%>>Launch</option>
            </select> 
            <br>

            Estimated Launch: <input type="date" name="estimatedLaunch" value="<%= project.getEstimatedLaunch()%>">
            <span style="color: red;"><%= request.getAttribute("estimatedLaunch_error") != null ? request.getAttribute("estimatedLaunch_error") : ""%></span>
            <br>

            <label for="active">Active:</label>
            <select id="active" name="active">
                <option value="1" <%= project.getActive() == 1 ? "selected" : ""%>>Yes</option>
                <option value="0" <%= project.getActive() == 0 ? "selected" : ""%>>No</option>
            </select>
            <span style="color: red;"><%= request.getAttribute("active_error") != null ? request.getAttribute("active_error") : ""%></span>
            <br>

            <input type="submit" value="Save">
        </form>

        <p style="color: green;"><%= session.getAttribute("message") != null ? session.getAttribute("message") : ""%></p>
        <% session.removeAttribute("message");%>
    </body>
</html>
