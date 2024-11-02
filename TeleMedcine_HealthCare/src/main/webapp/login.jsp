<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stylish User Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('Image/regiterimage.png') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            background-color: #ffffff;
            padding: 25px 35px;
            border-radius: 10px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        .container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4CAF50;
            font-size: 24px;
            font-weight: 600;
        }
        .container label {
            display: block;
            margin-bottom: 8px;
            color: #555555;
            font-weight: 500;
        }
        .container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .container input:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 8px 0 rgba(76, 175, 80, 0.2);
        }
        .container button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form action="loginRegister.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="user">Username:</label>
            <input type="text" id="uname" name="uname" required>

            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" required>

            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
