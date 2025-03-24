<%-- 
    Document   : login
    Created on : Mar 24, 2025, 4:44:00 PM
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
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login">
            username <input type="text" name="txtusername"/><br>
            password <input type="password" name="txtpassword"/><br>
            <input type="submit" value="login"/>
            <%
                String message = request.getAttribute("message") + "";
            %>
            <%=message.equals("null") ? "" : message%>
            <p>Don't have an account?</p>
            <a href="signup.jsp"><button type="button">Sign Up</button></a>
        </form>

    </body>
</html>
