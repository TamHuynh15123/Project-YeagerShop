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
                    <a href="Menuhome.jsp" class="hover:text-gray-400">Trang chủ</a>
                    <!-- Sản phẩm -->
                    <div class="relative inline-block group ml-4">
                        <a href="#" class="cursor-pointer px-4 py-2 hover:text-gray-400 focus:outline-none">
                            Sản phẩm
                        </a>
                        <div class="absolute hidden group-hover:block group-focus-within:block bg-gray-800 text-white mt-2 rounded-lg shadow-lg min-w-[180px] z-50">
                            <a href="/sanpham/all" class="block px-4 py-2 hover:bg-gray-700">Quần áo</a>
                            <a href="/sanpham/new" class="block px-4 py-2 hover:bg-gray-700">Phụ kiện</a>
                            <a href="/sanpham/sale" class="block px-4 py-2 hover:bg-gray-700">Mô hình</a>
                        </div>
                    </div>
                    <a href="about.jsp" class="hover:text-gray-400">Giới thiệu</a>
                    <!-- Khối Liên hệ -->
                    <div class="relative inline-block group">
                        <!-- Nút Liên hệ -->
                        <a href="#" class="cursor-pointer px-4 py-2 hover:text-gray-400 focus:outline-none">
                            Liên hệ
                        </a>

                        <!-- Dropdown menu: Facebook - Zalo - Email -->
                        <div class="absolute hidden group-hover:block group-focus-within:block bg-gray-800 text-white mt-2 rounded-lg shadow-lg min-w-[160px] z-50">
                            <a href="https://facebook.com/yourpage" target="_blank" class="block px-4 py-2 hover:bg-gray-700">Facebook</a>
                            <a href="https://zalo.me/yourid" target="_blank" class="block px-4 py-2 hover:bg-gray-700">Zalo</a>
                            <a href="mailto:yourmail@example.com" class="block px-4 py-2 hover:bg-gray-700">Email</a>
                        </div>
                    </div>







                </nav>
                <div class="flex items-center space-x-4">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <span style="color: red">
                                <p style="font-style: oblique">Welcome ${sessionScope.user.name}</p>
                            </span>
                            <!-- Đảm bảo gọi đúng action logout -->
                            <a href="TrangChu?action=logout" class="hover:text-gray-400">
                                <i class="fas fa-sign-out-alt"></i> Đăng xuất
                            </a>
                            <a href="#" class="hover:text-gray-400">
                                <i class="fas fa-shopping-cart"></i> Giỏ hàng
                            </a>
                        </c:when>

                        <c:otherwise>
                            <a href="login.jsp" class="hover:text-gray-400">
                                <i class="fas fa-sign-in-alt"></i> Đăng nhập
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </header>
    </body>
</html>
