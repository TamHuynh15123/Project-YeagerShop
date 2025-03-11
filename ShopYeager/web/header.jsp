<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>YeagerShop</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body class="bg-gray-900 text-white">
        <!-- Header -->
        <header class="bg-gray-800 text-white">
            <div class="container mx-auto flex justify-between items-center py-4 px-6">
                <div class="flex items-center">
                    <img src="img/logo2.png" alt="YeagerShop logo" width="60" height="60"/>
                    <span class="ml-3 text-4xl font-bold">YeagerShop</span>
                </div>
                <nav class="space-x-4">
                    <a href="#" class="hover:text-gray-400">Trang chủ</a>
                    <a href="#" class="hover:text-gray-400">Sản phẩm</a>
                    <a href="#" class="hover:text-gray-400">Giới thiệu</a>
                    <a href="#" class="hover:text-gray-400">Liên hệ</a>
                </nav>
                <div class="flex items-center space-x-4">
                    <c:choose>
                        <c:when test="${not empty user}">
                            <span style=" color: red">
                                <p style="font-style: oblique" >Welcome ${user.name}</p>
                            </span>
                            
                            <a href="TrangChu" class="hover:text-gray-400"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                            <a href="#" class="hover:text-gray-400"><i class="fas fa-shopping-cart"></i> Giỏ hàng</a>
                        </c:when>
                            
                        <c:otherwise>
                            <a href="#" class="hover:text-gray-400"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>

                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </header>
    </body>
</html>
