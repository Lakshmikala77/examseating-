<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, org.example.StudentMyEnrollmentsServlet.Enrollment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Enrollments</title>
    <link rel="stylesheet" href="css/enrollments.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>


<div class="container fade-in">
    <h2> My Exam Enrollments</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }

        List<Enrollment> enrollments = (List<Enrollment>) request.getAttribute("enrollments");
        if (enrollments != null && !enrollments.isEmpty()) {
    %>
        <table>
            <tr>
                <th>Exam</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
                <th>Seat Info</th>
            </tr>
            <% for (Enrollment e : enrollments) { %>
                <tr>
                    <td><%= e.title %></td>
                    <td><%= e.date %></td>
                    <td><%= e.time %></td>
                    <td>
                        <span class="badge <%= e.status.toLowerCase() %>">
                            <%= e.status %>
                        </span>
                    </td>
                    <td>
                        <%= e.seatInfo != null ? e.seatInfo : "<span class='pending'>Not Assigned</span>" %>
                    </td>
                </tr>
            <% } %>
        </table>
    <%
        } else {
    %>
        <p>No enrollments found.</p>
    <%
        }
    %>

    <br><a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>
</div>

</body>
</html>
