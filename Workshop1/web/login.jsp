<%-- 
    Document   : login
    Created on : Mar 4, 2025, 9:59:16 PM
    Author     : dangk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .login-container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }
            h2 {
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 15px;
                text-align: left;
            }
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
            input {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }
            .submit-btn {
                background-color: #28a745;
                color: white;
                border: none;
                padding: 10px;
                width: 100%;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            .submit-btn:hover {
                background-color: #218838;
            }
            .error-message {
                color: red;
                margin-top: 10px;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Sign in</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login" />

                <div class="form-group">
                    <label for="userId">Username</label>
                    <input type="text" id="userId" name="txtUserID" required />
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="txtPassword" required />
                </div>

                <button type="submit" class="submit-btn">Log in</button>

                <% String message = (String) request.getAttribute("message"); %>
                <% if (message != null) { %>
                    <div class="error-message"><%= message %></div>
                <% } %>
            </form>
        </div>
    </body>
</html>
