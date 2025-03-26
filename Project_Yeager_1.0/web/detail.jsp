<%@page import="utils.AuthUtils"%>
<%@page import="dto.productDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <%@include file="header.jsp" %>

        <div class="container mx-auto py-8">
            <div class="max-w-4xl mx-auto bg-white shadow-lg rounded-lg p-6">
                <% if (request.getAttribute("product") != null) {
                        productDTO b = (productDTO) request.getAttribute("product");
                %>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <img src="<%=b.getSrcimg()%>" alt="<%=b.getProductname()%>" class="w-full h-auto rounded-lg shadow">
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-gray-800"><%=b.getProductname()%></h2>
                        <p class="text-gray-600 mt-2">Mô tả: <%=b.getDescription()%></p>
                        <p class="mt-4 text-xl font-semibold text-red-600">Giá: <%=b.getPrice()%> đ</p>
                        <p class="text-gray-700 mt-2">Kho: <%=b.getQuantity()%> sản phẩm</p>

                        <a href="MainController?action=addcart&pid=<%=b.getId()%>"
                           class="mt-4 inline-block bg-green-500 hover:bg-green-600 text-white px-6 py-2 rounded-lg text-lg shadow-md transition">
                            Thêm vào giỏ hàng
                        </a>
                        <a href="MainController?action=home" class="text-blue-400 hover:text-blue-300">
                            Trở về trang chủ
                        </a>
                    </div>
                </div>
                <% } else { %>
                <p class="text-red-500 text-center text-lg">Sản phẩm không tồn tại.</p>
                <% }%>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>