<%-- 
    Document   : header
    Created on : Feb 28, 2025, 12:02:48 PM
    Author     : dangk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
            }

            header {
                top: 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                background-color: #222; 
                border-bottom: 2px solid #003f8a; 
                color: white;
            }

            .logo {
                display: flex;
                align-items: center;
            }

            .logo img {
                margin-right: 10px;
            }

            nav ul {
                display: flex;
                list-style: none;
            }

            nav ul li {
                margin: 0 15px;
            }

            nav ul li a {
                text-decoration: none;
                color: white;
                font-weight: bold;
            }

            .search-bar {
                display: flex;
                align-items: center;
            }

            .search-bar input {
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .search-bar button {
                margin-left: 5px;
                padding: 5px 10px;
                border: none;
                background-color: darkorange;
                color: white;
                cursor: pointer;
                border-radius: 5px;
            }

            .cart a {
                text-decoration: none;
                font-size: 18px;
                font-weight: bold;
                color: darkorange;
            }
            .login {
                margin-left: 15px;
            }

            .login a {
                text-decoration: none;
                font-size: 18px;
                font-weight: bold;
                color: darkorange;
            }
            .user-actions {
                display: flex;
                align-items: center;
            }

            .login, .cart {
                margin-left: 15px;
            }

        </style>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="img/logo2.png" height="50px">
                <h1>YeagerShop</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="#">Trang chủ</a></li>
                    <li><a href="#">Sản phẩm</a></li>
                    <li><a href="#">Giới thiệu</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </nav>
            <div class="search-bar">
                <input type="text" placeholder="Tìm kiếm...">
                <button type="submit">Tìm</button>
            </div>
            <div class="user-actions">
                <div class="login">
                    <a href="login.jsp">🔑 Đăng nhập</a>
                </div>
                <div class="cart">
                    <a href="#">🛒 Giỏ hàng</a>
                </div>
            </div>
        </header>
    </body>
</html>
