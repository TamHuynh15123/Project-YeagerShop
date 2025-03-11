<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : footer
    Created on : Feb 28, 2025, 12:54:27 PM
    Author     : dangk
--%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Footer Section</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body class="bg-gray-900 text-white">
        <footer class="bg-gray-700 text-white py-8">
            <div class="container mx-auto px-4 grid grid-cols-1 md:grid-cols-4 gap-8">
                <div>
                    <h2 class="text-lg font-bold mb-4">Về chúng tôi</h2>
                    <img src="img/logo2.png" alt="Yeager logo" class="mb-4" width="150" height="50">
                    <p class="mb-4">Thương hiệu phụ kiện/thời trang Anime hàng đầu Việt Nam</p>
                    <p class="flex items-center mb-2"><i class="fas fa-map-marker-alt mr-2"></i>Địa chỉ: Văn phòng: Đường D1, Đại Học FPT Q9 TP.Thủ Đức</p>
                    <p class="flex items-center mb-2"><i class="fas fa-phone-alt mr-2"></i>Số điện thoại: 0914209673</p>
                    <p class="flex items-center mb-2"><i class="fas fa-envelope mr-2"></i>Email: admin@gmail.com</p>
                    <div class="flex space-x-4 mt-4">
                        <a href="#"><i class="fab fa-facebook fa-2x"></i></a>
                        <a href="#"><i class="fab fa-tiktok fa-2x"></i></a>
                        <a href="#"><i class="fab fa-instagram fa-2x"></i></a>
                    </div>
                </div>
                <div>
                    <h2 class="text-lg font-bold mb-4">Chính sách</h2>
                    <ul>
                        <li class="mb-2"><a href="#" class="hover:underline">Tìm kiếm</a></li>
                        <li class="mb-2"><a href="#" class="hover:underline">Giới thiệu</a></li>
                        <li class="mb-2"><a href="#" class="hover:underline">Thông tin về tuyển dụng</a></li>
                    </ul>
                </div>
                <div>
                    <h2 class="text-lg font-bold mb-4">Hỗ trợ khách hàng</h2>
                    <ul>
                        <li class="mb-2"><a href="#" class="hover:underline">Hướng dẫn mua hàng</a></li>
                        <li class="mb-2"><a href="#" class="hover:underline">Hướng dẫn sử dụng</a></li>

                        <li class="mb-2"><a href="#" class="hover:underline">Chính sách đổi trả &amp; bảo hành</a></li>
                        <li class="mb-2"><a href="#" class="hover:underline">Quy trình giao nhận và thanh toán</a></li>
                        <li class="mb-2"><a href="#" class="hover:underline">Hệ Thống Cửa Hàng</a></li>
                    </ul>
                </div>
                <div>
                    <h2 class="text-lg font-bold mb-4">Contact Us</h2>
                    <div class="space-y-2">
                        <div class="flex items-center space-x-2">
                            <img src="img/mail.png" alt="Mail icon" width="50" height="30">
                            <span>Email: contact@example.com</span>
                        </div>
                        <div class="flex items-center space-x-2">
                            <img src="img/phone.png" alt="Phone icon" width="50" height="30">
                            <span>Phone: 0914209673</span>
                        </div>
                        <div class="flex items-center space-x-2">
                            <img src="img/address.png" alt="Address icon" width="50" height="30">
                            <span>Address: D1 Street FPT University District 9 Thu Duc City</span>
                        </div>
                    </div>

                </div>
            </div>
            <div class="text-center mt-8">
                <p>© Bản quyền thuộc về Yeager Shop | Cung cấp bởi Haravan</p>
            </div>
        </footer>
        
    </body>
</html>
