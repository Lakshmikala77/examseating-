<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    if (session == null || session.getAttribute("user") == null || !"student".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }

    String userEmail = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="css/student_dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="dashboard-container fade-in">
    <h2>Welcome, <%= userEmail %>!</h2>
    <h3>Your Enrolled Exams</h3>

    <%
        try {
            Connection conn = org.example.DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT id FROM students WHERE email = ?");
            ps.setString(1, userEmail);
            ResultSet rs1 = ps.executeQuery();

            int studentId = -1;
            if (rs1.next()) {
                studentId = rs1.getInt("id");
            }

            if (studentId != -1) {
                String sql = "SELECT e.title, e.date, e.time, ee.status, ee.seat_info " +
                             "FROM exam_enrollments ee JOIN exams e ON ee.exam_id = e.id " +
                             "WHERE ee.student_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, studentId);
                ResultSet rs = stmt.executeQuery();

                out.println("<table>");
                out.println("<tr><th>Exam</th><th>Date</th><th>Time</th><th>Status</th><th>Seat Info</th></tr>");
                while (rs.next()) {
                    String status = rs.getString("status");
                    String seat = rs.getString("seat_info");

                    out.println("<tr>");
                    out.println("<td>" + rs.getString("title") + "</td>");
                    out.println("<td>" + rs.getDate("date") + "</td>");
                    out.println("<td>" + rs.getTime("time") + "</td>");
                    out.println("<td>" + status + "</td>");
                    out.println("<td>");
                    if ("Approved".equals(status)) {
                        out.println(seat != null ? seat : "Assigned Soon");
                    } else if ("Pending".equals(status)) {
                        out.println("Waiting for Approval");
                    } else {
                        out.println("Rejected");
                    }
                    out.println("</td></tr>");
                }
                out.println("</table>");
            } else {
                out.println("<p>Student not found!</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>

    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
</div>


</body>
</html>
