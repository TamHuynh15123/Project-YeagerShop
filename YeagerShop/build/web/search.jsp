<%-- 
    Document   : search
    Created on : 16/02/2025, 2:40:40 PM
    Author     : HP
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO)request.getAttribute("user");
            %>
        <h1>Welcome <%=user.getFullName()%></h1>
        <a href="MainController?action=logout">Log out</a>
        <form action="#">
            Search Value: <input type="submit" name="txtSearchValue"
                                 <input type="submit" name="Search"/>
            
        </form>
    </body>
</html>
