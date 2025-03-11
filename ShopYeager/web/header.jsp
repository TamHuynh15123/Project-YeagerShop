<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YeagerShop</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body class="bg-gray-900 text-white">
    <!-- Header -->
    <header class="bg-black p-4 flex justify-between items-center">
        <div class="flex items-center space-x-4">
            <img src="img/logo2.png" alt="YeagerShop logo" height="50" width="50">
            <h1 class="text-white text-xl font-bold">YeagerShop</h1>
        </div>
        <nav>
            <ul class="flex space-x-4">
                <li><a class="text-white" href="#">Trang chủ</a></li>
                <li><a class="text-white" href="#">Sản phẩm</a></li>
                <li><a class="text-white" href="#">Giới thiệu</a></li>
                <li><a class="text-white" href="#">Liên hệ</a></li>
            </ul>
        </nav>
        <div class="flex items-center space-x-4">
            <div class="flex items-center space-x-2">
                <input type="text" class="p-2 rounded bg-gray-700 text-white" placeholder="Tìm kiếm...">
                <button type="submit" class="p-2 bg-gray-700 text-white rounded">Tìm</button>
            </div>
            <div class="flex items-center space-x-4">
                <div class="login">
                    <a class="text-white" href="login.jsp">🔑 Đăng nhập</a>
                </div>
                <div class="cart">
                    <a class="text-white" href="#">🛒 Giỏ hàng</a>
                </div>
            </div>
        </div>
    </header>
</body>
</html>
