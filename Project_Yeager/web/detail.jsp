<%-- 
    Document   : detail
    Created on : Mar 24, 2025, 6:54:38 PM
    Author     : dangk
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.productDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>
        <%
            if (request.getAttribute("product") != null) {
                productDTO b = (productDTO) request.getAttribute("product");

        %>
        
        <table border="1">
            <thead>
                <tr>                    
                    <th>productname</th>                                   
                    <th>price</th>
                    <th>img</th>                          
                    <th>type</th>
                    <th>description</th>
                    <th>quantity</th>                                                           
                </tr>
            </thead>
            <tbody>
                
                <tr>                    
                    <td><%=b.getProductname()%></td>                                      
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getSrcimg()%></td>                   
                    <td><%=b.getType()%></td>                                      
                    <td><%=b.getDescription()%></td>
                    <td><%=b.getQuantity()%></td>                    
                                                         
                </tr>
            </tbody>

            <a href="MainController?action=addtocart&id=<%=b.getId()%>&searchTerm=<%=searchTerm%>">
                Add to Cart
            </a>
            <%                
                }
            %>
    </body>
</html>
