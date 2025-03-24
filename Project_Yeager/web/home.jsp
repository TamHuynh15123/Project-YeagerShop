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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%                if (session.getAttribute("user") != null) {
                userDTO user = (userDTO) session.getAttribute("user");
        %>
        <h1> Welcome: <%=user.getFullname()%> </h1>
        <form action="MainController">
            <input type="hidden" name="action" value="logout"/>
            <input type="submit" value="logout"/>
        </form>
        <%} else {%>
        <h1> Welcome: guest </h1>
        <form action="MainController">
            <input type="hidden" name="action" value="login"/>
            <input type="submit" value="login"/>
        </form>
        <a href="signup.jsp">
            <button type="button">Sign Up New Account</button>
        </a>
        <%
            }
        %>

        <%
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>

        <form action="MainController">

            <input type="hidden" name="action" value="search"/>
            Search <input type="text" name="searchTerm" value="<%= searchTerm%>"/>
            <input type="submit" value="Search"/><br>

        </form>
        <%
            if (AuthUtils.isAdmin(session)) {
        %>

        <a href="add.jsp">
            <button type="button">Add New Product</button>
        </a>

        <%
            }
        %>

        <%
            if (request.getAttribute("product") != null) {
                List<productDTO> product = (List<productDTO>) request.getAttribute("product");

        %>

        <table border="1">
            <thead>
                <tr>                    
                    <th>productname</th>                                   
                    <th>price</th>
                    <th>img</th>  
                        <%if (AuthUtils.isAdmin(session)) {%>
                    <th>type</th>
                    <th>description</th>
                    <th>quantity</th>
                    <th>status</th>
                        <%
                            }
                        %>

                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%            for (productDTO b : product) {
                %>
                <tr>                    
                    <td><%=b.getProductname()%></td>                                      
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getSrcimg()%></td>
                    <% if (AuthUtils.isAdmin(session)) {%>
                    <td><%=b.getType()%></td>                                      
                    <td><%=b.getDescription()%></td>
                    <td><%=b.getQuantity()%></td>
                    <td><%=b.isStatus()%></td>
                    <td><a href="MainController?action=edit&id=<%=b.getId()%>&searchTerm=<%=searchTerm%>">
                            edit
                        </a></td>
                        <%
                            }
                        %>
                    <td><a href="MainController?action=view&id=<%=b.getId()%>&searchTerm=<%=searchTerm%>">
                            view
                        </a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>




        <%
            }
        %>




    </body>
</html>
