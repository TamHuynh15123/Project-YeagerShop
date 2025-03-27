<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thanh toán thành công</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col items-center justify-center h-screen">
    <div class="bg-white p-8 rounded-lg shadow-lg text-center">
        <h1 class="text-2xl font-bold text-green-600">Thanh toán thành công!</h1>
        <p class="text-gray-700 mt-2">Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đang được xử lý.</p>
        <a href="MainController?action=home" class="mt-4 inline-block bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">Tiếp tục mua sắm</a>
    </div>
</body>
</html>