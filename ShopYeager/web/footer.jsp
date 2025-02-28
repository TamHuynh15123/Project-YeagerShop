<%-- 
    Document   : footer
    Created on : Feb 28, 2025, 12:54:27 PM
    Author     : dangk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .footer {
                position: relative;
                bottom: 0;
                background: #222;
                color: white;
                padding: 20px 0;
                text-align: center;
            }

            .footer-container {
                max-width: 1200px;
                margin: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .footer-logo {
                width: 100px;
                height: auto;
                margin-bottom: 10px;
            }

            .footer-title {
                margin: 5px 0;
            }

            .footer-description {
                max-width: 500px;
                font-size: 14px;
            }
        </style>
    </head>
    <body>

    </body>
    <footer class="footer">
        <div class="footer-container">
            <img src="img/logo2.png" alt="Logo Shop" class="footer-logo">
            <h2 class="footer-title">YeagerShop</h2>
            <p class="footer-description">Chúng tôi cung cấp những sản phẩm chất lượng tốt nhất với giá cả hợp lý.</p>
            <p><strong>Địa chỉ:</strong> 123 Đường ABC, Quận XYZ, Thành phố HCM</p>
            <p><strong>Email:</strong> Yeagershop@gmail.com</p>
            <p><strong>Điện thoại:</strong> 0123 456 789</p>
        </div>
    </footer>
</html>
