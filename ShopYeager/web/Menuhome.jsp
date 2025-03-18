<%@page import="dto.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>

            .hero-section {
                position: relative;
            }

            .hero-image {
                width: 100%;
                height: 24rem; /* h-96 tương đương 24rem */
                object-fit: cover;
            }

            .hero-overlay {
                position: absolute;
                inset: 0;
                background-color: rgba(0, 0, 0, 0.5);
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                color: white;
                text-align: center;
                padding: 1rem;
            }

            .hero-title {
                font-size: 2.25rem; /* text-4xl */
                font-weight: 700;
            }

            .hero-description {
                margin-top: 0.5rem;
            }

            /* Categories Section */
            .categories-section {
                background-color: #374151; /* bg-gray-700 */
                padding: 1rem 0;
            }

            .categories-container {
                max-width: 1200px;
                margin: 0 auto;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0 1rem;
            }
            .categories-links {
                display: flex;
                align-items: center;
            }
            .categories-links span{
                color: white;
                margin-left: 0.5rem;
                text-align: left;
            }

            .menu {
                list-style: none;
                margin: 0;
                padding: 0;
                display: flex;
                gap: 15px;
            }

            .menu li {
                display: inline;
            }

            .menu li a {
                text-decoration: none;
                color: white;
                font-size: 14px;
                transition: color 0.3s ease;
            }

            .menu li a:hover,
            .menu li a.active {
                text-decoration: underline;
                font-weight: bold;
            }

            /* Style cho ô tìm kiếm */
            .search-container {
                position: relative;
            }

            .search-input {
                padding: 8px 30px 8px 10px; /* Dành không gian cho icon */
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            /* Icon tìm kiếm */
            .search-icon {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                color: gray;
                cursor: pointer;
            }

            /* Products Section */
            .products-container {
                max-width: 1200px;
                margin: 2rem auto;
                padding: 0 1rem;
            }

            .products-grid {
                display: grid;
                gap: 1.5rem;
                grid-template-columns: repeat(1, 1fr);
            }

            .product-card {
                background-color: white;
                padding: 1rem;
                border-radius: 0.5rem;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .product-image {
                width: 100%;
                height: 16rem; /* h-64 */
                object-fit: cover;
            }

            .product-info {
                margin-top: 1rem;
            }

            .product-title {
                margin-top: 0.5rem;
                font-size: 1.125rem; /* text-lg */
                font-weight: 700;
            }

            .badge-new {
                background-color: black;
                color: white;
                font-size: 0.75rem;
                font-weight: 700;
                padding: 0.25rem 0.5rem;
                border-radius: 0.25rem;
            }

            .badge-bestseller {
                background-color: #3b82f6; /* bg-blue-500 */
                color: white;
                font-size: 0.75rem;
                font-weight: 700;
                padding: 0.25rem 0.5rem;
                border-radius: 0.25rem;
            }

            /* Pagination */
            .pagination-container {
                margin-top: 2rem;
                display: flex;
                justify-content: center;
            }

            .pagination-list {
                display: inline-flex;
                align-items: center;
            }

            .pagination-button {
                padding: 0.5rem 0.75rem;
                color: #6b7280; /* text-gray-500 */
                background-color: white;
                border: 1px solid #d1d5db; /* border-gray-300 */
                transition: background-color 0.3s, color 0.3s;
            }

            .pagination-button:hover {
                background-color: #f3f4f6; /* hover:bg-gray-100 */
                color: #374151; /* hover:text-gray-700 */
            }

        </style>
    </head>


    <body class="bg-gray-100">
        <%@include file="header.jsp" %>




        <!-- Hero Section -->
        <div class="relative hero-section">
            <img src="img/1.jpg" alt="A person holding a coffee cup and a bag" class="hero-image">
            <div class="hero-overlay">
                <h1 class="hero-title">Learn Bootstrap 5 with MDB</h1>
                <p class="hero-description">Best &amp; free guide of responsive web design</p>
                <p class="hero-description">The most comprehensive tutorial for Bootstrap 5. Loved by over 3 000 000 users. Video and written versions available. Create your own, stunning website.</p>
            </div>
        </div>

        <!-- Categories Section -->
        <div class="categories-section">
            <div class="categories-container">
                <div class="categories-links">
                    <span class="font-bold">Categories:</span>
                    <c:set var="cat" value="${requestScope.data}"/>
                    <c:set var="cid" value="${requestScope.cid}"/>
                    <ul class="menu">
                        <li><a class="${cid==0 ? 'active' : ''}" href="home?cid=0">
                                <i class="fas fa-th"></i> All
                            </a></li>
                            <c:forEach items="${cat}" var="c">
                            <li><a class="${c.category_id == cid ? 'active' : ''}" href="home?cid=${c.category_id}">
                                    <i class="fas fa-tag"></i> ${c.category_name}
                                </a></li>
                            </c:forEach>
                    </ul>
                </div>
                <div class="search-container">
                    <input type="text" placeholder="Search" class="search-input">
                    <i class="fas fa-search search-icon"></i>
                </div>
            </div>
        </div>

        <!-- Products Section -->
        <div class="products-container">
            <div class="products-grid">
                <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá tiền</th>
                    </tr>
                </thead>
                <c:forEach var="p" items="${products}">

                    <!-- Product Example -->
                    <div class="product-card">
                        <img src="${p.image}" alt="${p.name}" class="product-image">
                        <div class="product-info">
                            <h2 class="product-title">${p.name}</h2>
                            <p class="product-price">Giá: ${p.price} VNĐ</p>
                            <p class="product-quantity">Số lượng: ${p.quantity}</p>
                        </div>
                    </div>
                </c:forEach>

            </div>

            <!-- Pagination -->
            <div class="pagination-container">
                <nav aria-label="Page navigation">
                    <ul class="pagination-list">
                        <li><a href="?page=${page-1>0 ? page-1:1}" class="pagination-button rounded-l-lg">Previous</a></li>
                            <c:forEach var="i" begin="1" end="${num}">
                            <li>
                                <a href="?page=${i}" class="pagination-button">${i}</a>
                            </li>
                        </c:forEach>
                        <li><a href="?page=${page+1<=num ? page+1:num}" class="pagination-button rounded-r-lg">Next</a></li>

                    </ul>
                </nav>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>

</html>
