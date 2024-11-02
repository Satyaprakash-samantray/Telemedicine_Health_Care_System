<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <link rel="stylesheet" href="style1.css"/>
    <style>
        body{
            background-image: url("Image/tele.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="uloginconnect.jsp" method="post">
            <div class="form-group">
                <label for="email">Email id</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="pass">Password</label>
                <input type="password" id="pass" name="pass" required>
            </div>
            <button type="submit" class="form-button">Login</button>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
        </form>
        <p class="signup-option">Are you a new user? <a href="login.jsp" class="signup-link">Register Now</a></p>
    </div>
</body>
</html>
