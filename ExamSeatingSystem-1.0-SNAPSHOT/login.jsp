<!-- File: webapp/login.jsp -->
<%@ page import="java.util.*" %>
<%
    String role = request.getParameter("role");
    if (role == null) role = "student";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= role.equals("admin") ? "Admin" : "Student" %> Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>


<div class="login-container fade-in">
    <h2><%= role.equals("admin") ? "Admin" : "Student" %> Login</h2>
    <form action="LoginServlet" method="post">
        <input type="hidden" name="role" value="<%= role %>">

        <label>Username / Email</label>
        <input type="text" name="username" placeholder="Enter your email or username" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>

    <% if (role.equals("student")) { %>
        <p class="register-link">Don't have an account? <a href="register.jsp">Register here</a></p>
    <% } %>
</div>


</body>
</html>
