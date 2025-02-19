<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header Anime</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007BFF; /* Màu xanh cho header */
            padding: 20px 0;
            color: #fff;
            text-align: center;
        }

        .logo {
            font-size: 2em;
            font-weight: bold;
            color: #fff;
        }

        nav {
            margin-top: 20px;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center; /* C?n gi?a menu */
        }

        nav ul li {
            margin-right: 20px; /* Kho?ng cách gi?a các m?c menu */
        }

        nav ul li a {
            text-decoration: none;
            color: #fff;
            font-size: 1.1em;
        }

        nav ul li a:hover {
            text-decoration: underline; /* Thêm hi?u ?ng hover */
        }

        /* Thêm thanh tìm ki?m */
        .search-bar {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .search-bar input {
            padding: 10px;
            width: 300px;
            border: none;
            border-radius: 20px;
            font-size: 1em;
        }

        .search-bar button {
            padding: 10px 20px;
            border: none;
            background-color: #fff;
            color: #007BFF;
            font-size: 1em;
            cursor: pointer;
            border-radius: 20px;
            margin-left: 10px;
        }

        .search-bar button:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .product-list {
            display: flex;
            justify-content: space-around;
            margin-top: 50px;
            flex-wrap: wrap;
        }

        .product {
            width: 200px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 20px;
            text-align: center;
            transition: transform 0.3s;
        }

        .product img {
            width: 100%;
            height: auto;
        }

        .product h3 {
            margin: 10px 0;
            color: #333;
        }

        .product p {
            color: #777;
            font-size: 1.1em;
            margin-bottom: 15px;
        }

        .product:hover {
            transform: scale(1.05);
        }

    </style>
</head>
<body>

<header>
    <div class="logo">Anime Store</div>
    <nav>
        <ul>
            <li><a href="#">Trang Ch?</a></li>
            <li><a href="#">S?n Ph?m</a></li>
            <li><a href="#">Gi?i Thi?u</a></li>
            <li><a href="#">Liên H?</a></li>
        </ul>
    </nav>
    
    <!-- Thanh tìm ki?m -->
    <div class="search-bar">
        <input type="text" placeholder="Tìm ki?m s?n ph?m...">
        <button>Search</button>
    </div>i
</header>

<div class="product-list">
    <div class="product">
        <img src="https://via.placeholder.com/200x300.png?text=Anime+Product+1" alt="Product 1">
        <h3>Anime Product 1</h3>
        <p>Miêu t? ng?n g?n v? s?n ph?m anime này.</p>
    </div>
    <div class="product">
        <img src="https://via.placeholder.com/200x300.png?text=Anime+Product+2" alt="Product 2">
        <h3>Anime Product 2</h3>
        <p>Miêu t? ng?n g?n v? s?n ph?m anime này.</p>
    </div>
    <div class="product">
        <img src="https://via.placeholder.com/200x300.png?text=Anime+Product+3" alt="Product 3">
        <h3>Anime Product 3</h3>
        <p>Miêu t? ng?n g?n v? s?n ph?m anime này.</p>
    </div>
</div>

</body>
</html>
