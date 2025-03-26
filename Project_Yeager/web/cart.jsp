<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="dto.CartItemDTO, java.util.List" %>
<%@ include file="header.jsp" %>
<%
    List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <h2 class="text-center text-lg">Giỏ hàng của bạn trống.</h2>
<%
    } else {
%>
    <table class="table-auto w-full border-collapse border border-gray-300">
        <tr>
            <th class="border px-4 py-2">Tên sản phẩm</th>
            <th class="border px-4 py-2">Số lượng</th>
            <th class="border px-4 py-2">Giá</th>
            <th class="border px-4 py-2">Tổng</th>
            <th class="border px-4 py-2">Xóa</th>
        </tr>
        <%
            float total = 0;
            for (CartItemDTO item : cart) {
                total += item.getTotalPrice();
        %>
        <tr>
            <td class="border px-4 py-2"><%= item.getProductName() %></td>
            <td class="border px-4 py-2"><%= item.getQuantity() %></td>
            <td class="border px-4 py-2"><%= item.getPrice() %></td>
            <td class="border px-4 py-2"><%= item.getTotalPrice() %></td>
            <td class="border px-4 py-2">
                <a href="MainController?action=removeFromCart&id=<%= item.getId() %>" class="text-red-500">Xóa</a>
            </td>
        </tr>
        <% } %>
        <tr>
            <td colspan="3" class="border px-4 py-2 font-bold text-right">Tổng cộng:</td>
            <td class="border px-4 py-2 font-bold"><%= total %></td>
            <td></td>
        </tr>
    </table>
    <div class="mt-4">
        <a href="MainController?action=checkout" class="bg-blue-500 text-white px-4 py-2 rounded">Thanh toán</a>
    </div>
<% } %>
<%@ include file="footer.jsp" %>
