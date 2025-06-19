<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Exam</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/create_exam.css">
</head>
<body>


<div class="exam-container fade-in">
    <h2>Create a New Exam</h2>
    <form method="post" action="CreateExamServlet">
        <label>Exam Title</label>
        <input type="text" name="title" placeholder="e.g., Midterm - Data Structures" required />

        <label>Date</label>
        <input type="date" name="date" required />

        <label>Time</label>
        <input type="time" name="time" required />

        <label>Description</label>
        <textarea name="description" placeholder="Brief description about the exam..." required></textarea>

        <button type="submit">Create Exam</button>
    </form>
</div>


</body>
</html>
