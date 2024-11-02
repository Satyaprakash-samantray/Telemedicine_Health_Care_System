<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style1.css"/>
<style>
	body{
		background-image: url("tele.jpg");
		background-repeat: no-repeat;
		background-size: 100%;
	}
</style>
</head>
<body>
<div class="container">
        <h2>Login</h2>
        <form action="uloginconnect.jsp" method="post">
            <div class="form-group">
                <label for="email">email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="form-button">Login</button>
        </form>
        <p class="signup-option">Are you a new user? <a href="login.jsp" class="signup-link">Sign Up</a></p>
    </div>
</body>
</html>