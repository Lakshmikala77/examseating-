<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String role = (String) session.getAttribute("role");
    String user = (String) session.getAttribute("user");
    String examStatus = request.getParameter("exam_created");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>


<div class="dashboard-container fade-in">
    <h2>Welcome, <%= user %>!</h2>
    <p>You are logged in as: <strong><%= role %></strong></p>

    <%
        if ("true".equals(examStatus)) {
    %>
        <div style="background-color: #d4edda; color: #155724; padding: 12px; border-radius: 5px; margin-bottom: 20px;">
            Exam created successfully!
        </div>
    <%
        } else if ("false".equals(examStatus)) {
    %>
        <div style="background-color: #f8d7da; color: #721c24; padding: 12px; border-radius: 5px; margin-bottom: 20px;">
            Failed to create exam.
        </div>
    <%
        } else if ("error".equals(examStatus)) {
    %>
        <div style="background-color: #fff3cd; color: #856404; padding: 12px; border-radius: 5px; margin-bottom: 20px;">
            Something went wrong while creating the exam.
        </div>
    <%
        }
    %>

    <div class="actions">
        <% if ("admin".equals(role)) { %>
            <a href="createExam.jsp" class="btn">Create Exam</a>
            <a href="StaffApproveEnrollmentServlet" class="btn">Approve Enrollments</a>
        <% } else { %>
            <a href="ViewExamsServlet" class="btn">View Available Exams</a>
            <a href="StudentMyEnrollmentsServlet" class="btn">My Enrollments & Seating</a>
        <% } %>
        <a href="index.jsp" class="logout-btn">Logout</a>
    </div>
</div>


</body>
</html>
