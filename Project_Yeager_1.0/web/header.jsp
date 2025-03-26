<%-- 
    Document   : header
    Created on : 25/03/2025, 8:39:15 AM
    Author     : HP
--%>
<%@page import="utils.AuthUtils"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>YeagerShop</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


    </head>
    <body>
        <header class="bg-gray-800 text-white">
            <div class="container mx-auto flex justify-between items-center py-4 px-6">
                <div class="flex items-center">
                    <img src="img logo/logo2.png" alt="YeagerShop logo" width="60" height="60"/>
                    <span class="ml-3 text-4xl font-bold">YeagerShop</span>
                </div>
                <nav class="space-x-4">
                    <a href="MainController?action=home" class="hover:text-gray-400">Trang chủ</a>
                    <!-- Sản phẩm -->
                    <div class="relative inline-block group">
                        <a href="#" class="cursor-pointer px-4 py-2 hover:text-gray-400 focus:outline-none">
                            Sản phẩm
                        </a>
                        <!-- Dropdown menu -->
                        <ul class="absolute hidden group-hover:block bg-gray-800 text-white mt-2 rounded-lg shadow-lg min-w-[160px] z-50">
                            <c:forEach items="${listC}" var="o">
                                <li>
                                    <a href="category?cid=${o.cid}" class="block px-4 py-2 hover:bg-gray-700 ${tag == o.cid ? 'active' : ''}">
                                        ${o.cname} <!-- Hiển thị tên danh mục -->
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
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
                                <p style="font-style: oblique">Welcome ${sessionScope.user.fullname}</p>
                            </span>
                            <div class="relative">
                                <!-- Avatar Button -->
                                <button id="avatarBtn" class="w-10 h-10 rounded-full overflow-hidden border-2 border-white focus:outline-none">

                                    <% if (AuthUtils.isAdmin(session)) { %>
                                    <img src="img logo/ava.jpg" alt="Admin Avatar" class="w-10 h-10 rounded-full cursor-pointer border border-gray-300 shadow-md">
                                    <%} else {%>
                                    <img src="img logo/avauser.jpg" alt="User Avatar" class="w-10 h-10 rounded-full cursor-pointer border border-gray-300 shadow-md">
                                    <% }%>
                                </button>

                                <!-- Dropdown Menu -->
                                <div id="avatarDropdown" class="absolute right-0 mt-2 w-40 bg-white shadow-lg rounded-md hidden z-50">
                                    <a href="manageAccount.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-200">
                                        Quản lý tài khoản
                                    </a>
                                    <a href="MainController?action=logout" class="block px-4 py-2 text-gray-700 hover:bg-gray-200">
                                        Đăng xuất
                                    </a>
                                </div>
                            </div>
                            <a href="MainController?action=viewcart" class="relative hover:text-gray-400">
                                <i class="fas fa-shopping-cart"></i> Giỏ hàng
                                <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs font-bold px-2 py-1 rounded-full">
                                    ${sessionScope.cartSize != null ? sessionScope.cartSize : 0}
                                </span>
                            </a>
                        </c:when>

                        <c:otherwise>
                            <a href="login.jsp" class="hover:text-gray-400">
                                <i class="fas fa-sign-in-alt"></i> Đăng nhập
                            </a>
                            <a href="signup.jsp" class="hover:text-gray-400">
                                <i class="fas fa-sign-in-alt"></i> Đăng ký
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
            <section class="relative w-full h-[400px]">
                <img class="absolute inset-0 w-full h-full object-cover object-center" src="img logo/banner.jpg" alt="Banner" />
                <div class="absolute inset-0 flex flex-col items-center justify-center text-white bg-black bg-opacity-50">
                    <h1 class="text-5xl font-bold drop-shadow-lg">
                        Welcome to Yeager Shop
                    </h1>

                </div>
            </section>
        </header>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const avatarBtn = document.getElementById("avatarBtn");
                const avatarDropdown = document.getElementById("avatarDropdown");

                avatarBtn.addEventListener("click", function (event) {
                    event.stopPropagation(); // Ngăn chặn sự kiện click lan ra ngoài
                    avatarDropdown.classList.toggle("hidden"); // Bật/tắt dropdown
                });

                // Ẩn dropdown khi click ra ngoài
                document.addEventListener("click", function (event) {
                    if (!avatarBtn.contains(event.target) && !avatarDropdown.contains(event.target)) {
                        avatarDropdown.classList.add("hidden");
                    }
                });
            });
        </script>
    </body>
</html>
