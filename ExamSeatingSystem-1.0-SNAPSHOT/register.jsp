<!-- File: webapp/register.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/register.css">
</head>
<body>

<div class="register-container fade-in">
    <h2>Register as a Student</h2>
    <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
        <label>Name</label>
        <input type="text" name="name" placeholder="Full Name" required>

        <label>Email</label>
        <input type="email" name="email" id="email" placeholder="Email Address" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Choose Password" required>

        <label>Branch</label>
        <input type="text" name="branch" placeholder="CSE, ECE, etc." required>

        <label>Semester</label>
        <input type="number" name="semester" min="1" max="8" placeholder="1 - 8" required>

        <button type="submit">Register</button>
    </form>
    <p class="login-link">Already registered? <a href="login.jsp?role=student">Login here</a></p>
</div>

<script>

    function validateForm() {
        const emailField = document.getElementById("email");
        const email = emailField.value.trim();
        const regex = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;

        if (!regex.test(email)) {
            alert("Please enter a valid email address.");
            emailField.focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>
