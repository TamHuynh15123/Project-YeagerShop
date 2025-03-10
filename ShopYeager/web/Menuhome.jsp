<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>
   Product Page
  </title>
  <script src="https://cdn.tailwindcss.com">
  </script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
 </head>
 <body class="bg-gray-100">
  <!-- Hero Section -->
  <div class="relative">
      <img  alt="Banner1" class="w-full h-96 object-cover" height="600" src="img/1.jpg" width="1920"/>
   <div class="absolute inset-0 bg-black bg-opacity-50 flex flex-col justify-center items-center text-center text-white">
    <h1 class="text-4xl font-bold">
     Welcome to Yeager Shop 
    </h1>
    <p class="mt-2">
     Thêm gì vào đây
    </p>
    <p class="mt-2">
     và gì đó
    </p>
   </div>
  </div>
  <!-- Categories Section -->
  <div class="bg-gray-700 py-4">
   <div class="container mx-auto flex justify-between items-center px-4">
    <div class="text-white">
     <span class="font-bold">
      Categories:
     </span>
     <a class="ml-2 text-white" href="#">
      All
     </a>
     <a class="ml-2 text-white" href="#">
      Backpack
     </a>
     <a class="ml-2 text-white" href="#">
      AoT Figure
     </a>
     <a class="ml-2 text-white" href="#">
      Accessory
     </a>
    </div>
    <input class="px-4 py-2 rounded" placeholder="Search" type="text"/>
   </div>
  </div>
  <!-- Products Section -->
  <div class="container mx-auto py-8 px-4">
   <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
    <!-- Product 1 -->
    <div class="bg-white p-4 rounded shadow">
        <img alt="Denim shirt" class="w-full h-64 object-cover" height="400" src="img-product/aochoang1.jpg" width="300"/>
     <div class="mt-4">
      <span class="bg-black text-white text-xs font-bold px-2 py-1 rounded">
       NEW
      </span>
      <h2 class="mt-2 text-lg font-bold">
       Denim shirt
      </h2>
     </div>
    </div>
    <!-- Product 2 -->
    <div class="bg-white p-4 rounded shadow">
        <img alt="Red hoodie" class="w-full h-64 object-cover" height="400" src="img-product/aochoang2.jpg" width="300"/>
     <div class="mt-4">
      <span class="bg-blue-500 text-white text-xs font-bold px-2 py-1 rounded">
       bestseller
      </span>
      <h2 class="mt-2 text-lg font-bold">
       Sweatshirt
      </h2>
     </div>
    </div>
    <!-- Product 3 -->
    <div class="bg-white p-4 rounded shadow">
        <img alt="Gray sweater" class="w-full h-64 object-cover" height="400" src="img-product/balo.jpg" width="300"/>
     <div class="mt-4">
      <h2 class="mt-2 text-lg font-bold">
       Brown backpack
      </h2>
     </div>
    </div>
    <!-- Product 4 -->
    <div class="bg-white p-4 rounded shadow">
        <img alt="Black jacket" class="w-full h-64 object-cover" height="400" src="img-product/balo2.jpg" width="300"/>
     <div class="mt-4">
      <span class="bg-red-500 text-white text-xs font-bold px-2 py-1 rounded">
       -10%
      </span>
      <h2 class="mt-2 text-lg font-bold">
       Black backpack
      </h2>
     </div>
    </div>
    <!-- Product 5 -->
    <div class="bg-white p-4 rounded shadow">
        <img alt="Blue T-shirt" class="w-full h-64 object-cover" height="400" src="img-product/daychuyencacloai.jpg" width="300"/>
     <div class="mt-4">
      <h2 class="mt-2 text-lg font-bold">
       Chain
      </h2>
     </div>
    </div>
    <!-- Product 6 -->
    <div class="bg-white p-4 rounded shadow">
        <img alt="Green hoodie" class="w-full h-64 object-cover" height="400" src="img-product/eren1.jpg" width="300"/>
     <div class="mt-4">
      <h2 class="mt-2 text-lg font-bold">
       Eren v1
      </h2>
     </div>
    </div>
    <!-- Product 7 -->
    <div class="bg-white p-4 rounded shadow">
     <img alt="Yellow sweater" class="w-full h-64 object-cover" height="400" src="img-product/eren2.jpg" width="300"/>
     <div class="mt-4">
      <h2 class="mt-2 text-lg font-bold">
       Eren v2
      </h2>
     </div>
    </div>
    <!-- Product 8 -->
    <div class="bg-white p-4 rounded shadow">
     <img alt="Black pants" class="w-full h-64 object-cover" height="400" src="img-product/eren3.jpg" width="300"/>
     <div class="mt-4">
      <h2 class="mt-2 text-lg font-bold">
       Eren v3
      </h2>
     </div>
    </div>
    <!-- Product 9 -->
    <div class="bg-white p-4 rounded shadow">
     <img alt="White shirt" class="w-full h-64 object-cover" height="400" src="img-product/titaneren.jpg" width="300"/>
     <div class="mt-4">
      <h2 class="mt-2 text-lg font-bold">
       Titan Eren 
      </h2>
     </div>
    </div>
    <!-- Product 10 -->
    <div class="bg-white p-4 rounded shadow">
        <img alt="Red jacket" class="w-full h-64 object-cover" height="400" src="img-product/mockhoa.jpg" width="300"/>
     <div class="mt-4">
      <h2 class="mt-2 text-lg font-bold">
       Keyring Logo
      </h2>
     </div>
    </div>
   </div>
   <!-- Pagination -->
   <div class="mt-8 flex justify-center">
    <nav aria-label="Page navigation">
     <ul class="inline-flex items-center -space-x-px">
      <li>
       <a class="px-3 py-2 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700" href="#">
        Previous
       </a>
      </li>
      <li>
       <a class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700" href="#">
        1
       </a>
      </li>
      <li>
       <a class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700" href="#">
        2
       </a>
      </li>
      <li>
       <a class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700" href="#">
        3
       </a>
      </li>
      <li>
       <a class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg hover:bg-gray-100 hover:text-gray-700" href="#">
        Next
       </a>
      </li>
     </ul>
    </nav>
   </div>
  </div>
 </body>
</html>