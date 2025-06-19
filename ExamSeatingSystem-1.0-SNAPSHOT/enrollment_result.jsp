<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Enrollment Status</title>
    <link rel="stylesheet" href="css/result.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="result-container fade-in">
    <h2>Enrollment Update</h2>
    <div class="message">
        <%= request.getAttribute("status") %>
    </div>
    <a href="student_dashboard.jsp" class="back-btn">Go to Dashboard</a>
</div>

</body>
</html>
