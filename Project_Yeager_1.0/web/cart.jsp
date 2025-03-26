<%@page import="dto.CartItemDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Giỏ hàng</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="container mx-auto py-8">
            <h1 class="text-3xl font-bold mb-4">Giỏ hàng của bạn</h1>

            <table class="w-full border-collapse border border-gray-300">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="border px-4 py-2">Hình ảnh</th>
                        <th class="border px-4 py-2">Tên sản phẩm</th>
                        <th class="border px-4 py-2">Số lượng</th>
                        <th class="border px-4 py-2">Giá</th>
                        <th class="border px-4 py-2">Tổng</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <tr>
                            <td class="border px-4 py-2">
                                <img src="images/${item.image}" width="50">
                            </td>
                            <td class="border px-4 py-2">${item.productName}</td>
                            <td class="border px-4 py-2">${item.quantity}</td>
                            <td class="border px-4 py-2">${item.price} đ</td>
                            <td class="border px-4 py-2">${item.totalPrice} đ</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
