<%-- 
    Document   : login
    Created on : Feb 12, 2025, 8:42:33 PM
    Author     : dkhoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: linear-gradient(135deg, darkblue, white);
            }

            .login-container {
                background: white;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 350px;
            }

            .login-container h2 {
                margin-bottom: 15px;
                color: #333;
            }

            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 14px;
            }

            .login-container input[type="submit"] {
                width: 100%;
                padding: 12px;
                background: #5a67d8;
                border: none;
                border-radius: 8px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: 0.3s;
            }

            .login-container input[type="submit"]:hover {
                background: #434190;
            }

            .error-message {
                color: red;
                font-size: 14px;
                margin-top: 10px;
            }

            .register-link {
                margin-top: 15px;
                font-size: 14px;
            }

            .register-link a {
                color: #5a67d8;
                text-decoration: none;
                font-weight: bold;
            }

            .register-link a:hover {
                text-decoration: underline;
            }
            .home-button {
                margin-top: 10px;
                padding: 12px;
                width: 100%;
                border: none;
                border-radius: 8px;
                background: #ccc;
                font-size: 16px;
                cursor: pointer;
                transition: 0.3s;
            }

            .home-button:hover {
                background: #999;
            }

        </style>
    </head>
    <body>

        <div class="login-container">
            <h2>Sign In</h2>
            <form action="TrangChu" method="POST">
                <input type="hidden" name="action" value="login">
                <input type="text" name="txtUserID" placeholder="User Id" required>
                <input type="password" name="txtPassword" placeholder="Password" required>
                <input type="submit" value="Login">
            </form>
            <p style="color:red">${message}</p>

            <div class="register-link">
                Don't have an account? <a href="signUp.jsp">Sign up</a>
            </div>

        </div>

    </body>
</html>