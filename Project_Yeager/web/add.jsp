<%-- 
    Document   : add
    Created on : Mar 24, 2025, 10:45:31 PM
    Author     : dangk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Add New Product</h2>

        <form action="MainController" method="post">
            <label for="txtproductname">Product Name:</label><br/>
            <input type="text" id="txtproductname" name="txtproductname" required/><br/><br/>

            <label for="txtdescription">Description:</label><br/>
            <textarea id="txtdescription" name="txtdescription" rows="4" cols="50"></textarea><br/><br/>

            <label for="txttype">Type:</label><br/>
            <select id="txttype" name="txttype" required>
                <option value="Phụ kiện">Phụ kiện</option>
                <option value="Balo/Áo khoác">Balo/Áo khoác</option>
                <option value="Mô hình">Mô hình</option>
            </select><br/><br/>

            <label for="txtquantity">Quantity:</label><br/>
            <input type="number" id="txtquantity" name="txtquantity" min="0" required/><br/><br/>

            <label for="txtprice">Price:</label><br/>
            <input type="number" id="txtprice" name="txtprice" step="0.01" required/><br/><br/>

            <label for="txtimage">Image URL:</label><br/>
            <input type="text" id="txtimage" name="txtimage"/><br/><br/>

            <label for="txtstatus">Status:</label><br/>
            <select id="txtstatus" name="txtstatus">
                <option value="true">Active</option>
                <option value="false">Inactive</option>
            </select><br/><br/>

            <input type="hidden" name="action" value="add"/>
            <input type="submit" value="Add Product"/>
        </form>

        <br/>
        <a href="MainController?action=search">Back to Product List</a>

    </body>
</html>
