<%-- 
    Document   : singup
    Created on : Mar 24, 2025, 10:55:32 PM
    Author     : dangk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h2>Register New User</h2>

    <form action="MainController" method="post">
        
        <label for="fullname">Full Name:</label><br/>
        <input type="text" id="fullname" name="fullname" required/><br/><br/>
        
        <label for="email">Email:</label><br/>
        <input type="email" id="email" name="email" required/><br/><br/> 
        
        <label for="username">Username:</label><br/>
        <input type="text" id="username" name="username" required/><br/><br/>

        <label for="password">Password:</label><br/>
        <input type="password" id="password" name="password" required/><br/><br/>

        <label for="confirm">Confirm Password:</label><br/>
        <input type="password" id="confirm" name="confirm" required/><br/><br/>

        <input type="hidden" name="action" value="signup"/>
        <input type="submit" value="Sign Up"/>
    </form>

    <br/>
    <a href="login.jsp">Back to Login</a>

    <%-- Hiển thị lỗi (nếu có) --%>
    <%
        String signupError = (String) request.getAttribute("signupError");
        String signupSuccess = (String) request.getAttribute("signupSuccess");
        if (signupError != null) {
    %>
        <p style="color:red;"><%= signupError %></p>
    <% } else if (signupSuccess != null) { %>
        <p style="color:green;"><%= signupSuccess %></p>
    <% } %>
</body>
</html>

