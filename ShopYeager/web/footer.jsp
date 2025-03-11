<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : footer
    Created on : Feb 28, 2025, 12:54:27 PM
    Author     : dangk
--%>

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
    }

    .footer-logo {
        width: 100px;
    }

    .footer-title {
        margin: 0;
    }

    .footer-links a {
        color: #fff;
        text-decoration: none;
        margin: 0 10px;
    }

    .footer-links a:hover {
        text-decoration: underline;
    }

    .footer-social img {
        width: 24px;
        margin: 5px;
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <img src="img/logo2.png" alt="Logo" class="footer-logo">
        <h2 class="footer-title">YeagerShop</h2>
        <p>&copy; 2025 - Mọi quyền được bảo lưu.</p>

        <div class="footer-links">
            <a href="#">Giới thiệu</a> |
            <a href="#">Chính sách bảo mật</a> |
            <a href="#">Điều khoản sử dụng</a> |
            <a href="#">Liên hệ</a>
        </div>

        <div class="footer-social">
            <a href="#"><img src="img/icons8-facebook-60.png" alt="Facebook"></a>
            <a href="#"><img src="img/icons8-tiktok-50.png" alt="Tiktok"></a>
            <a href="#"><img src="img/icons8-instagram-48.png" alt="Instagram"></a>
        </div>
    </div>
</footer>
