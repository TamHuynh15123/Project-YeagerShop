<%-- 
    Document   : viewcart
    Created on : 26/03/2025, 11:46:40 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.HashMap, dto.CartItemDTO" %>
<%@ page session="true" %>

<%
    HashMap<Integer, CartItemDTO> cart = (HashMap<Integer, CartItemDTO>) session.getAttribute("CART");
    if (cart == null || cart.isEmpty()) {
%>
    <h3>Giỏ hàng trống!</h3>
<%
    } else {
%>
    <table border="1">
        <tr>
            <th>Hình ảnh</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Tổng tiền</th>
        </tr>
        <%
            float totalPrice = 0;
            for (CartItemDTO item : cart.values()) {
                totalPrice += item.getTotalPrice();
        %>
        <tr>
            <td><img src="<%= item.getImage() %>" width="50"></td>
            <td><%= item.getProductName() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getTotalPrice() %></td>
        </tr>
        <% } %>
    </table>
    <h3>Tổng thanh toán: <%= totalPrice %> VND</h3>
<%
    }
%>