<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giỏ Hàng</title>
</head>
<body>
    <h2>Giỏ Hàng</h2>
    <%
        HttpSession sessionObj = request.getSession();
        List<String> cart = (List<String>) sessionObj.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <p>Giỏ hàng của bạn đang trống.</p>
    <%
        } else {
    %>
        <ul>
            <%
                for (String product : cart) {
            %>
                <li>
                    <%= product %>
                    <a href="cart?remove=<%= product %>">Xóa</a>
                </li>
            <%
                }
            %>
        </ul>
        <a href="checkout.jsp">Thanh Toán</a>
    <%
        }
    %>
</body>
</html>
