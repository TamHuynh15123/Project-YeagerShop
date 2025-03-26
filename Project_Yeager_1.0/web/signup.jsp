<%-- 
    Document   : singup
    Created on : Mar 24, 2025, 10:55:32 PM
    Author     : dangk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <style>
            /* Căn giữa trang */
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-image: url('img logo/background.jpg');
                background-size: cover;
                background-position: center;
                font-family: Arial, sans-serif;
                margin: 0;
            }

            /* Form đăng ký */
            .register-container {
                background: rgba(0, 0, 0, 0.8);
                padding: 20px;
                border-radius: 10px;
                width: 350px;
                text-align: center;
                color: white;
                box-shadow: 0 4px 8px rgba(255, 255, 255, 0.2);
            }

            .register-container h2 {
                margin-bottom: 15px;
                color: #ffcc00;
            }

            /* Input */
            .register-container input {
                width: calc(100% - 20px); /* Đảm bảo input không bị lệch */
                padding: 10px;
                margin: 10px 0;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box;
                
            }

            /* Nút Sign Up */
            .signup-btn {
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

            .signup-btn:hover {
                background: #ff9900;
            }

            /* Link Login */
            .login-link {
                margin-top: 10px;
                color: #ffcc00;
                text-decoration: none;
                font-weight: bold;
            }

            .login-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="register-container">
            <h2>Register New User</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="signup">

                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required/>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required/>

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required/>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required/>

                <label for="confirm">Confirm Password:</label>
                <input type="password" id="confirm" name="confirm" required/>

                <input type="submit" value="Sign Up" class="signup-btn"/>
            </form>

            <p>Already have an account?</p>
            <a href="login.jsp" class="login-link">Back to Login</a>

            <%-- Hiển thị lỗi hoặc thành công --%>
            <%
                String signupError = (String) request.getAttribute("signupError");
                String signupSuccess = (String) request.getAttribute("signupSuccess");
                if (signupError != null) {
            %>
            <p style="color:red;"><%= signupError%></p>
            <% } else if (signupSuccess != null) {%>
            <p style="color:green;"><%= signupSuccess%></p>
            <% }%>
        </div>
    </body>
</html>

