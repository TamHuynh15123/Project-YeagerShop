<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>Giới thiệu về YeagerShop</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-900 text-white">
        <%@include file="header.jsp" %>

        <main class="container mx-auto px-6 mt-10">
            <div class="bg-white shadow-lg rounded-lg p-8">
                <h1 class="text-4xl font-bold text-gray-900 mb-6 text-center">Chào mừng đến với <span class="text-blue-500">Yeager Shop</span> 🎌✨</h1>
                <p class="text-lg text-gray-700 text-center">
                    Nơi dành riêng cho những fan cuồng anime, nơi bạn có thể tìm thấy những món đồ lưu niệm độc đáo và chất lượng!
                </p>

                <!-- Giới thiệu -->
                <section class="mt-10">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">🌟 Về Chúng Tôi</h2>
                    <p class="text-gray-700 leading-relaxed">
                        Yeager Shop được thành lập với mục tiêu mang đến cho cộng đồng yêu thích anime những sản phẩm <span class="font-semibold">chính hãng, chất lượng cao</span> 
                        và đầy sáng tạo. Chúng tôi hiểu rằng mỗi món đồ lưu niệm không chỉ là vật trang trí mà còn là cách thể hiện cá tính của bạn.
                    </p>
                </section>

                <section class="mt-10">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">💖 Vì Sao Chọn Chúng Tôi?</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="flex items-center bg-blue-100 p-4 rounded-lg">
                            <span class="text-blue-500 text-2xl mr-3">✔️</span>
                            <p class="text-gray-700">Cam kết <strong>hàng chính hãng</strong> từ các thương hiệu lớn như Good Smile Company, Bandai, Kotobukiya.</p>
                        </div>
                        <div class="flex items-center bg-blue-100 p-4 rounded-lg">
                            <span class="text-blue-500 text-2xl mr-3">✔️</span>
                            <p class="text-gray-700">Cập nhật <strong>xu hướng liên tục</strong> để bạn không bỏ lỡ sản phẩm hot.</p>
                        </div>
                        <div class="flex items-center bg-blue-100 p-4 rounded-lg">
                            <span class="text-blue-500 text-2xl mr-3">✔️</span>
                            <p class="text-gray-700"><strong>Dịch vụ tận tâm</strong> - Đội ngũ của chúng tôi luôn sẵn sàng hỗ trợ bạn.</p>
                        </div>
                        <div class="flex items-center bg-blue-100 p-4 rounded-lg">
                            <span class="text-blue-500 text-2xl mr-3">✔️</span>
                            <p class="text-gray-700"><strong>Giao hàng nhanh chóng</strong>, đảm bảo an toàn.</p>
                        </div>
                    </div>
                </section>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
