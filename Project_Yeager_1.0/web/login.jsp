<%-- 
    Document   : login
    Created on : Mar 24, 2025, 4:44:00 PM
    Author     : dangk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            /* Căn giữa trang */
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-image: url('img logo/background.jpg'); /* Thay bằng ảnh anime bạn thích */
                background-size: cover;
                background-position: center;
                font-family: Arial, sans-serif;
                margin: 0;
            }

            /* Form đăng nhập */
            .login-container {
                background: rgba(0, 0, 0, 0.8);
                padding: 20px;
                border-radius: 10px;
                width: 350px;
                text-align: center;
                color: white;
                box-shadow: 0 4px 8px rgba(255, 255, 255, 0.2);
            }

            .login-container h2 {
                margin-bottom: 15px;
                color: #ffcc00; /* Màu vàng nổi bật */
            }

            /* Input */
            .login-container input {
                width: calc(100% - 20px);

                padding: 10px;
                margin: 10px 0;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box; /* Đảm bảo input không bị lệch */
                
            }

            /* Nút Login */
            .login-btn {
                width: 100%;
                background: #ffcc00;
                color: black;
                font-size: 18px;
                font-weight: bold;
                border: none;
                padding: 10px;
                cursor: pointer;
                border-radius: 5px;
                transition: 0.3s;
            }

            .login-btn:hover {
                background: #ff9900;
            }

            /* Link đăng ký */
            .signup-link {
                margin-top: 10px;
                color: #ffcc00;
                text-decoration: none;
                font-weight: bold;
            }

            .signup-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Đăng Nhập</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login">
                <input type="text" name="txtusername" placeholder="Tên đăng nhập" required/>
                <input type="password" name="txtpassword" placeholder="Mật khẩu" required/>
                <input type="submit" value="Đăng Nhập" class="login-btn"/>
                <%
                    String message = request.getAttribute("message") + "";
                %>
                <p style="color: red;"><%=message.equals("null") ? "" : message%></p>
            </form>
            <p>Chưa có tài khoản?</p>
            <a href="signup.jsp" class="signup-link">Đăng Ký Ngay</a>
        </div>

    </body>
</html>
