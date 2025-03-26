<%-- 
    Document   : home
    Created on : Mar 24, 2025, 5:14:39 PM
    Author     : dangk
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.productDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dto.userDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

        <title>
            YeagerShop
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    </head>
    <style>
        .active {
            font-weight: bold;
            color: yellow; /* Đổi màu theo ý thích */
            text-decoration: underline;
        }
    </style>
    <body class="bg-gray-100">
        <%@include file="header.jsp" %>

        <div class="bg-gray-700 p-4">
            <div class="container mx-auto flex justify-between items-center">
                <div class="text-white">
                    <span class="font-bold">
                        Categories:
                    </span>
                    <a class="ml-2 text-white ${empty tag ? 'active' : ''}" href="category">
                        All
                    </a>
                    <c:forEach items="${listC}" var="o">

                        <a class="ml-2 text-white ${tag == o.cid ? 'active' : ''}" href="category?cid=${o.cid}">
                            ${o.cname}
                        </a>
                    </c:forEach>

                </div>


                <%
                    String searchTerm = request.getAttribute("searchTerm") + "";
                    searchTerm = searchTerm.equals("null") ? "" : searchTerm;
                %>
                <div class="flex items-center space-x-4">
                    <form action="MainController" class="flex items-center">
                        <input type="hidden" name="action" value="search"/>
                        <input type="text" name="searchTerm" value="<%= searchTerm%>" class="border px-2 py-1 text-black"/>
                        <input type="submit" value="Search" class="ml-2 bg-white text-black px-4 py-1 rounded cursor-pointer hover:bg-gray-300"/>
                    </form>

                    <% if (AuthUtils.isAdmin(session)) { %>
                    <a href="add.jsp" class="bg-gray-600 hover:bg-gray-500 text-white font-medium py-1 px-3 rounded text-xs flex items-center transition duration-200">
                        <i class="fas fa-plus text-xs mr-1"></i> Add
                    </a>
                    <% }%>
                </div>
            </div>
        </div>
        <div class="container mx-auto py-8">
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <c:forEach items="${listP}" var="o">
                    <div class="bg-white p-4 rounded-lg shadow flex flex-col h-full">
                        <div class="relative">
                            <img alt="" class="w-full h-auto object-cover" src="${o.srcimg}" width="300"/>
                        </div>
                        <h2 class="mt-4 text-lg font-bold">
                            ${o.productname}
                        </h2>
                        <p class="text-gray-500">
                            ${o.quantity}
                        </p>
                        <p class="mt-2 text-xl font-bold">
                            ${o.price}
                        </p>
                        <div class="mt-auto flex justify-between">
                            <button class="bg-blue-500 text-white px-4 py-2 rounded" onclick="window.location.href = 'detail.jsp'">View Product</button>
                            <button class="bg-green-500 text-white px-4 py-2 rounded">Add to Cart</button>
                        </div>
                    </div>
                </c:forEach>

            </div>
            
        </div>

        <%@include file="footer.jsp" %>



    </body>
</html>

