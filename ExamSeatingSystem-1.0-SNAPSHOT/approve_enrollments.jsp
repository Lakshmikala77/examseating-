<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Approve Enrollments</title>
    <link rel="stylesheet" href="css/approve.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="container fade-in">
    <h2>🛡Pending Enrollments</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }

        ResultSet rs = (ResultSet) request.getAttribute("pendingEnrollments");
        if (rs != null && rs.isBeforeFirst()) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Student</th>
                <th>Email</th>
                <th>Exam</th>
                <th>Room No</th>
                <th>Bench</th>
                <th>Action</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <form method="post" action="StaffApproveEnrollmentServlet">
                    <td><%= rs.getInt("id") %>
                        <input type="hidden" name="enrollId" value="<%= rs.getInt("id") %>">
                    </td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("title") %></td>
                    <td><input type="text" name="roomNo" placeholder="e.g., 101" required></td>
                    <td><input type="text" name="seatInfo" placeholder="2nd bench, left" required></td>
                    <td>
                        <button type="submit" name="action" value="approve" class="btn-approve">Approve</button>
                        <button type="submit" name="action" value="reject" class="btn-reject">Reject</button>
                    </td>
                </form>
            </tr>
            <%
                }
            %>
        </table>
    <%
        } else {
    %>
        <p>No pending enrollments!</p>
    <%
        }
    %>

    <br><a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
</div>

</body>
</html>
