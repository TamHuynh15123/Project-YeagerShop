<%-- 
    Document   : manageAccount
    Created on : 26/03/2025, 9:39:05 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dto.userDTO" %>
<%@ page import="dao.userDAO" %>
<%@ page import="utils.AuthUtils" %>
<%@ page session="true" %>

<%
    if (!AuthUtils.isLoggedIn(session)) {
        response.sendRedirect("login.jsp");
        return;
    }

    userDTO user = (userDTO) session.getAttribute("user");
    String error = (String) request.getAttribute("error");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý tài khoản</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    
    <body class="bg-gray-900 text-white">
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

                    <c:when test="${not empty sessionScope.user}">
                        <span style="color: red">
                            <p style="font-style: oblique">Welcome ${sessionScope.user.fullname}</p>
                        </span>
                        <div class="relative">
                            <!-- Avatar Button -->
                            <button id="avatarBtn" class="w-10 h-10 rounded-full overflow-hidden border-2 border-white focus:outline-none">
                                <img src="img logo/ava.jpg" alt="User Avatar" class="w-10 h-10 rounded-full cursor-pointer border border-gray-300 shadow-md">
                            </button>

                            <!-- Dropdown Menu -->
                            <div id="avatarDropdown" class="absolute right-0 mt-2 w-40 bg-white shadow-lg rounded-md hidden">
                                
                                <a href="MainController?action=logout" class="block px-4 py-2 text-gray-700 hover:bg-gray-200">
                                    Đăng xuất
                                </a>
                            </div>
                        </div>
                        <a href="#" class="hover:text-gray-400">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </c:when>



                </div>

            </div>
        </header>
    <body class="bg-gray-100">
        <div class="max-w-lg mx-auto mt-10 p-6 bg-white rounded-lg shadow-md">
            <h2 class="text-xl font-bold mb-4">Quản lý tài khoản</h2>

            <%-- Hiển thị thông báo lỗi --%>
            <% if (error != null) {%>
            <div class="mb-4 p-3 bg-red-200 text-red-800 rounded">
                <%= error%>
            </div>
            <% } %>

            <%-- Hiển thị thông báo thành công --%>
            <% if (message != null) {%>
            <div class="mb-4 p-3 bg-green-200 text-green-800 rounded">
                <%= message%>
            </div>
            <% }%>

            <form action="MainController" method="post">
                <div class="mb-4">
                    <label class="block text-gray-700">Họ và Tên:</label>
                    <input type="text" name="fullName" value="<%= user.getFullname()%>" class="w-full px-3 py-2 border rounded">
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700">Email:</label>
                    <input type="email" name="email" value="<%= user.getEmail()%>" class="w-full px-3 py-2 border rounded" readonly>
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700">Mật khẩu mới:</label>
                    <input type="password" name="newPassword" class="w-full px-3 py-2 border rounded">
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700">Xác nhận mật khẩu:</label>
                    <input type="password" name="confirmPassword" class="w-full px-3 py-2 border rounded">
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700">Nhập mật khẩu hiện tại để xác nhận:</label>
                    <input type="password" name="currentPassword" required class="w-full px-3 py-2 border rounded">
                </div>

                <input type="hidden" name="userId" value="<%= user.getUsername()%>">

                <button type="submit" name="action" value="manage" class="w-full bg-blue-500 text-white py-2 rounded">
                    Cập nhật
                </button>
            </form>
            <div class="text-center mt-4">
                <a href="MainController?action=search" class="text-blue-400 hover:text-blue-300">
                    Trở về trang chủ
                </a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
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