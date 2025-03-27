<%@page import="utils.AuthUtils"%>
<%@page import="dto.productDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    productDTO product = (productDTO) request.getAttribute("product");
    String txtQuantityError = (String) request.getAttribute("txtQuantity_error");

    int id = (product != null) ? product.getId() : 0;
    String productname = (product != null) ? product.getProductname() : "";
    String description = (product != null) ? product.getDescription() : "";
    int quantity = (product != null) ? product.getQuantity() : 0;
    float price = (product != null) ? product.getPrice() : 0;
    String srcimg = (product != null) ? product.getSrcimg() : "";
    boolean status = (product != null) ? product.isStatus() : true;
%>

<html>
    <head>
        <title>Update Product</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-900 text-white flex items-center justify-center min-h-screen">

        <%if (AuthUtils.isAdmin(session)) {%>
        <div class="bg-gray-800 p-6 rounded-lg shadow-lg max-w-lg w-full">
            <h2 class="text-2xl font-semibold text-center mb-4">Update Product</h2>

            <form action="MainController" method="post" class="space-y-4">
                <input type="hidden" name="txtid" value="<%= id%>"/>
                <input type="hidden" name="action" value="update"/>

                <!-- Product Name -->
                <div>
                    <label for="txtproductname" class="block text-sm font-medium">Product Name:</label>
                    <input type="text" id="txtproductname" name="txtproductname" value="<%= productname%>" readonly
                           class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white cursor-not-allowed"/>
                </div>

                <!-- Description -->
                <div>
                    <label for="txtdescription" class="block text-sm font-medium">Description:</label>
                    <textarea id="txtdescription" name="txtdescription" rows="3" required
                              class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white"><%= description%></textarea>
                </div>

                <!-- Quantity & Price -->
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label for="txtquantity" class="block text-sm font-medium">Quantity:</label>
                        <input type="number" id="txtquantity" name="txtquantity" value="<%= quantity%>" min="0" required
                               class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:ring focus:ring-blue-500"/>
                        <% if (txtQuantityError != null) {%>
                        <span class="text-red-500 text-sm animate-pulse"><%= txtQuantityError%></span>
                        <% }%>
                    </div>
                    <div>
                        <label for="txtprice" class="block text-sm font-medium">Price:</label>
                        <input type="number" id="txtprice" name="txtprice" step="0.01" min="10" value="<%= price%>" required
                               class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:ring focus:ring-blue-500"/>
                    </div>
                </div>

                <!-- Image Upload -->
                <div>
                    <label class="block text-sm font-medium">Product Image</label>
                    <input type="hidden" id="txtImage" name="txtimage" value="<%= srcimg%>">

                    <div class="mt-2 flex items-center space-x-4">
                        <label class="cursor-pointer bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg shadow">
                            Choose Image
                            <input type="file" id="imageUpload" class="hidden" accept="image/*">
                        </label>
                        <span id="fileInfo" class="text-gray-400 text-sm">No file selected</span>
                    </div>

                    <div class="mt-4" id="imagePreview">
                        <% if (!srcimg.isEmpty()) {%>
                        <img src="<%= srcimg%>" alt="Product Preview" class="w-full  object-cover rounded-lg shadow">
                        <% }%>
                    </div>
                </div>

                <!-- Status -->
                <div>
                    <label for="txtstatus" class="block text-sm font-medium">Status:</label>
                    <select id="txtstatus" name="txtstatus"
                            class="w-full p-2 border border-gray-600 rounded bg-gray-700 text-white focus:ring focus:ring-blue-500">
                        <option value="true" <%= status ? "selected" : ""%>>Active</option>
                        <option value="false" <%= !status ? "selected" : ""%>>Inactive</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit"
                            class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-6 rounded-lg shadow-md transition-all">
                        Update Product
                    </button>
                </div>
            </form>
        </div>
        <%} else {%>
        <h1 style="color: red">You do not have permission to do that</h1>
        <%}%>

        <!-- JavaScript -->
        <script>
            $(document).ready(function () {
                $('#imageUpload').change(function () {
                    const file = this.files[0];
                    if (file) {
                        if (!file.type.match('image.*')) {
                            alert('Please select an image file');
                            this.value = '';
                            $('#fileInfo').text('No file selected');
                            return;
                        }

                        if (file.size > 1024 * 1024) {
                            alert('File size must be under 1MB');
                            this.value = '';
                            $('#fileInfo').text('No file selected');
                            return;
                        }

                        const reader = new FileReader();
                        reader.onload = function (e) {
                            $('#txtImage').val(e.target.result);
                            $('#imagePreview').html('<img src="' + e.target.result + '" alt="Preview" class="w-full object-cover rounded-lg shadow">');
                        };
                        reader.readAsDataURL(file);
                        $('#fileInfo').text(file.name);
                    }
                });
            });
        </script>
    </body>
</html>
