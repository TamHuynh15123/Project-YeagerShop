<%@page import="java.util.List"%>
<%@page import="dto.CartItemDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Giỏ hàng</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <%@include file="header.jsp" %>

        <div class="container mx-auto py-8">
            <h1 class="text-2xl font-bold mb-4">Giỏ hàng của bạn</h1>

            <table class="w-full border-collapse bg-white shadow-md">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="border px-4 py-2">Hình ảnh</th>
                        <th class="border px-4 py-2">Tên sản phẩm</th>
                        <th class="border px-4 py-2">Giá</th>
                        <th class="border px-4 py-2">Số lượng</th>
                        <th class="border px-4 py-2">Tổng</th>
                        <th class="border px-4 py-2">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
                        float total = 0;
                        if (cart != null && !cart.isEmpty()) {
                            for (CartItemDTO item : cart) {
                                total += item.getTotalPrice();
                    %>
                    <tr>
                        <td class="border px-4 py-2">
                            <img src="<%= item.getImage() %>" width="50">
                        </td>
                        <td class="border px-4 py-2"><%= item.getProductName() %></td>
                        <td class="border px-4 py-2"><%= item.getPrice() %> đ</td>
                        <td class="border px-4 py-2"><%= item.getQuantity() %></td>
                        <td class="border px-4 py-2"><%= item.getTotalPrice() %> đ</td>
                        <td class="border px-4 py-2">
                            <a href="MainController?action=remove&pid=<%= item.getId() %>"
                               class="text-red-600">Xóa</a>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="6" class="text-center py-4">Giỏ hàng trống</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <div class="mt-4">
                <p class="text-xl font-bold">Tổng tiền: <%= total %> đ</p>
                <a href="MainController?action=checkout" class="bg-green-600 text-white px-4 py-2 rounded-lg">Thanh toán</a>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
