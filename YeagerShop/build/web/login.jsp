<%-- 
    Document   : login
    Created on : 13/02/2025, 10:52:04 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .login-container {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .login-container {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    .input-group {
        margin-bottom: 15px;
        text-align: left;
    }

    .input-group label {
        font-size: 14px;
        color: #555;
    }

    .input-group input {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }

    .login-btn {
        width: 100%;
        padding: 10px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .login-btn:hover {
        background: #0056b3;
    }</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="login-container">
            <h2>Đăng Nhập</h2>
            <form action="your_login_script.jsp" method="post">
                <input type="hidden" name="action" value="login"/>

                <div class="input-group">
                    <label for="txtUserID">UserID</label>
                    <input type="text" id="txtUserID" name="txtUserID" required />
                </div>

                <div class="input-group">
                    <label for="txtPassword">Password</label>
                    <input type="password" id="txtPassword" name="txtPassword" required />
                </div>

                <input type="submit" value="Login" class="login-btn" />
            </form>
        </div>
    </body>
</html>
