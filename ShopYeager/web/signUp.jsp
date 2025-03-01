<%-- 
    Document   : signUp
    Created on : 01/03/2025, 4:29:18 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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

            .register-container {
                background: white;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 320px;
            }

            .register-container h2 {
                margin-bottom: 15px;
            }

            .register-container input {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .register-container button {
                width: 100%;
                padding: 10px;
                background: darkblue;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 10px;
            }

            .register-container button:hover {
                background: navy;
            }

            .register-container p {
                margin-top: 10px;
            }

            .register-container a {
                color: darkblue;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="register-container">
            <h2>Sign Up</h2>
            <form action="RegisterServlet" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="password" name="confirmPassword" placeholder="Confirm password" required>
                <button type="submit">Create account</button>
            </form>
            <p>Have an account? 
                <a href = "login.jsp">Login</a>
            </p>
    </head>
    <body>
        
    </body>
</html>
