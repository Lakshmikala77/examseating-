<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, org.example.ViewExamsServlet.Exam" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Exams</title>
    <link rel="stylesheet" href="css/exams.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>


<div class="exam-container fade-in">
    <h2>Available Exams</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }

        List<Exam> exams = (List<Exam>) request.getAttribute("exams");
        if (exams != null && !exams.isEmpty()) {
            for (Exam exam : exams) {
    %>
        <div class="exam-card">
            <h3><%= exam.title %></h3>
            <p><strong>Date:</strong> <%= exam.date %></p>
            <p><strong>Time:</strong> <%= exam.time %></p>
            <p><strong>Description:</strong> <%= exam.description %></p>
            <a href="EnrollExamServlet?examId=<%= exam.id %>" class="enroll-btn">Enroll</a>
        </div>
    <%
            }
        } else {
    %>
        <p>No exams available at the moment.</p>
    <%
        }
    %>

    <br><a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>
</div>


</body>
</html>
