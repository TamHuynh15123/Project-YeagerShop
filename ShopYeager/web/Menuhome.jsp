<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    

    <body class="bg-gray-100">
        <%@include file="header.jsp" %>
        
        


        <!-- Hero Section -->
        <div class="relative">
            <img src="img/1.jpg" alt="Banner shop" class="w-full h-96 object-cover" width="1920" height="600">
            <div class="absolute inset-0 bg-black bg-opacity-50 flex flex-col justify-center items-center text-center text-white">
                <h1 class="text-4xl font-bold">Welcome to Yeager Shop</h1>
                <p class="mt-2">Best &amp; free guide of responsive web design</p>
                <p class="mt-2">The most comprehensive tutorial for the Bootstrap 5. Loved by over 3 000 000 users. Video and written versions available. Create your own, stunning website.</p>
            </div>
        </div>
        <!-- Categories Section -->
        <div class="bg-gray-700 py-4">
            <div class="container mx-auto flex justify-between items-center px-4">
                <div class="text-white">
                    <span class="font-bold">Categories:</span>
                    <a href="#" class="ml-2 text-white">All</a>
                    <a href="#" class="ml-2 text-white">Backpack</a>
                    <a href="#" class="ml-2 text-white">Mo hinh</a>
                    <a href="#" class="ml-2 text-white">Phu kien</a>
                </div>
                <input type="text" placeholder="Search" class="px-4 py-2 rounded">
                
            </div>
        </div>
        
        <!-- Products Section -->
        <div class="container mx-auto py-8 px-4">
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
                <!-- Product 1 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/balo.jpg" alt="Phụ kiện-1" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <span class="bg-black text-white text-xs font-bold px-2 py-1 rounded">NEW</span>
                        <h2 class="mt-2 text-lg font-bold">Brown Backpack</h2>
                    </div>
                </div>
                <!-- Product 2 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/balo2.jpg" alt="Phụ kiện-2" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <span class="bg-blue-500 text-white text-xs font-bold px-2 py-1 rounded">bestseller</span>
                        <h2 class="mt-2 text-lg font-bold">Black Backpack</h2>
                    </div>
                </div>
                <!-- Product 3 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/aochoang1.jpg" alt="Phụ kiện-3" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <h2 class="mt-2 text-lg font-bold">Jacket</h2>
                    </div>
                </div>
                <!-- Product 4 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/aochoang2.jpg" alt="Phụ kiện-4" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <span class="bg-red-500 text-white text-xs font-bold px-2 py-1 rounded">-10%</span>
                        <h2 class="mt-2 text-lg font-bold">Dark jacket</h2>
                    </div>
                </div>
                <!-- Product 5 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/daychuyencacloai.jpg" alt="Phụ kiện-5" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <h2 class="mt-2 text-lg font-bold">Day chuyen</h2>
                    </div>
                </div>
                <!-- Product 6 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/eren1.jpg" alt="Phụ kiện-6" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <h2 class="mt-2 text-lg font-bold">Eren v1</h2>
                    </div>
                </div>
                <!-- Product 7 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/eren2.jpg" alt="Phụ kiện-7" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <h2 class="mt-2 text-lg font-bold">Yellow sweater</h2>
                    </div>
                </div>
                <!-- Product 8 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/eren3.jpg" alt="Phụ kiện-8" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <h2 class="mt-2 text-lg font-bold">Black pants</h2>
                    </div>
                </div>
                <!-- Product 9 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/titaneren.jpg" alt="Phụ kiện-9" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <h2 class="mt-2 text-lg font-bold">White shirt</h2>
                    </div>
                </div>
                <!-- Product 10 -->
                <div class="bg-white p-4 rounded shadow">
                    <img src="img-product/mockhoa.jpg" alt="Phụ kiện-10" class="w-full h-64 object-cover" width="300" height="400">
                    <div class="mt-4">
                        <h2 class="mt-2 text-lg font-bold">Vòng tay</h2>
                    </div>
                </div>
                
            </div>
            

            <!-- Pagination -->
            <div class="mt-8 flex justify-center">
                <form action="TrangChu">
                <nav aria-label="Page navigation">
                    <ul class="inline-flex items-center -space-x-px">
                        <li>
                            <a href="#" class="px-3 py-2 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700">Previous</a>
                        </li>
                        <li>
                            <a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">1</a>
                        </li>
                        <li>
                            <a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">2</a>
                        </li>
                        <li>
                            <a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">3</a>
                        </li>
                        <li>
                            <a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg hover:bg-gray-100 hover:text-gray-700">Next</a>
                        </li>
                    </ul>
                </nav>
                    </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    
</html>
