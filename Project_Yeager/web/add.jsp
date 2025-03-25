<%-- 
    Document   : add
    Created on : Mar 24, 2025, 10:45:31 PM
    Author     : dangk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    <c:choose>
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
                                    <a href="manageAccount.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-200">
                                        Quản lý tài khoản
                                    </a>
                                    <a href="MainController?action=logout" class="block px-4 py-2 text-gray-700 hover:bg-gray-200">
                                        Đăng xuất
                                    </a>
                                </div>
                            </div>
                            <a href="#" class="hover:text-gray-400">
                                <i class="fas fa-shopping-cart"></i> Giỏ hàng
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
        </header>

        <div class="max-w-lg mx-auto bg-gray-800 p-6 rounded-lg shadow-lg mt-10">
            <h2 class="text-2xl font-semibold mb-4 text-center">Add New Product</h2>

            <form action="MainController" method="post" class="space-y-4">
                <!-- Product Name -->
                <div>
                    <label for="txtproductname" class="block text-sm font-medium">Product Name:</label>
                    <input type="text" id="txtproductname" name="txtproductname" required 
                           class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>

                <!-- Description -->
                <div>
                    <label for="txtdescription" class="block text-sm font-medium">Description:</label>
                    <textarea id="txtdescription" name="txtdescription" rows="3"
                              class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>
                </div>

                <!-- Type -->
                <div>
                    <label for="txttype" class="block text-sm font-medium">Type:</label>
                    <select id="txttype" name="txttype" required 
                            class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400">
                        <option value="Phụ kiện">Phụ kiện</option>
                        <option value="Balo/Áo khoác">Balo/Áo khoác</option>
                        <option value="Mô hình">Mô hình</option>
                    </select>
                </div>

                <!-- Quantity & Price (Chia thành 2 cột) -->
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label for="txtquantity" class="block text-sm font-medium">Quantity:</label>
                        <input type="number" id="txtquantity" name="txtquantity" min="0" required 
                               class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400">
                    </div>
                    <div>
                        <label for="txtprice" class="block text-sm font-medium">Price:</label>
                        <input type="number" id="txtprice" name="txtprice" step="0.01" required 
                               class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400">
                    </div>
                </div>

                <!-- Image URL -->
                <div>
                    <label for="txtimage" class="block text-sm font-medium">Image URL:</label>
                    <input type="text" id="txtimage" name="txtimage"
                           class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>

                <!-- Status -->
                <div>
                    <label for="txtstatus" class="block text-sm font-medium">Status:</label>
                    <select id="txtstatus" name="txtstatus" 
                            class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400">
                        <option value="true">Active</option>
                        <option value="false">Inactive</option>
                    </select>
                </div>

                <!-- Hidden Input -->
                <input type="hidden" name="action" value="add"/>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" 
                            class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded shadow-md transition duration-200">
                        Thêm sản phẩm
                    </button>
                </div>
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
